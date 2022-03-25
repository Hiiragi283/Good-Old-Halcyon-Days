#======================================================================
# name : HiiragiUtils.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Registry useful functions
#        Some scripts are partially referred to GrassUtils
#        -> https://github.com/friendlyhj/GrassUtils
#======================================================================

#priority 99

//crafttweakerからclassをimport
import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.recipes.IRecipeFunction;

//各種modからclassをimport
import mods.jei.JEI.hide;
import mods.jei.JEI.removeAndHide;
import mods.thaumcraft.ArcaneWorkbench;
import mods.zenutils.HexHelper;
import mods.zenutils.I18n;
import thaumcraft.aspect.CTAspectStack;

//このscriptの読み込みの開始をログに出力
print("Start loading HiiragiUtils.zs ...");

//代入されたIItemStackから名前を生成する関数
    function getNameItem (item as IItemStack) as string {
        var owner as string = item.definition.owner;
        var id as string = item.definition.id.split(":")[1];
        var meta as int = item.metadata;
        return (owner ~ "_" ~ id ~ "_" ~ meta);
    } 

//代入されたILiquidStackから名前を生成する関数
    function getNameLiquid (fluid as ILiquidStack) as string {
        var name as string = fluid.name;
        return ("liquid_" ~ name);
    }

//代入されたIItemStackに紐づけされた鉱石辞書を取得し、それを削除する関数
    function removeOreDict (item as IItemStack) {
        if (!isNull(item.ores)) {
            var oredict = item.ores;
            for i in oredict {
                i.remove(item);
            }
        }
    }

//代入されたIItemStackをJEIから隠す関数
    function hideFromJEI (item as IItemStack) {
        mods.jei.JEI.hide(item);
        item.addTooltip(I18n.format("gohd.tooltip.hided.name"));
    }

//代入されたIItemStackをJEIから隠し、レシピを削除する関数
    function removeFromJEI (item as IItemStack) {
        mods.jei.JEI.removeAndHide(item);
        item.addTooltip(I18n.format("gohd.tooltip.removed.name"));
    }

//レシピ名を自動的に生成しつつレシピを登録する関数
    static recipeID as int = 0;
    function addCrafting (shapeless as bool, remove as bool, output as IItemStack, input as IIngredient[][]) {
        var recipeName as string = getNameItem(output) ~ "_" ~ recipeID;
        if (remove) {
            recipes.remove(output, true);
        }
        if (!shapeless) {
            recipes.addShaped(recipeName, output, input);
        } else {
            recipes.addShapeless(recipeName, output, input[0]);
        }
        recipeID += 1;
    }
    function removeCrafting (output as IItemStack) {
        recipes.remove(output, true);
    }

    function addCraftingArcane (shapeless as bool, remove as bool, research as string, vis as int, aspects as CTAspectStack[], output as IItemStack, input as IIngredient[][]) {
        var recipeNameArcane as string = getNameItem(output) ~ "_" ~ recipeID;
        if (remove) {
            mods.thaumcraft.ArcaneWorkbench.removeRecipe(output);
        }
        if (!shapeless) {
            mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe(recipeNameArcane, research, vis, aspects, output, input);
        } else {
            mods.thaumcraft.ArcaneWorkbench.registerShapelessRecipe(recipeNameArcane, research, vis, aspects, output, input[0]);
        }
        recipeID += 1;
    }

//アイテムの等価交換を実装するレシピ
    function addCraftingConv (item1 as IItemStack, item2 as IItemStack) {
        var recipeName1 as string = getNameItem(item1) ~ "_" ~ recipeID;
        var recipeName2 as string = getNameItem(item2) ~ "_" ~ recipeID;
        recipes.addShapeless(recipeName1, item1, [item2]);
        recipes.addShapeless(recipeName2, item2, [item1]);
    }

//自動的に古いレシピを削除する機能を備えた関数
    function addFurnace (remove as bool, output as IItemStack, input as IIngredient) {
        if (remove) {
            furnace.remove(output);
        }
        furnace.addRecipe(output, input);
    }
    function removeFurnace (output as IItemStack) {
        furnace.remove(output);
    }

//代入した文字列から特定の鋳型を返す関数
    function castClay (pattern as string) as IItemStack {
        if (isNull(pattern)) {
            return <tconstruct:clay_cast>;
        } else if (pattern == "chisel_head") {
            return <tconstruct:clay_cast>.withTag({PartType:"tcomplement:chisel_head"});
        } else
            var patternName = "tconstruct:" + pattern;
            return <tconstruct:clay_cast>.withTag({PartType:patternName});
    }

    function castBrass (pattern as string) as IItemStack {
        if (isNull(pattern)) {
            return <tconstruct:cast>;
        } else if (pattern == "chisel_head") {
            return <tconstruct:cast>.withTag({PartType:"tcomplement:chisel_head"});
        } else if (pattern == "ingot") {
            return <tconstruct:cast_custom:0>;
        } else if (pattern == "nugget") {
            return <tconstruct:cast_custom:1>;
        } else if (pattern == "gem") {
            return <tconstruct:cast_custom:2>;
        } else if (pattern == "plate") {
            return <tconstruct:cast_custom:3>;
        } else if (pattern == "gear") {
            return <tconstruct:cast_custom:4>;
        } else
            var patternName = "tconstruct:" + pattern;
            return <tconstruct:cast>.withTag({PartType:patternName});
    }

//アイテムに付与されたNBTタグを継承する
function inheritStatus(armorUpgrade as IItemStack) as IRecipeFunction {
    return function(out, ins, cInfo){
        if(!ins.armor.hasTag) {
            return armorUpgrade;
        } else {
            var nbt as IData = ins.armor.tag;
            return armorUpgrade.withTag(nbt);
        }
    };
}

//このscriptの読み込みの完了をログに出力
print("HiiragiUtils.zs loaded!");
