#====================================================================
# ファイル名 : projecte.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts ofr ProjectE and its addon
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

//各種modからclassをimport
import mods.ctintegration.projecte.EMCManager;
import mods.ctintegration.util.RecipePattern;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading projecte.zs ...");

//作業台レシピの編集
recipes.removeByMod("projectex");
	//上書き
	//新規

//MECの編集
	//MECの読み込み
	EMCManager.mapEMC();
	//EMCの削除
	/*val removeMod as string[] = [
		"minecraft",
		"appliedenergistics2",
		"akashictome",
		"artisanworktables",
		"betterquesting",
		"questbook",
		"bibliocraft",
		"biomesoplenty",
		"buildinggadgets",
		"chisel",
		"contenttweaker",
		"ezstorage",
		"enderio",
		"extendedcrafting",
		"extrautils2",
		"dcs_climate",
		"hap",
		"inspirations",
		"mechanics",
		"mekanism",
		"mekanismgenerators",
		"mekanismtools",
		"openblocks",
		"pickletweaks",
		"railcraft",
		"storagedrawers",
		"twilightforest",
		"thermaldynamics",
		"thermalexpansion",
		"thermalfoundation",
		"thermalinnovation",
		"tcomplement",
		"tconstruct",
		"tconevo",
		"libvulpes",
	];
	for i in removeMod {
		for j in loadedMods[i].items {
			if(EMCManager.isEMCSet(j)) {
				j.emc = 0;
			}
		}
	}*/

//このscriptの読み込みの完了をログに出力
print("projecte.zs loaded!");
