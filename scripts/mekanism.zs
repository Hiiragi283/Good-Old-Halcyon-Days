#====================================================================
# ファイル名 : mekanism.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : このファイルについて書く
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading mekanism.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
		val removeCrafting as IItemStack[] = [
			/*<mekanism:machineblock:5>,
			<mekanism:machineblock:6>,
			<mekanism:machineblock:7>,*/
		];
		for i in removeCrafting {
			HiiragiUtils.removeCrafting(i);
		}
		val removeCraftingByName as string[] = [
			"mekanism:machineblock_5",
			"mekanism:machineblock_5_alt",
			"mekanism:machineblock_5_alt_alt",
			"mekanism:machineblock_5_alt_alt_alt",
			"mekanism:machineblock_5_alt_alt_alt_alt",
			"mekanism:machineblock_5_alt_alt_alt_alt_alt",
			"mekanism:machineblock_5_alt_alt_alt_alt_alt_alt",
			"mekanism:machineblock_5_alt_alt_alt_alt_alt_alt_alt",
			"mekanism:machineblock_5_alt_alt_alt_alt_alt_alt_alt_alt",
			"mekanism:machineblock_6",
			"mekanism:machineblock_6_alt",
			"mekanism:machineblock_6_alt_alt",
			"mekanism:machineblock_6_alt_alt_alt",
			"mekanism:machineblock_6_alt_alt_alt_alt",
			"mekanism:machineblock_6_alt_alt_alt_alt_alt",
			"mekanism:machineblock_6_alt_alt_alt_alt_alt_alt",
			"mekanism:machineblock_6_alt_alt_alt_alt_alt_alt_alt",
			"mekanism:machineblock_6_alt_alt_alt_alt_alt_alt_alt_alt",
			"mekanism:machineblock_7",
			"mekanism:machineblock_7_alt",
			"mekanism:machineblock_7_alt_alt",
			"mekanism:machineblock_7_alt_alt_alt",
			"mekanism:machineblock_7_alt_alt_alt_alt",
			"mekanism:machineblock_7_alt_alt_alt_alt_alt",
			"mekanism:machineblock_7_alt_alt_alt_alt_alt_alt",
			"mekanism:machineblock_7_alt_alt_alt_alt_alt_alt_alt",
			"mekanism:machineblock_7_alt_alt_alt_alt_alt_alt_alt_alt",
		];
		for i in removeCraftingByName {
			recipes.removeByRecipeName(i);
		}
	//上書き

	HiiragiUtils.addCraftingShaped(true, <mekanism:tierinstaller:0>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:sheetHDPE>, B:<ore:ingotStainlessSteel>, C:<ore:circuitBasic>}).ingredients, null, null);
	val installer as string[] = [
		"Advanced",
		"Elite",
		"Ultimate"
	];
	for i in 0 to 3 {
		HiiragiUtils.addCraftingShaped(true, <mekanism:tierinstaller>.definition.makeStack(i+1), RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:sheetHDPE>, B:oreDict["alloy" ~ installer[i]], C:oreDict["circuit" ~ installer[i]]}).ingredients, null, null);
	}
	//新規

//AWレシピの編集
	//import
	//新規

//このscriptの読み込みの完了をログに出力
print("mekanism.zs loaded!");
