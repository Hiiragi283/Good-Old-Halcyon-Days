#====================================================================
# Name   : thermal.zs
# Author : Hiiragi R. Tsubasa: https://github.com/Hiiragi283
# Info   : Scripts for Thermal Series
#====================================================================

#priority 0

//Classのimport
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.recipes.IRecipeAction;
import crafttweaker.recipes.IRecipeFunction;
import mods.ctintegration.util.RecipePattern;
import mods.thermalexpansion.Centrifuge;
import mods.zenutils.HexHelper;
import mods.zenutils.I18n;
import scripts.grassUtils.RecipeUtils;
import scripts.HiiragiUtils;

//読み込みの開始をログに出力
print("Start loading thermal.zs ...");

//Centrifuge (Mob)
	mods.thermalexpansion.Centrifuge.addRecipeMob(<entity:tconstruct:blueslime>, [<tconstruct:edible:1>], <liquid:experience>*40, 4000, 5);
	mods.thermalexpansion.Centrifuge.addRecipeMob(<entity:twilightforest:adherent>, [<twilightforest:cube_talisman>], <liquid:experience>*100, 4000, 5);

//読み込みの完了をログに出力
print("thermal.zs loaded!");
