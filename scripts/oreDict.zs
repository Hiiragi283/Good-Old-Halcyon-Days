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

HiiragiUtils.tweakOreDict(<biomesoplenty:filled_honeycomb>, [<ore:dropHoney>], []);
HiiragiUtils.tweakOreDict(<dcs_climate:dcs_ore_gemblock:4>, [<ore:blockSapphire>], []);

HiiragiUtils.tweakOreDict(<astraladditions:block_starmetal>, [], [<ore:blockAstralStarmetal>]);
HiiragiUtils.tweakOreDict(<astralsorcery:blockcustomore>, [], [<ore:oreRockCrystal>]);
HiiragiUtils.tweakOreDict(<botania:manaresource:19>, [], [<ore:nuggetElvenElementium>]);
HiiragiUtils.tweakOreDict(<botania:manaresource:2>, [], [<ore:gemManaDiamond>]);
HiiragiUtils.tweakOreDict(<botania:manaresource:22>, [], [<ore:itemCloth>]);
HiiragiUtils.tweakOreDict(<botania:manaresource:9>, [], [<ore:gemDragonStone>]);
HiiragiUtils.tweakOreDict(<botania:storage:0>, [], [<ore:blockManasteel>]);
HiiragiUtils.tweakOreDict(<botania:storage:1>, [], [<ore:blockTerrasteel>]);
HiiragiUtils.tweakOreDict(<botania:storage:2>, [], [<ore:blockElvenElementium>]);
HiiragiUtils.tweakOreDict(<botania:storage:3>, [], [<ore:blockManaDiamond>]);
HiiragiUtils.tweakOreDict(<botania:storage:4>, [], [<ore:blockDragonstone>]);
//HiiragiUtils.tweakOreDict(<dcs_climate:dcs_ore_gemblock:10>, [], [<ore:blockPeridot>]);
HiiragiUtils.tweakOreDict(<thermalfoundation:material:832>, [], [<ore:dropRosin>]);
HiiragiUtils.tweakOreDict(<thermalfoundation:material:833>, [], [<ore:dropCoaltar>]);
HiiragiUtils.tweakOreDict(<thermalfoundation:material:864>, [], [<ore:gemSlag>]);
HiiragiUtils.tweakOreDict(<thermalfoundation:storage_resource:1>, [], [<ore:blockCoke>]);
HiiragiUtils.tweakOreDict(<twilightforest:block_storage:0>, [], [<ore:blockIronwood>]);

for i in loadedMods["artifacts"].items {
	HiiragiUtils.tweakOreDict(i, [], [<ore:itemArtifact>]);
}

//読み込みの完了をログに出力
print("oreDict.zs loaded!");
