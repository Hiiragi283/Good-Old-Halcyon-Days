#====================================================================
# ファイル名 : thermal.zs
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
import mods.thermalexpansion.Compactor;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading thermal.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
		val removeCrafting as IItemStack[] = [
			<thermalexpansion:augment:*>,
			<thermalfoundation:material:512>,
			<thermalfoundation:material:513>,
			<thermalfoundation:material:514>,
			<thermalfoundation:material:515>,
			<thermalfoundation:material:640>,
		];
		for i in removeCrafting {
			HiiragiUtils.removeCrafting(i);
		}
		val removeCraftingByName as string[] = [
			"thermalinnovation:drill",
			"thermalinnovation:saw",
		];
		for i in removeCraftingByName {
			recipes.removeByRecipeName(i);
		}
	//上書き
		HiiragiUtils.addCraftingShaped(true, <thermalexpansion:frame>, RecipePattern.init(["ABA", "BCB", "DBD"]).map({A:<ore:ingotInvar>, B:<dcs_climate:dcs_build_selenite:3>, C:<ore:gearToolSteel>, D:<ore:ingotSteel>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <thermalexpansion:frame>*3, RecipePattern.init(["ABA", "BCB", "DBD"]).map({A:<ore:ingotToolSteel>, B:<ore:fusedQuartz>, C:<ore:gearToolSteel>, D:<ore:ingotStainlessSteel>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <thermalexpansion:frame:64>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:ingotSilver>, B:<ore:ingotTin>, C:<ore:blockGlassHardened>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(false, <thermalexpansion:frame:64>*3, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:ingotNickelsilver>, B:<ore:ingotLead>, C:<ore:fusedQuartz>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <thermalfoundation:material:656>, RecipePattern.init(["  A", "AB ", "CA "]).map({A:<ore:ingotToolSteel>, B:<ore:gearToolSteel>, C:<ore:blockToolSteel>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <thermalfoundation:material:657>, RecipePattern.init([" A ", "ABA", " A "]).map({A:<ore:bladeToolSteel>, B:<ore:gearToolSteel>}).ingredients, null, null);

		for i in 0 to 15 {
			HiiragiUtils.addCraftingShapeless(true, <thermalfoundation:rockwool>.definition.makeStack(i), [<ore:blockRockwool>, HiiragiUtils.dyeList[i]], null, null);
		}
	//新規

//AWレシピの編集
	//import
	//新規

//Compactor
	mods.thermalexpansion.Compactor.addPressRecipe(<enderio:item_material:71>, <ore:dustBedrock>.firstItem*5, 8000);

//このscriptの読み込みの完了をログに出力
print("thermal.zs loaded!");
