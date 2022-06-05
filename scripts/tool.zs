#======================================================================
# ファイル名 : tool.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : このファイルについて書く
#======================================================================

#priority 90

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading tool.zs ...");

//変数の定義
	val toRemove as IItemStack[] = [];
	for i in toRemove {
		HiiragiUtils.removeCrafting(i);
	}

	val toolTier as IItemStack[][string] = {
    "gohd.tooltip.tool.common.name": [],
	"gohd.tooltip.tool.uncommon.name": [],
	"gohd.tooltip.tool.rare.name": [],
	"gohd.tooltip.tool.epic.name": [],
	"gohd.tooltip.tool.legendary.name": [],
	"gohd.tooltip.tool.mythic.name": [],
	};
	for i, j in toolTier {
		for k in j {
			k.addTooltip(I18n.format(i));
		}
	}

//作業台レシピの編集
	//削除
		val removeCrafting as IItemStack[] = [];
		for i in removeCrafting {
			HiiragiUtils.removeCrafting(i);
		}

		val removeByName as string[] = [
			"dcs_climate:main_equip/dcs_axe_sapphire_0_2",
			"dcs_climate:main_equip/dcs_pickaxe_sapphire_0_2",
			"dcs_climate:main_equip/dcs_spade_sapphire_0_2",
			"dcs_climate:main_equip/dcs_axe_garnet_0_2",
			"dcs_climate:main_equip/dcs_pickaxe_garnet_0_2",
			"dcs_climate:main_equip/dcs_spade_garnet_0_2",
			"dcs_climate:main_equip/dcs_axe_garnet_0_2",
			"dcs_climate:main_equip/dcs_scythe_garnet_0_2",
		];
		for i in removeByName {
			recipes.removeByRecipeName(i);
		}
    //上書き
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

//このscriptの読み込みの完了をログに出力
print("tool.zs loaded!");
