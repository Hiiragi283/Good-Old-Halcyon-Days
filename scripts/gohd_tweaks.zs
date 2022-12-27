#====================================================================
# Name   : gohd_tweaks.zs
# Author : Hiiragi R. Tsubasa: https://github.com/Hiiragi283
# Info   : Template for script files
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
import mods.zenutils.HexHelper;
import mods.zenutils.I18n;
import scripts.grassUtils.RecipeUtils;
import scripts.HiiragiUtils;

//読み込みの開始をログに出力
print("Start loading gohd_tweaks.zs ...");

//Crafting Recipes
	HiiragiUtils.addShaped(<gohd_tweaks:parts_assembly:0>, RecipePattern.init([" A ", "BCB", " D "]).map({A:ToolKnife, B:<ore:dustRedstone>, C:<ore:crystalPureCertusQuartz>, D:<ore:itemSilicon>}).ingredients, null, null);
	HiiragiUtils.addShaped(<gohd_tweaks:parts_assembly:1>, RecipePattern.init([" A ", "BCB", " D "]).map({A:ToolKnife, B:<ore:dustRedstone>, C:<ore:gemDiamond>, D:<ore:itemSilicon>}).ingredients, null, null);
	HiiragiUtils.addShaped(<gohd_tweaks:parts_assembly:2>, RecipePattern.init([" A ", "BCB", " D "]).map({A:ToolKnife, B:<ore:dustRedstone>, C:<ore:ingotGold>, D:<ore:itemSilicon>}).ingredients, null, null);
	HiiragiUtils.addShaped(<gohd_tweaks:parts_assembly:3>, RecipePattern.init([" A ", "BCB", " D "]).map({A:ToolKnife, B:<ore:dustRedstone>, C:<threng:material:5>, D:<ore:itemSilicon>}).ingredients, null, null);
	HiiragiUtils.addShaped(<gohd_tweaks:parts_assembly:4>, RecipePattern.init([" A ", "BCB", " D "]).map({A:ToolKnife, B:<ore:dustRedstone>, C:<threng:material:13>, D:<ore:itemSilicon>}).ingredients, null, null);

//読み込みの完了をログに出力
print("gohd_tweaks.zs loaded!");
