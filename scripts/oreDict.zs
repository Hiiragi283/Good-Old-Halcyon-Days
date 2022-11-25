#====================================================================
# Name   : oreDict.zs
# Author : Hiiragi R. Tsubasa: https://github.com/Hiiragi283
# Info   : Tweaking ore dictionary
#====================================================================

#priority 99

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
print("Start loading oreDict.zs ...");

//鉱石辞書の編集
for i in loadedMods["artifacts"].items {
	HiiragiUtils.tweakOreDict(i, [], [<ore:itemArtifact>]);
}

//読み込みの完了をログに出力
print("oreDict.zs loaded!");
