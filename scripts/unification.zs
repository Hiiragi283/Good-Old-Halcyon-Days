#====================================================================
# ファイル名 : unification.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : 鉱石辞書やレシピの統一
#====================================================================

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
print("Start loading unification.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
		val removeCrafting as IItemStack[] = [
			<dcs_climate:dcs_ore_gemblock:4>,
			//<techreborn:nuggets:24>,
			<thermalfoundation:storage_resource:1>,
		];
		for i in removeCrafting {
			HiiragiUtils.removeCrafting(i);
		}
		val removeCraftingName as string[] = [
			"minecraft:torch",
			"dcs_climate:machine_advanced/dcs_torch_0",
			"dcs_climate:machine_advanced/dcs_torch_0_2",
			"dcs_climate:main_container/dcs_gem_blue_1",
			"dcs_climate:main_yagen/dcs_gem_layer_1",
			"enderio:s_a_g_mill_upgrade",
			"enderio:stirling_generator_upgrade",
			"enderio:wired_charger_upgrade",
			"enderio:alloy_smelter_upgrade",
			"enderio:crafter_upgrade",
			"railcraft:minecraft_torch$1",
			"railcraft:minecraft_torch$2",
			"thermalfoundation:gunpowder",
			"thermalfoundation:gunpowder_1",
			"thermalfoundation:torch",
			"thermalfoundation:torch_1",
		];
		for i in removeCraftingName {
			recipes.removeByRecipeName(i);
		}

		for i in 0 to 15 {
			recipes.removeByRecipeName("mekanism:balloon_" ~ i);
			recipes.removeByRecipeName("dcs_lib:balloon_" ~ i ~ "_dcs");
		}

	//上書き
		HiiragiUtils.addCraftingShapeless(true, <appliedenergistics2:material>*4, [<appliedenergistics2:quartz_block:0>], null, null);
		HiiragiUtils.addCraftingShaped(true, <minecraft:wooden_pressure_plate>, RecipePattern.init(["AA"]).map({A:<minecraft:planks:0>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <minecraft:slime>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<minecraft:slime_ball>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <minecraft:trapdoor>*2, RecipePattern.init(["AAA", "AAA"]).map({A:<minecraft:planks:0>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <tconstruct:slime:5>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<tconstruct:edible:5>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <tconstruct:slime_congealed:5>, RecipePattern.init(["AA", "AA"]).map({A:<tconstruct:edible:5>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <tconstruct:slimesling:5>, RecipePattern.init(["ABA", "C C", " C "]).map({A:<minecraft:string>, B:<tconstruct:slime_congealed:5>, C:<tconstruct:edible:5>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <tconstruct:slime_boots:5>, RecipePattern.init(["A A", "B B"]).map({A:<tconstruct:edible:5>, B:<tconstruct:slime_congealed:5>}).ingredients, null, null);
		HiiragiUtils.addCraftingShapeless(true, <thermalfoundation:material:802>, [<thermalfoundation:storage_resource:1>], null, null);

	//新規
		HiiragiUtils.addCraftingShaped(false, <tconstruct:soil>, RecipePattern.init(["AA", "AA"]).map({A:<contenttweaker:grout_ball>}).ingredients, null, null);
		HiiragiUtils.addCraftingShapeless(false, <minecraft:stick>, [<ore:treeSapling>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <dcs_climate:dcs_tinder:0>*4, [<ore:stickWood>, <minecraft:coal:*>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <dcs_climate:dcs_tinder:0>*4, [<ore:stickWood>, <ore:dropGlycerin>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <dcs_climate:dcs_tinder:0>*4, [<ore:stickWood>, <ore:blockWool>, <liquid:creosote>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <dcs_climate:dcs_tinder:0>*6, [<ore:stickWood>, <ore:dropCoaltar>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <dcs_climate:dcs_tinder:0>*6, [<ore:stickWood>, <ore:dropRosin>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <dcs_climate:dcs_tinder:0>*6, [<ore:stickWood>, <ore:fuelCoke>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <dcs_climate:dcs_tinder:0>*8, [<ore:stickWood>, <ore:coalPowered>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <minecraft:torch>, [<dcs_climate:dcs_tinder:1>], null, null);
		HiiragiUtils.addCraftingShaped(false, <artisanworktables:workstation:5>, RecipePattern.init(["ABA", " C ", "DDD"]).map({A:<tconstruct:seared_tank:*>, B: <ore:chest>, C:<ore:workbench>, D:<tconstruct:seared:0>}).ingredients, null, null);

//かまどレシピの編集
	//削除
		val removeFurnace as IItemStack[] = [];
		for i in removeFurnace {
			HiiragiUtils.removeFurnace(i);
		}
	//新規
		val addFurnace as IIngredient[IItemStack] = {
			//<tconstruct:materials>: <contenttweaker:grout_ingot>,
			<tconstruct:channel>: <contenttweaker:unfired_casting_channel>,
			<tconstruct:casting>: <contenttweaker:unfired_casting_table>,
			<tconstruct:casting:1>: <contenttweaker:unfired_casting_basin>,
		};
		for output, input in addFurnace {
			HiiragiUtils.addFurnace(false, output, input);
		}

//AWレシピの編集
	//import
	//新規

//JEIからエントリを完全に削除
	val removeFromJEI as IItemStack[] = [
		//Heat And Climate
			//<dcs_climate:dcs_gem:*>,
			<dcs_climate:dcs_door_marble>,
			<dcs_climate:dcs_door_greisen>,
			<dcs_climate:dcs_door_gypsum>,
			<dcs_climate:dcs_door_steel>,
		//Ender IO
			<enderio:block_simple_crafter>,
			<enderio:block_simple_alloy_smelter>,
			<enderio:block_simple_furnace>,
			<enderio:block_simple_stirling_generator>,
			<enderio:block_simple_sag_mill>,
			<enderio:block_simple_wired_charger>,
		//Tech reborn
			//<techreborn:lv_transformer>,
			//<techreborn:mv_transformer>,
			//<techreborn:hv_transformer>,
			//<techreborn:ev_transformer>,
	];
	for i in removeFromJEI {
		HiiragiUtils.removeFromJEI(i);
		//HiiragiUtils.removeOreDict(i);
	}

//鉱石辞書の削除
	<ore:dustWood>.remove(<dcs_climate:dcs_fooddust:7>);
	//<ore:blockAluminium>.remove(<techreborn:storage:1>);

	HiiragiUtils.removeOreDict(<dcs_climate:dcs_gem_layer:4>);
	HiiragiUtils.removeOreDict(<dcs_climate:dcs_synthetic:2>);
	//HiiragiUtils.removeOreDict(<techreborn:ore:8>);

	/*val removeFull as IItemStack[] = [
		<techreborn:storage:3>,
		<techreborn:dust:10>,
		<techreborn:ingot:3>,
		<techreborn:nuggets:3>,
		<techreborn:smalldust:10>,
	];

	for i in removeFull {
		HiiragiUtils.removeFromJEI(i);
		HiiragiUtils.removeOreDict(i);
	}*/

	val removeLibVulpes as IItemStack[] = [
		<libvulpes:productdust>,
		<libvulpes:productingot>,
		<libvulpes:productboule>,
		<libvulpes:productnugget>,
		<libvulpes:productplate>,
		<libvulpes:productrod>,
		<libvulpes:productsheet>,
		<libvulpes:productgear>,
		<libvulpes:ore0>,

	];
	for i in 0 to 10 {
		for j in removeLibVulpes {
			HiiragiUtils.removeFromJEI(j.definition.makeStack(i));
			HiiragiUtils.removeOreDict(j.definition.makeStack(i));
		}
	}

//鉱石辞書の追加
	<ore:itemCloth>.add(<botania:manaresource:22>);
	<ore:itemMagicCloth>.add(<botania:manaresource:22>);
	<ore:ingotElementium>.add(<botania:manaresource:7>);
	<ore:nuggetElementium>.add(<botania:manaresource:19>);
	<ore:blockElementium>.add(<botania:storage:2>);

	<ore:dustHalogen>.add(<contenttweaker:reagent_halogen>);
	//<ore:dustEnergium>.add(<contenttweaker:energium_dust>);
	//<ore:dustLapotron>.add(<contenttweaker:lapotron_dust>);

	<ore:dustSawDust>.add(<dcs_climate:dcs_miscdust:3>);
	<ore:blockPeridot>.add(<dcs_climate:dcs_ore_gemblock:10>);
	<ore:blockGlassHardened>.add(<dcs_climate:dcs_synthetic:2>);
	<ore:fusedQuartz>.add(<dcs_climate:dcs_synthetic:2>);

	<ore:blockFuelCoke>.add(<railcraft:generic:6>);
/*
	<ore:cableTin>.add(<techreborn:cable:1>);
	<ore:cableCopper>.add(<techreborn:cable:0>);
	<ore:cableGold>.add(<techreborn:cable:2>);
	<ore:cableRefinedIron>.add(<techreborn:cable:3>);
	<ore:cableFiber>.add(<techreborn:cable:4>);
	<ore:cableCopperInsulated>.add(<techreborn:cable:5>);
	<ore:cableGoldInsulated>.add(<techreborn:cable:6>);
	<ore:cableRefinedIronInsulated>.add(<techreborn:cable:7>);
	<ore:cableSuperconductor>.add(<techreborn:cable:8>);
	<ore:oreWolframite>.add(<techreborn:ore:8>);
*/
	<ore:blockCoke>.add(<thermalfoundation:storage_resource:1>);
	<ore:dropRosin>.add(<thermalfoundation:material:832>);
	<ore:dropCoaltar>.add(<thermalfoundation:material:833>);

//Tooltipの追加
	<contenttweaker:unfired_casting_channel>
		.addTooltip(I18n.format("gohd.tooltip.grout_forming.name"));
	<contenttweaker:unfired_casting_table>
		.addTooltip(I18n.format("gohd.tooltip.grout_forming.name"));
	<contenttweaker:unfired_casting_basin>
		.addTooltip(I18n.format("gohd.tooltip.grout_forming.name"));
	<dcs_climate:dcs_tinder:1>
		.addTooltip(I18n.format("gohd.tooltip.burning_stick.name"));

//耐久値の調整
	//<ore:artisansHammer>.maxDamage = 160;
	//<ore:artisansCutters>.maxDamage = 160;

//スタック数の調整
	<forge:bucketfilled>.maxStackSize = 16;

//このscriptの読み込みの完了をログに出力
print("unification.zs loaded!");
