#======================================================================
# name : minecraft.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Scripts for Minecraft
#======================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import mods.gregtech.recipe.RecipeMap;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading minecraft.zs ...");

//変数の定義

//作業台レシピの編集
    //削除
        val removeCrafting as IItemStack[] = [
        ];
        for i in removeCrafting {
            HiiragiUtils.removeCrafting(i);
        }
    //上書き
        HiiragiUtils.addCrafting(false, true, <minecraft:furnace>, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<ore:cobblestone>, B:<ore:nitor>}).ingredients);

        for i in 0 to 15 {
            HiiragiUtils.addCrafting(false, true, <minecraft:bed>.definition.makeStack(i), RecipePattern.init(["ABB", "CCC", "DED"]).map({A:<minecraft:wool>, B:<minecraft:carpet>.definition.makeStack(i), C:<ore:slabWood>, D:<ore:fenceWood>, E:<ore:GT.tool.hammer.soft>}).ingredients);
        }
    //新規

//かまどレシピの編集
    //削除
        val removeFurnace as IItemStack[] = [];
        for i in removeFurnace {
            HiiragiUtils.removeFurnace(i);
        }
    //新規
        val addFurnace as IIngredient[IItemStack] = {};
        for output, input in addFurnace {
            HiiragiUtils.addFurnace(false, output, input);
        }

//AWレシピの編集
    //import
    //新規

//GTレシピの編集
    //削除
        <recipemap:assembler>.findRecipe(7, [<minecraft:mossy_cobblestone:0> * 8, <metaitem:circuit.integrated>.withTag({Configuration: 8})], null).remove();
    //上書き
    //新規

/*
<recipemap:name>.recipeBuilder()
    .inputs([])
    .outputs()
    .duration()
    .EUt()
    .buildAndRegister();
*/

//このscriptの読み込みの完了をログに出力
print("minecraft.zs loaded!");
