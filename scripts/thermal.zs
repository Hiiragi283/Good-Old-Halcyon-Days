#====================================================================
# ファイル名 : thermal.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for mods made by Team Cofh
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import mods.thermalexpansion.Centrifuge;
import mods.thermalexpansion.Compactor;
import mods.thermalexpansion.Enchanter;
import mods.thermalexpansion.Factorizer;
import mods.thermalexpansion.Refinery;
import mods.thermalexpansion.InductionSmelter;
import mods.thermalexpansion.Transposer;

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
	//上書き
	//Frames
	HiiragiUtils.addCraftingShaped(true, <thermalexpansion:frame>, RecipePattern.init(["ABA", "BCB", "DBD"]).map({A:<ore:ingotInvar>, B:<dcs_climate:dcs_build_selenite:3>, C:<ore:gearToolSteel>, D:<ore:ingotSteel>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <thermalexpansion:frame>*3, RecipePattern.init(["ABA", "BCB", "DBD"]).map({A:<ore:ingotToolSteel>, B:<ore:fusedQuartz>, C:<ore:gearToolSteel>, D:<ore:ingotStainlessSteel>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <thermalexpansion:frame:64>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:ingotSilver>, B:<ore:ingotTin>, C:<dcs_climate:dcs_build_selenite:3>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <thermalexpansion:frame:64>*3, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:ingotNickelsilver>, B:<ore:ingotLead>, C:<ore:fusedQuartz>}).ingredients, null, null);
	//Parts
	HiiragiUtils.addCraftingShaped(true, <thermalfoundation:material:656>, RecipePattern.init(["  A", "AB ", "CA "]).map({A:<ore:ingotToolSteel>, B:<ore:gearToolSteel>, C:<ore:blockToolSteel>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <thermalfoundation:material:657>, RecipePattern.init([" A ", "ABA", " A "]).map({A:<ore:bladeToolSteel>, B:<ore:gearToolSteel>}).ingredients, null, null);
	HiiragiUtils.addCraftingShapeless(true, <thermalfoundation:material:802>, [<thermalfoundation:storage_resource:1>], null, null);
	//Dynamos
	HiiragiUtils.addCraftingShaped(true, <thermalexpansion:dynamo:0>, RecipePattern.init([" A ", "BCB", "DED"]).map({A:<dcs_climate:dcs_device_dynamo>, B:<ore:ingotSteel>, C:<dcs_climate:dcs_device_boiler_turbine>, D:<ore:ingotBronze>, E:<dcs_climate:dcs_device_chamber>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <thermalexpansion:dynamo:1>, RecipePattern.init([" A ", "BCB", "DED"]).map({A:<dcs_climate:dcs_device_dynamo>, B:<ore:ingotSteel>, C:<dcs_climate:dcs_device_fan>, D:<ore:ingotInvar>, E:<dcs_climate:dcs_device_ibc>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <thermalexpansion:dynamo:2>, RecipePattern.init([" A ", "BCB", "DED"]).map({A:<dcs_climate:dcs_device_dynamo>, B:<ore:ingotStainlessSteel>, C:<dcs_climate:dcs_device_diesel_engine>, D:<ore:ingotNickelsilver>, E:<dcs_climate:dcs_device_ibc>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <thermalexpansion:dynamo:3>, RecipePattern.init([" A ", "BCB", "DED"]).map({A:<botania:rfgenerator>, B:<ore:ingotStainlessSteel>, C:<botania:conjurationcatalyst>, D:<ore:ingotLead>, E:<minecraft:enchanting_table>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <thermalexpansion:dynamo:4>, RecipePattern.init([" A ", "BCB", "DED"]).map({A:<botania:rfgenerator>, B:<ore:ingotElectricalSteel>, C:<botania:conjurationcatalyst>, D:<ore:ingotElectrum>, E:<disenchanter:disenchantmenttable>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <thermalexpansion:dynamo:5>, RecipePattern.init([" A ", "BCB", "DED"]).map({A:<thermalfoundation:material:514>, B:<ore:ingotElectricalSteel>, C:<dcs_climate:dcs_device_display_vending_machine>, D:<ore:ingotTitanium>, E:<railcraft:trade_station>}).ingredients, null, null);

	for i in 0 to 15 {
		HiiragiUtils.addCraftingShapeless(true, <thermalfoundation:rockwool>.definition.makeStack(i), [<ore:blockRockwool>, HiiragiUtils.dyeList[i]], null, null);
	}
	//新規

//AWレシピの編集
	//import
	//新規

//Arcane Ensorcellator
	mods.thermalexpansion.Enchanter.addRecipe(<dcs_climate:dcs_food_petals:0>, <contenttweaker:cube_iridescent>, <botania:petalblock:0>*8, 365000, 3000, false);
	//mods.thermalexpansion.Enchanter.addRecipe(<dcs_climate:dcs_food_petals>, <contenttweaker:cube_iridescent>, <botania:petalblock>*8, 365000, 3000, false);
	mods.thermalexpansion.Enchanter.addRecipe(<extrautils2:enderlilly>, <contenttweaker:cube_iridescent>, <twilightforest:huge_waterlily>*8, 365000, 3000, false);
	mods.thermalexpansion.Enchanter.addRecipe(<botania:manaresource:5>, <contenttweaker:cube_iridescent>, <enderio:item_material:80>*8, 365000, 3000, false);
	mods.thermalexpansion.Enchanter.addRecipe(<dcs_climate:dcs_food_petals:1>, <contenttweaker:cube_iridescent>, <botania:petalblock:15>*8, 365000, 3000, false);

//Centrifugal Seperator
	mods.thermalexpansion.Centrifuge.addRecipe([
		<mekanism:dust:2>,
		<thermalfoundation:material:71>,
		<thermalfoundation:material:70>,
		<thermalfoundation:material:770>
	], <appliedenergistics2:material:45>, null, 10000);

	mods.thermalexpansion.Centrifuge.addRecipe([<biomesoplenty:hive:1>], <biomesoplenty:hive:3>, <liquid:honey>*1000, 1000);
	mods.thermalexpansion.Centrifuge.addRecipe([<biomesoplenty:honeycomb>], <biomesoplenty:filled_honeycomb>, <liquid:honey>*250, 1000);

//Compactor
	mods.thermalexpansion.Compactor.addPressRecipe(<enderio:item_material:71>, <ore:dustBedrock>.firstItem*5, 8000);
	mods.thermalexpansion.Compactor.addPressRecipe(<ezstorage:condensed_storage_box>, <ezstorage:storage_box>*10, 1000);
	mods.thermalexpansion.Compactor.addPressRecipe(<ezstorage:super_storage_box>, <ezstorage:condensed_storage_box>*4, 4000);
	mods.thermalexpansion.Compactor.addPressRecipe(<ezstorage:ultra_storage_box>, <ezstorage:super_storage_box>*4, 16000);
	mods.thermalexpansion.Compactor.addPressRecipe(<ezstorage:hyper_storage_box>, <ezstorage:ultra_storage_box>*5, 64000);

	mods.thermalexpansion.Compactor.addPressRecipe(<railcraft:charge:1>, <dcs_climate:dcs_ingot:4>*4, 4000);
	mods.thermalexpansion.Compactor.addPressRecipe(<contenttweaker:gem_carbon>, <dcs_climate:dcs_reagent:13>*64, 32000);

	val mapTicket as int[IItemStack] = {
		<thermalfoundation:coin:0>: 1,
		<thermalfoundation:coin:1>:2,
		<thermalfoundation:coin:64>: 1,
		<thermalfoundation:coin:65>: 1,
		<thermalfoundation:coin:66>: 2,
		<thermalfoundation:coin:67>: 1,
		<thermalfoundation:coin:68>: 2,
		<thermalfoundation:coin:69>: 2,
		<thermalfoundation:coin:70>: 16,
		<thermalfoundation:coin:71>: 16,
		<thermalfoundation:coin:72>: 16,
		<thermalfoundation:coin:96>: 4,
		<thermalfoundation:coin:97>: 4,
		<thermalfoundation:coin:98>: 4,
		<thermalfoundation:coin:99>: 2,
		<thermalfoundation:coin:100>: 4,
		<thermalfoundation:coin:101>: 8,
		<thermalfoundation:coin:102>: 8,
		<thermalfoundation:coin:103>: 16,
	};
	for i, j in mapTicket {
		mods.thermalexpansion.Compactor.addMintRecipe(<contenttweaker:ticket_common>*j, i*3, 4000);
	}
	mods.thermalexpansion.Compactor.addPressRecipe(<contenttweaker:ticket_uncommon>, <contenttweaker:ticket_common>*4, 8000);
	mods.thermalexpansion.Compactor.addPressRecipe(<contenttweaker:ticket_rare>, <contenttweaker:ticket_uncommon>*4, 16000);
	mods.thermalexpansion.Compactor.addPressRecipe(<contenttweaker:ticket_epic>, <contenttweaker:ticket_rare>*4, 32000);
	mods.thermalexpansion.Compactor.addPressRecipe(<contenttweaker:ticket_legendary>, <contenttweaker:ticket_epic>*4, 64000);


//Fluid Transposer
	mods.thermalexpansion.Transposer.addFillRecipe(<extrautils2:decorativesolidwood:1>, <minecraft:bookshelf>, <liquid:xpjuice>*500, 1600);
	mods.thermalexpansion.Transposer.addFillRecipe(<extrautils2:ingredients:12>, <minecraft:gold_ingot>, <liquid:xpjuice>*500, 1600);
	mods.thermalexpansion.Transposer.addFillRecipe(<extrautils2:magicapple>, <minecraft:apple>, <liquid:xpjuice>*500, 1600);
	mods.thermalexpansion.Transposer.addFillRecipe(<extrautils2:decorativesolidwood:1>, <minecraft:bookshelf>, <liquid:experience>*500, 1600);
	mods.thermalexpansion.Transposer.addFillRecipe(<extrautils2:ingredients:12>, <minecraft:gold_ingot>, <liquid:experience>*500, 1600);
	mods.thermalexpansion.Transposer.addFillRecipe(<extrautils2:magicapple>, <minecraft:apple>, <liquid:experience>*500, 1600);

	mods.thermalexpansion.Transposer.addFillRecipe(<railcraft:tie:0>, <minecraft:wooden_slab:*>, <liquid:creosote>*250, 400);
	mods.thermalexpansion.Transposer.addFillRecipe(<railcraft:creosote_block>, <minecraft:log:*>, <liquid:creosote>*500, 400);
	mods.thermalexpansion.Transposer.addFillRecipe(<threng:material:5>, <appliedenergistics2:crystal_seed:1200>.withTag({progress: 1200}), <liquid:ender>*1000, 4000);
	mods.thermalexpansion.Transposer.addFillRecipe(<appliedenergistics2:material:9>, <appliedenergistics2:crystal_seed:1200>.withTag({progress: 1200}), <liquid:dcs.chorus_liquor>*1000, 8000);
	mods.thermalexpansion.Transposer.addFillRecipe(<extrautils2:suncrystal:0>, <extrautils2:suncrystal:250>, <liquid:liquid_sunshine>*1000, 8000);

	mods.thermalexpansion.Transposer.addFillRecipe(<biomesoplenty:jar_filled:0>, <biomesoplenty:jar_empty>, <liquid:honey>*1000, 400);
	mods.thermalexpansion.Transposer.addExtractRecipe(<liquid:honey>*1000, <biomesoplenty:jar_filled:0>, 400, <biomesoplenty:jar_filled:0>);

	val mapFuel as ILiquidStack[] = [
		<liquid:dcs.fuel_oil>,
		<liquid:refined_fuel>,
		<liquid:rocket_fuel>,
	];
	for i in mapFuel {
		mods.thermalexpansion.Transposer.addFillRecipe(<hap:conveyor>, <dcs_climate:dcs_device_conveyor>, i*125, 800);
	}
	val mapOil as ILiquidStack[] = [
		<liquid:dcs.seed_oil>,
		<liquid:seed_oil>,
		<liquid:tree_oil>,
	];
	for i in mapOil {
		mods.thermalexpansion.Transposer.addFillRecipe(<hap:conveyor>, <dcs_climate:dcs_device_conveyor>, i*250, 800);
	}

//Fractionating Still
	Refinery.addRecipe(<liquid:drop_red>*250, <dcs_climate:dcs_color:7>%50, <liquid:dcs.wine>*250, 2500);
	Refinery.addRecipe(<liquid:drop_green>*250, <dcs_climate:dcs_color:6>%50, <liquid:dcs.mazai>*250, 2500);
	Refinery.addRecipe(<liquid:drop_blue>*250, <dcs_climate:dcs_color:5>%50, <liquid:dcs.tonic_water>*250, 2500);
	Refinery.addRecipe(<liquid:drop_white>*250, <dcs_climate:dcs_color:9>%50, <liquid:dcs.beer>*250, 2500);
	Refinery.addRecipe(<liquid:drop_black>*250, <dcs_climate:dcs_color:8>%50, <liquid:dcs.date>*250, 2500);

//Factorizer
	mods.thermalexpansion.Factorizer.addRecipeBoth(<biomesoplenty:hive:1>, <biomesoplenty:honeycomb>*4);
	mods.thermalexpansion.Factorizer.addRecipeBoth(<biomesoplenty:hive:3>, <biomesoplenty:filled_honeycomb>*4);

//Induction Smelter
	mods.thermalexpansion.InductionSmelter.addRecipe(<contenttweaker:block_bedrockium>, <enderio:block_infinity:2>, <contenttweaker:ingot_rainbow>, 1000000);
	mods.thermalexpansion.InductionSmelter.addRecipe(<advancedrocketry:productingot:0>*10, <thermalfoundation:material:132>*7, <dcs_climate:dcs_ingot:11>*3, 18000);
	mods.thermalexpansion.InductionSmelter.addRecipe(<advancedrocketry:productingot:1>*2, <thermalfoundation:material:135>, <dcs_climate:dcs_ingot:11>, 18000);

	mods.thermalexpansion.InductionSmelter.addRecipe(<dcs_climate:dcs_gem_red:2>*16, <dcs_climate:dcs_gem_red:2>, <contenttweaker:cube_iridescent>, 8000);
	mods.thermalexpansion.InductionSmelter.addRecipe(<dcs_climate:dcs_gem_green:2>*16, <dcs_climate:dcs_gem_green:2>, <contenttweaker:cube_iridescent>, 8000);
	mods.thermalexpansion.InductionSmelter.addRecipe(<dcs_climate:dcs_gem_blue:2>*16, <dcs_climate:dcs_gem_blue:2>, <contenttweaker:cube_iridescent>, 8000);
	mods.thermalexpansion.InductionSmelter.addRecipe(<dcs_climate:dcs_gem_white:2>*16, <dcs_climate:dcs_gem_white:2>, <contenttweaker:cube_iridescent>, 8000);
	mods.thermalexpansion.InductionSmelter.addRecipe(<dcs_climate:dcs_gem_black:2>*16, <dcs_climate:dcs_gem_black:2>, <contenttweaker:cube_iridescent>, 8000);

	mods.thermalexpansion.InductionSmelter.removeRecipe(<tconstruct:ingots:1>, <tconstruct:ingots>);
	mods.thermalexpansion.InductionSmelter.addRecipe(<tconstruct:ingots:2>*2, <tconstruct:ingots:1>, <tconstruct:ingots>, 9600);

//Photogenic Insolator
	mods.thermalexpansion.Insolator.addRecipe(<botania:overgrowthseed>, <thermalfoundation:fertilizer:2>*16, <botania:grassseeds:0>, 12000, null, 0, 8000);

//このscriptの読み込みの完了をログに出力
print("thermal.zs loaded!");
