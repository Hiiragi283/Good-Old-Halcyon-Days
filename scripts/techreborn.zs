#======================================================================
# ファイル名 : techreborn.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : このファイルについて書く
#======================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import mods.techreborn.compressor;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading techreborn.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
		val removeCrafting as IItemStack[] = [

		];
		for i in removeCrafting {
			HiiragiUtils.removeCrafting(i);
		}
	//上書き
		//Machine Casing
			HiiragiUtils.addCrafting(false, true, <techreborn:machine_casing:0>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:ingotNickelsilver>, B:<ore:ingotAluminum>, C:<techreborn:machine_frame:0>}).ingredients);
			HiiragiUtils.addCrafting(false, true, <techreborn:machine_casing:1>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:ingotSteel>, B:<ore:plateSilicon>, C:<techreborn:machine_casing:0>}).ingredients);
			HiiragiUtils.addCrafting(false, true, <techreborn:machine_casing:2>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:ingotTungstensteel>, B:<ore:ingotChrome>, C:<techreborn:machine_casing:1>}).ingredients);
		//Glass Fiber
			//Redstone & Silver
				HiiragiUtils.addCrafting(false, true, <techreborn:cable:4>*3, RecipePattern.init(["AAA", "BCB", "AAA"]).map({A:<ore:fusedGlass>, B:<ore:ingotSilver>, C:<ore:dustRedstone>}).ingredients);
				HiiragiUtils.addCrafting(false, true, <techreborn:cable:4>*6, RecipePattern.init(["AAA", "BCB", "AAA"]).map({A:<ore:fusedQuartz>, B:<ore:ingotSilver>, C:<ore:dustRedstone>}).ingredients);
				HiiragiUtils.addCrafting(false, true, <techreborn:cable:4>*9, RecipePattern.init(["AAA", "BCB", "AAA"]).map({A:<dcs_climate:dcs_synthetic:2>, B:<ore:ingotSilver>, C:<ore:dustRedstone>}).ingredients);
			//Redstone & BSCCO
				HiiragiUtils.addCrafting(false, true, <techreborn:cable:4>*6, RecipePattern.init(["AAA", "BCB", "AAA"]).map({A:<ore:fusedGlass>, B:<ore:ingotBSCCO>, C:<ore:dustRedstone>}).ingredients);
				HiiragiUtils.addCrafting(false, true, <techreborn:cable:4>*12, RecipePattern.init(["AAA", "BCB", "AAA"]).map({A:<ore:fusedQuartz>, B:<ore:ingotBSCCO>, C:<ore:dustRedstone>}).ingredients);
				HiiragiUtils.addCrafting(false, true, <techreborn:cable:4>*18, RecipePattern.init(["AAA", "BCB", "AAA"]).map({A:<dcs_climate:dcs_synthetic:2>, B:<ore:ingotBSCCO>, C:<ore:dustRedstone>}).ingredients);
			//Energium & Silver
				HiiragiUtils.addCrafting(false, true, <techreborn:cable:4>*4, RecipePattern.init(["AAA", "BCB", "AAA"]).map({A:<ore:fusedGlass>, B:<ore:ingotSilver>, C:<ore:dustEnergium>}).ingredients);
				HiiragiUtils.addCrafting(false, true, <techreborn:cable:4>*8, RecipePattern.init(["AAA", "BCB", "AAA"]).map({A:<ore:fusedQuartz>, B:<ore:ingotSilver>, C:<ore:dustEnergium>}).ingredients);
				HiiragiUtils.addCrafting(false, true, <techreborn:cable:4>*12, RecipePattern.init(["AAA", "BCB", "AAA"]).map({A:<dcs_climate:dcs_synthetic:2>, B:<ore:ingotSilver>, C:<ore:dustEnergium>}).ingredients);
			//Energium & BSCCO
				HiiragiUtils.addCrafting(false, true, <techreborn:cable:4>*8, RecipePattern.init(["AAA", "BCB", "AAA"]).map({A:<ore:fusedGlass>, B:<ore:ingotBSCCO>, C:<ore:dustEnergium>}).ingredients);
				HiiragiUtils.addCrafting(false, true, <techreborn:cable:4>*16, RecipePattern.init(["AAA", "BCB", "AAA"]).map({A:<ore:fusedQuartz>, B:<ore:ingotBSCCO>, C:<ore:dustEnergium>}).ingredients);
				HiiragiUtils.addCrafting(false, true, <techreborn:cable:4>*32, RecipePattern.init(["AAA", "BCB", "AAA"]).map({A:<dcs_climate:dcs_synthetic:2>, B:<ore:ingotBSCCO>, C:<ore:dustEnergium>}).ingredients);
		//Machine Frame
			HiiragiUtils.addCrafting(false, true, <techreborn:machine_frame:2>, RecipePattern.init(["AAA", "A A", "AAA"]).map({A:<ore:ingotTungstensteel>}).ingredients);
		//Wrench
			HiiragiUtils.addCrafting(false, true, <techreborn:wrench>, RecipePattern.init(["A A", " B ", " B "]).map({A:<ore:ingotIron>, B:<ore:ingotBronze>}).ingredients);

	//新規
		HiiragiUtils.addCrafting(false, false, <armortech:iron_hammer>, RecipePattern.init(["AA ", "ABB", "AA "]).map({A:<ore:ingotIron>, B:<ore:ingotBronze>}).ingredients);
		HiiragiUtils.addCrafting(false, false, <armortech:iron_cutter>, RecipePattern.init(["A A", " B ", "B B"]).map({A:<ore:ingotIron>, B:<ore:ingotBronze>}).ingredients);
		HiiragiUtils.addCrafting(false, false, <ore:dustEnergium>.firstItem*9, RecipePattern.init(["ABA", "BAB", "ABA"]).map({A:<ore:dustRedstone>, B:<ore:dustRuby>}).ingredients);
		HiiragiUtils.addCrafting(false, false, <ore:dustLapotron>.firstItem*9, RecipePattern.init(["ABA", "BAB", "ABA"]).map({A:<ore:dustEnergium>, B:<ore:dustSapphire>}).ingredients);

//かまどレシピの編集
	//削除
		val removeFurnace as IItemStack[] = [
			<techreborn:ingot:19>,
		];
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
print("techreborn.zs loaded!");
