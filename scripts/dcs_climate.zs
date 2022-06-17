#======================================================================
# ファイル名 : dcs_climate.zs
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
import mods.tconstruct.Casting;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading dcs_climate.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
		val removeCrafting as IItemStack[] = [
			<dcs_climate:dcs_device_pail>,
			<dcs_climate:dcs_device_shaft_l>,
			<dcs_climate:dcs_device_shaft_ta>,
			<dcs_climate:dcs_device_shaft_tb>,
			<dcs_climate:dcs_device_shaft_x>,
			<dcs_climate:dcs_device_shaft_switch>,
			<dcs_climate:dcs_device_shaft_l_steel>,
			<dcs_climate:dcs_device_shaft_ta_steel>,
			<dcs_climate:dcs_device_shaft_tb_steel>,
			<dcs_climate:dcs_device_shaft_x_steel>,
			<dcs_climate:dcs_device_shaft_switch_steel>,
			<dcs_climate:dcs_device_shaft_l_sus>,
			<dcs_climate:dcs_device_shaft_ta_sus>,
			<dcs_climate:dcs_device_shaft_tb_sus>,
			<dcs_climate:dcs_device_shaft_x_sus>,

			<hap:shaft_l_shaped_steel>,
			<hap:shaft_bifurcated_steel>,
			<hap:shaft_perpendicular_steel>,
			<hap:shaft_t_shaped_steel>,
			<hap:shaft_x_shaped_steel>,
			<hap:shaft_l_shaped_sus>,
			<hap:shaft_bifurcated_sus>,
			<hap:shaft_perpendicular_sus>,
			<hap:shaft_t_shaped_sus>,
			<hap:shaft_x_shaped_sus>,
		];
		for i in removeCrafting {
			HiiragiUtils.removeCrafting(i);
		}

		val removeByname as string[] = [
			"dcs_climate:main_build/dcs_desktop_accessories_0_2",
			"dcs_climate:main_build/dcs_desktop_accessories_1",
			"dcs_climate:main_build/dcs_desktop_accessories_2",
			"dcs_climate:main_build/dcs_desktop_accessories_3",
			"dcs_climate:main_build/dcs_desktop_accessories_4",
			"dcs_climate:main_build/dcs_desktop_accessories_5",
			"dcs_climate:main_build/dcs_desktop_accessories_6","dcs_climate:main_build/dcs_desktop_accessories_7",
			"dcs_climate:main_build/dcs_desktop_accessories_8",
		];
		for i in removeByname {
			recipes.removeByRecipeName(i);
		}

	//上書き
		HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_bellow>, RecipePattern.init(["ABA", "BCD", "ABA"]).map({A:<ore:ingotIron>, B:<ore:itemLeather>, C:<ore:gearWood>, D:<ore:craftingPiston>}).ingredients);
		HiiragiUtils.addCrafting(false, true, <hap:reactor_advanced>, RecipePattern.init(["ABA", "CDE", "AFA"]).map({A:<ore:ingotTitanium>, B:<hap:compact_heater>, C:<enderio:item_liquid_conduit:1>, D:<dcs_climate:dcs_device_reactor>, E:<enderio:item_item_conduit>, F:<hap:compact_freezer>}).ingredients);

		recipes.replaceAllOccurences(<ore:ingotSteel>, <dcs_climate:dcs_ingot:11>, <hap:reactor_fluid_port>);
		recipes.replaceAllOccurences(<ore:ingotSteel>, <dcs_climate:dcs_ingot:11>, <hap:reactor_storage>);

		//Combustion Chamber
			HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_chamber>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:ingotBrass>, B:<tconstruct:seared:*>, C:<minecraft:blaze_rod>}).ingredients);
			HiiragiUtils.addCrafting(false, true, HiiragiUtils.changeAppear(<dcs_climate:dcs_device_chamber>, 1), RecipePattern.init(["A A", "ABA", "ACA"]).map({A:<ore:ingotSteel>, B:<ore:gemCarbide>, C:<minecraft:iron_bars>}).ingredients);
			HiiragiUtils.addCrafting(false, true, HiiragiUtils.changeAppear(<dcs_climate:dcs_device_chamber>, 2), RecipePattern.init(["A A", "ABA", "AAA"]).map({A:<railcraft:sandy>, B:<ore:fuelCoke>}).ingredients);
		//Shichirin
			HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_shitirin>, RecipePattern.init(["ABA", "ACA", "AAA"]).map({A:<minecraft:clay_ball>, B:<dcs_climate:dcs_build_plate:1>, C:<minecraft:coal:1>}).ingredients);
			HiiragiUtils.addCrafting(false, true, HiiragiUtils.changeAppear(<dcs_climate:dcs_device_shitirin>, 1), RecipePattern.init(["ABA", "ACA", "AAA"]).map({A:<minecraft:stained_hardened_clay:3>, B:<minecraft:coal:1>, C:<dcs_climate:dcs_cont_cake:2>}).ingredients);
			HiiragiUtils.addCrafting(false, true, HiiragiUtils.changeAppear(<dcs_climate:dcs_device_shitirin>, 2), RecipePattern.init(["ABA", "ACA", "AAA"]).map({A:<minecraft:stained_hardened_clay:12>, B:<minecraft:coal:1>, C:<dcs_climate:dcs_cont_cake:2>}).ingredients);
			HiiragiUtils.addCrafting(false, true, HiiragiUtils.changeAppear(<dcs_climate:dcs_device_shitirin>, 3), RecipePattern.init(["ABA", "ACA", "AAA"]).map({A:<minecraft:stained_hardened_clay:4>, B:<minecraft:coal:1>, C:<dcs_climate:dcs_cont_cake:2>}).ingredients);
		//Fluid Fuel Stove
			HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_fuelstove>, RecipePattern.init(["ABA", "CDC", "CEC"]).map({A:<ore:ingotSteel>, B:<minecraft:flint_and_steel>, C:<ore:stoneMarble>, D:<minecraft:furnace>, E:<minecraft:bucket>}).ingredients);
			HiiragiUtils.addCrafting(false, true, HiiragiUtils.changeAppear(<dcs_climate:dcs_device_fuelstove>, 1), RecipePattern.init(["ABA", "CDC", "CEC"]).map({A:<ore:ingotSteel>, B:<minecraft:flint_and_steel>, C:<dcs_climate:dcs_ore_gemblock:12>, D:<minecraft:furnace>, E:<minecraft:bucket>}).ingredients);
			HiiragiUtils.addCrafting(false, true, HiiragiUtils.changeAppear(<dcs_climate:dcs_device_fuelstove>, 2), RecipePattern.init(["ABA", "CDC", "CEC"]).map({A:<ore:ingotSteel>, B:<minecraft:flint_and_steel>, C:<dcs_climate:dcs_layer_skarn:1>, D:<minecraft:furnace>, E:<minecraft:bucket>}).ingredients);
		//Sink (Half)
			HiiragiUtils.addCrafting(false, true, HiiragiUtils.changeAppear(<dcs_climate:dcs_device_sink_half>, 1), RecipePattern.init(["A A", "AAA"]).map({A:<minecraft:stained_hardened_clay:0>}).ingredients);
			HiiragiUtils.addCrafting(false, true, HiiragiUtils.changeAppear(<dcs_climate:dcs_device_sink_half>, 2), RecipePattern.init(["ABA", "AAA"]).map({A:<botania:pavement:3>, B:<minecraft:stone:3>}).ingredients);
			HiiragiUtils.addCrafting(false, true, HiiragiUtils.changeAppear(<dcs_climate:dcs_device_sink_half>, 3), RecipePattern.init(["ABA", "AAA"]).map({A:<dcs_climate:dcs_build_build>, B:<minecraft:stone:3>}).ingredients);
		//Sink
			HiiragiUtils.addCrafting(false, true, HiiragiUtils.changeAppear(<dcs_climate:dcs_device_sink_full>, 1), RecipePattern.init(["A", "B"]).map({A:<dcs_climate:dcs_device_sink_half>, B:<dcs_climate:dcs_ore_gemblock:12>}).ingredients);
			HiiragiUtils.addCrafting(false, true, HiiragiUtils.changeAppear(<dcs_climate:dcs_device_sink_full>, 2), RecipePattern.init(["A", "B"]).map({A:<dcs_climate:dcs_device_sink_half>, B:<dcs_climate:dcs_layer_skarn:1>}).ingredients);
			HiiragiUtils.addCrafting(false, true, HiiragiUtils.changeAppear(<dcs_climate:dcs_device_sink_full>, 3), RecipePattern.init(["A", "B"]).map({A:<dcs_climate:dcs_device_sink_half>, B:<minecraft:stained_hardened_clay:9>}).ingredients);
			HiiragiUtils.addCrafting(false, true, HiiragiUtils.changeAppear(<dcs_climate:dcs_device_sink_full>, 4), RecipePattern.init([" A ", "BBB", "B B"]).map({A:<dcs_climate:dcs_device_sink_half>, B:<minecraft:iron_bars>}).ingredients);
			HiiragiUtils.addCrafting(false, true, HiiragiUtils.changeAppear(<dcs_climate:dcs_device_sink_full>, 5), RecipePattern.init(["A", "B"]).map({A:<dcs_climate:dcs_device_sink_half>, B:<dcs_climate:dcs_device_faucet_r>}).ingredients);
		//Kitchen countertop
			HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_crafting_counter>, RecipePattern.init(["AAA", "BCB", "BDB"]).map({A:<dcs_climate:dcs_build_linoleum:8>, B:<dcs_climate:dcs_ore_gemblock:6>, C:<ore:workbench>, D:<ore:chest>}).ingredients);
			HiiragiUtils.addCrafting(false, true, HiiragiUtils.changeAppear(<dcs_climate:dcs_device_crafting_counter>, 1), RecipePattern.init(["AAA", "BCB", "BDB"]).map({A:<dcs_climate:dcs_ore_gemblock:6>, B:<dcs_climate:dcs_ore_gemblock:12>, C:<dcs_climate:dcs_ore_gemblock:12>, D:<minecraft:furnace>}).ingredients);
			HiiragiUtils.addCrafting(false, true, HiiragiUtils.changeAppear(<dcs_climate:dcs_device_crafting_counter>, 2), RecipePattern.init(["AAA", "BCB", "BDB"]).map({A:<dcs_climate:dcs_layer_skarn>, B:<dcs_climate:dcs_layer_skarn:1>, C:<dcs_climate:dcs_layer_skarn:1>, D:<minecraft:furnace>}).ingredients);
			HiiragiUtils.addCrafting(false, true, HiiragiUtils.changeAppear(<dcs_climate:dcs_device_crafting_counter>, 3), RecipePattern.init(["AAA", "BCB", "BDB"]).map({A:<dcs_climate:dcs_build_linoleum>, B:<minecraft:stained_hardened_clay:9>, C:<ore:stoneMarble>, D:<minecraft:furnace>}).ingredients);
		//Gypsum Chandelier
			HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_build_chandelier>, RecipePattern.init([" A ", "BCB", " B "]).map({A:<dcs_climate:dcs_build_chain:0>, B:<ore:gemGypsum>, C:<dcs_climate:dcs_build_challamp:1>}).ingredients);
		//Rock Salt Chandelier
			HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_build_chandelier:1>, RecipePattern.init([" A ", "BCB", " B "]).map({A:<dcs_climate:dcs_build_chain:2>, B:<ore:gemSalt>, C:<dcs_climate:dcs_build_challamp:1>}).ingredients);
		//Chacedony Chandelier
			HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_build_chandelier:2>, RecipePattern.init([" A ", "BCB", " B "]).map({A:<dcs_climate:dcs_build_chain:1>, B:<ore:gemSalt>, C:<dcs_climate:dcs_build_challamp:2>}).ingredients);
		//marble Chandelier
			HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_build_chandelier:3>, RecipePattern.init([" A ", "BCB", " B "]).map({A:<dcs_climate:dcs_build_chain:0>, B:<ore:stoneMarble>, C:<dcs_climate:dcs_build_challamp:1>}).ingredients);
	//新規
			HiiragiUtils.addCrafting(false, false, <contenttweaker:dustblock_electrum>, RecipePattern.init(["AAA", "A B", "BBB"]).map({A:<ore:dustGold>, B:<ore:dustSilver>}).ingredients);
			HiiragiUtils.addCrafting(false, false, <contenttweaker:dustblock_platinum>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<ore:dustPlatinum>}).ingredients);
			HiiragiUtils.addCrafting(false, false, <contenttweaker:dustblock_cobalt>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<ore:dustCobalt>}).ingredients);
			HiiragiUtils.addCrafting(false, false, <contenttweaker:dustblock_lead>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<ore:dustLead>}).ingredients);

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

//Castingレシピの追加
	mods.tconstruct.Casting.addBasinRecipe(<dcs_climate:dcs_device_pail>, <minecraft:bucket>, <liquid:tin>, 288, true);

//このscriptの読み込みの完了をログに出力
print("dcs_climate.zs loaded!");
