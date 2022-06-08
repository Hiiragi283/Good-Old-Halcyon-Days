#======================================================================
# ファイル名 : materialRecipes.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : このファイルについて書く
#======================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import mods.techreborn.plateBendingMachine;
import mods.techreborn.rollingMachine;
import mods.techreborn.wireMill;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading materialRecipes.zs ...");

//変数の定義

//作業台レシピの編集
	//Small Dust
		val listDustSmall as string[] = [
			"Graphite",
			"GalliumArsenide",
			"Arsenic",
			"Indium",
			"IndiumGalliumPhosphide",
			"Alumina",
			"Rutile",
			"Illumenite",
			"Chromite",
			"StainlessSteel",
			"Magnetite",
			"Cobalt",
			"Cobaltite",
			"Hafnium",
			"Tantalum",
			"TantalumPentoxide",
			"Tantalite",
			"TungstenCarbide",
			"Tungstate",
			"Osmium",
			"Uraninite",
			"RockSalt",
			"Beryllium",
			"Magnalium",
			"Magnesia",
			"CertusQuartz",
			"Quartz",
			"RedstoneAlloy"
		];
		for i in listDustSmall {
			if(!isNull(oreDict["dust" ~ i].firstItem) && !isNull(oreDict["dustSmall" ~ i].firstItem)) {
				HiiragiUtils.addCrafting(false, false, oreDict["dust" ~ i].firstItem, RecipePattern.init(["AA", "AA"]).map({A:oreDict["dustSmall" ~ i]}).ingredients);
				HiiragiUtils.addCrafting(true, false, oreDict["dustSmall" ~ i].firstItem*4, [[oreDict["dust" ~ i]]]);
			}
		}

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

	//Cable
		/*mods.techreborn.wireMill.removeAll();
		val listWire as string[] = [
			"Copper",
			"RefinedIron",
			"Tin",
			"Gold",
		];
		for i in listWire {
			if(!isNull(oreDict["cable" ~ i].firstItem) && !isNull(oreDict["ingot" ~ i].firstItem)) {
				mods.techreborn.wireMill.addRecipe(oreDict["cable" ~ i].firstItem*3, oreDict["ingot" ~ i], 2*20, HiiragiUtils.voltageTier[0]);
			}
		}*/

	//Ingot, Block
		val listIngot as string[] = [
			"StainlessSteel",
			"TungstenCarbide",
			"Beryllium",
			"Magnalium",
			"RedstoneAlloy"
		];
		for i in listIngot {
			if(!isNull(oreDict["ingot" ~ i].firstItem) && !isNull(oreDict["block" ~ i].firstItem)) {
				HiiragiUtils.addCrafting(false, false, oreDict["block" ~ i].firstItem, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:oreDict["ingot" ~ i]}).ingredients);
				HiiragiUtils.addCrafting(true, false, oreDict["ingot" ~ i].firstItem*9, [[oreDict["block" ~ i]]]);
			}
		}

	//Plate
		mods.techreborn.plateBendingMachine.removeAll();
		val materialPlateMetal as string[] = [
			"TitaniumAluminide",
			"TitaniumIridium",
			"Iron",
			"Gold",
			"Aluminum",
			"Brass",
			"Bronze",
			"Chrome",
			"Copper",
			"Electrum",
			"Invar",
			"Iridium",
			"Lead",
			"Nickel",
			"Platinum",
			"Silver",
			"Steel",
			"Tin",
			"Titanium",
			"Tungsten",
			"Tungstensteel",
			"Zinc",
			"RefinedIron",
			"Magnalium",
			"Constantan",
			"Mithril",
			"Signalum",
			"Lumium",
			"Enderium",
		];
		for i in materialPlateMetal {
			var plate as IOreDictEntry = oreDict["plate" ~ i];
			var ingot as IOreDictEntry = oreDict["ingot" ~ i];
			recipes.replaceAllOccurences(plate, ingot);
			for j in plate.items {
				HiiragiUtils.removeFromJEI(j);
			}
		}

		val materialPlateGem as string[] = [
			"Diamond",
			"Emerald",
			"Coal",
			"Ruby",
			"Sapphire",
			"Peridot",
			"RedGarnet",
			"YellowGarnet",
		];
		for i in materialPlateGem {
			var plate as IOreDictEntry = oreDict["plate" ~ i];
			var gem as IOreDictEntry = oreDict["gem" ~ i];
			recipes.replaceAllOccurences(plate, gem);
			for j in plate.items {
				HiiragiUtils.removeFromJEI(j);
			}
		}

		HiiragiUtils.removeFromJEI(<techreborn:plates:3>);
		HiiragiUtils.removeFromJEI(<techreborn:plates:4>);
		HiiragiUtils.removeFromJEI(<techreborn:plates:9>);
		HiiragiUtils.removeFromJEI(<techreborn:plates:10>);

//このscriptの読み込みの完了をログに出力
print("materialRecipes.zs loaded!");
