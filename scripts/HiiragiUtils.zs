#======================================================================
# name : HiiragiUtils.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Registry useful functions
#        Some scripts are partially referred to GrassUtils
#        -> https://github.com/friendlyhj/GrassUtils
#======================================================================

#priority 99

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;

//各種modからclassをimport
import mods.jei.JEI.hide;
import mods.jei.JEI.removeAndHide;
import mods.zenutils.I18n;

//このscriptの読み込みの開始をログに出力
print("Start loading HiiragiUtils.zs ...");

//変数の定義

//レシピの編集

//代入されたIItemStackから名前を生成する
function getNameItem (item as IItemStack) as string {
    var owner as string = item.definition.owner;
    var id as string = item.definition.id.split(":")[1];
    var meta as int = item.metadata;
    return (owner ~ "_" ~ id ~ "_" ~ meta);
} 

//代入されたILiquidStackから名前を生成する
function getNameLiquid (fluid as ILiquidStack) as string {
    var name as string = fluid.name;
    return ("liquid_" ~ name);
} 

//代入されたIItemStackに紐づけされた鉱石辞書を取得し、それを削除する
function removeOreDict (item as IItemStack) {
    if (!isNull(item.ores)) {
        var oredict = item.ores;
        for i in oredict {
            i.remove(item);
        }
    }
}

//代入されたIItemStackをJEIから隠す
function hideFromJEI (item as IItemStack) {
    mods.jei.JEI.hide(item);
    item.addTooltip(I18n.format("gohd.tooltip.hided.name"));
}

//代入されたIItemStackをJEIから隠し、レシピを削除する
function removeFromJEI (item as IItemStack) {
    mods.jei.JEI.removeAndHide(item);
    item.addTooltip(I18n.format("gohd.tooltip.removed.name"));
}

//Make crafting recipe pattern
/*
function recipePattern (shapeless as bool, pattern as string[], map as IIngredient[string]) as IIngredient[][] {
    if (!shapeless) {
        return RecipePattern.init(pattern).map(map).ingredients;
    } else {
        return RecipePattern.init(pattern).map(map).shapelessIngredients;
    }
}
*/

//レシピ名を自動的に生成しつつレシピを登録する
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

//自動的に古いレシピを削除する機能を備えた関数

function addFurnace (remove as bool, output as IItemStack, input as IIngredient) {
    if (remove) {
        furnace.remove(output);
    }
    furnace.addRecipe(output, input);
}

//メタデータから自動的にIItemStackを返す関数 (毎回"meta_item_1"って打つのだるい)
function gregItem (i as int) as IItemStack {
    return <gregtech:meta_item_1>.definition.makeStack(i);
}

//代入した文字列から特定の鋳型を返す

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

//このscriptの読み込みの完了をログに出力
print("HiiragiUtils.zs loaded!");
