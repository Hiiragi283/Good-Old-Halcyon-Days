#======================================================================
# name : artisan.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Write about this script file
#======================================================================

#priority 0

#crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

#各種modからclassをimport
import mods.ctintegration.util.RecipePattern;
import mods.gregtech.recipe.RecipeMap;

#scriptのimport
import scripts.HiiragiUtils;

#このscriptの読み込みの開始をログに出力
print("Start loading artisan.zs ...");

#変数の定義

#作業台レシピの編集
##削除
val removeCrafting as IItemStack[] = [];
for i in removeCrafting {
    HiiragiUtils.removeCrafting(i);
}
##上書き
##新規
HiiragiUtils.addCrafting(false, false, <artisanworktables:workstation:5>, RecipePattern.init([" A ", "BCB", " D "]).map({A:<ore:chest>, B:<tconstruct:seared_tank:*>, C:<ore:workbench>, D:<tconstruct:seared:*>}).ingredients);
HiiragiUtils.addCrafting(false, false, <artisanworktables:toolbox>, RecipePattern.init([" A ", "ABA", " A "]).map({A: <ore:plateWood>, B:<ore:chest>}).ingredients);
HiiragiUtils.addCrafting(false, false, <artisanworktables:mechanical_toolbox>, RecipePattern.init([" A ", "ABA", " A "]).map({A: <ore:plateTreatedWood>, B:<artisanworktables:toolbox>}).ingredients);
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

/*
<recipemap:name>.recipeBuilder()
    .inputs([])
    .outputs()
    .duration()
    .EUt()
    .buildAndRegister();
*/

#このscriptの読み込みの完了をログに出力
print("artisan.zs loaded!");
