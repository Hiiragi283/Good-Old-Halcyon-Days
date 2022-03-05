#======================================================================
# name : gregtech.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Write about this script file
#======================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.ctintegration.util.RecipePattern;
import mods.gregtech.recipe.RecipeMap;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading gregtech.zs ...");

//変数の登録
val metaItem as IItemStack = <gregtech:meta_item_1>;

//レシピの編集
//全般

recipes.remove(HiiragiUtils.gregItem(350));
HiiragiUtils.addCrafting(true, false, <contenttweaker:grout_dust>*4, [[<ore:GT.tool.mortar>, <tconstruct:soil:0>]]);

//Bronze Age

<recipemap:alloy_smelter>.recipeBuilder()
    .inputs([<ore:dustGrout>, <ore:dustBrick>])
    .outputs(<tcomplement:materials:1>*2)
    .duration(4*20)
    .EUt(4)
    .buildAndRegister();

//LV Age

//MV Age

//HV Age

//EV Age

//IV Age

//LuV Age

//ZPM Age

//UV-UHV Age

//このscriptの読み込みの完了をログに出力
print("gregtech.zs loaded!");
