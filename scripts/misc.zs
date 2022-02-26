#======================================================================
# name : misc.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : scripts for mics
#======================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.ctintegration.util.RecipePattern;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading misc.zs ...");

//変数の定義

//レシピの編集
HiiragiUtils.addCrafting(false, false, <contenttweaker:saw_flint>,
    RecipePattern.init(["AAA", " BB", "   "]).map({A:<ore:stickWood>, B:<ore:itemFlint>}).ingredients);

//このscriptの読み込みの完了をログに出力
print("misc.zs loaded!");
