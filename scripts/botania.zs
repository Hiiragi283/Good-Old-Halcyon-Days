#======================================================================
# name : botania.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Scripts for Botania
#======================================================================

#priority 0

#crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

#各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import mods.gregtech.recipe.RecipeMap;

#scriptのimport
import scripts.HiiragiUtils;

#このscriptの読み込みの開始をログに出力
print("Start loading botania.zs ...");

#変数の定義

#作業台レシピの編集
##削除
val removeCrafting as IItemStack[] = [];
for i in removeCrafting {
    HiiragiUtils.removeCrafting(i);
}
##上書き
HiiragiUtils.addCrafting(false, true, <botania:lexicon>, RecipePattern.init(["AA ", "AB ", "   "]).map({A:<ore:paper>, B:<twilightforest:naga_scale>}).ingredients);
##新規

#かまどレシピの編集
##削除
val removeFurnace as IItemStack[] = [];
for i in removeFurnace {
    HiiragiUtils.removeFurnace(i);
}
##新規
val addFurnace as IIngredient[IItemStack] = {};
for output, input in addFurnace {
    HiiragiUtils.addFurnace(false, output, input);
}

#AWレシピの編集
##import
##新規

#GTレシピの編集
##削除
##上書き
##新規

#このscriptの読み込みの完了をログに出力
print("botania.zs loaded!");
