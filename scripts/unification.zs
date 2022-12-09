#====================================================================
# Name   : unification.zs
# Author : Hiiragi R. Tsubasa: https://github.com/Hiiragi283
# Info   : Unification for many features
#====================================================================

#priority 98

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
print("Start loading unification.zs ...");

//Global
global ChestMimic as IItemStack = <minecraft:chest>.withTag({BlockEntityTag: {LootTable: "artifacts:mimic_underground"}, display: {LocName: "gohd.custom.safety_mimic.name"}});
global TableStencil as IItemStack = <tconstruct:tooltables:1>.withTag({textureBlock: {id: "twilightforest:twilight_oak_planks", Count: 1 as byte, Damage: 0 as short}});
global TablePart as IItemStack = <tconstruct:tooltables:2>.withTag({textureBlock: {id: "twilightforest:twilight_log", Count: 1 as byte, Damage: 0 as short}});
global ToolForge as IItemStack = <tconstruct:toolforge>.withTag({textureBlock: {id: "dcs_climate:dcs_ore_heatingmetal", Count: 1 as byte, Damage: 2 as short}});

global ToolKnife as IIngredient = HiiragiUtils.toolInput(<appliedenergistics2:certus_quartz_cutting_knife>, 1)|HiiragiUtils.toolInput(<appliedenergistics2:nether_quartz_cutting_knife>, 1);
global ToolSaw as IIngredient = HiiragiUtils.toolInput(<microblockcbe:saw_stone>, 1)|HiiragiUtils.toolInput(<microblockcbe:saw_iron>, 1)|HiiragiUtils.toolInput(<microblockcbe:saw_diamond>, 1);

//Crafting Recipes
	//アイテムに紐づいたすべてのレシピを削除
	val mapRemoveCrafting as IItemStack[] = [
		<astralsorcery:blockmarble:*>,
	];
	for i in mapRemoveCrafting {
		recipes.remove(i);
	}
	//レシピ名による削除
	val mapRemoveByName as string[] = [
		"appliedenergistics2:decorative/certus_quartz_pillar",
		"appliedenergistics2:decorative/chiseled_quartz_block",
		"astralsorcery:shaped/black_marble_arch",
		"astralsorcery:shaped/black_marble_bricks",
		"astralsorcery:shaped/black_marble_chiseled",
		"astralsorcery:shaped/black_marble_engraved",
		"astralsorcery:shaped/black_marble_pillar",
		"astralsorcery:shaped/black_marble_runed",
		"astralsorcery:shaped/infused_wood_arch",
		"astralsorcery:shaped/infused_wood_column",
		"astralsorcery:shaped/infused_wood_engraved",
		"biomesoplenty:chiseled_white_sandstone",
		"biomesoplenty:sapphire",
		"biomesoplenty:smooth_white_sandstone",
		"botania:custombrick_0_alt",
		"botania:dreamwood_3",
		"botania:dreamwood_4",
		"botania:fertilizer_dye",
		"botania:livingrock_1",
		"botania:livingrock_3",
		"botania:livingrock_4",
		"botania:livingwood_3",
		"botania:livingwood_4",
		"botania:quartztypeblaze_1",
		"botania:quartztypeblaze_2",
		"botania:quartztypedark_1",
		"botania:quartztypedark_2",
		"botania:quartztypeelf_1",
		"botania:quartztypeelf_2",
		"botania:quartztypelavender_1",
		"botania:quartztypelavender_2",
		"botania:quartztypemana_1",
		"botania:quartztypemana_2",
		"botania:quartztypered_1",
		"botania:quartztypered_2",
		"botania:quartztypesunny_1",
		"botania:quartztypesunny_2",
		"dcs_climate:main_build/dcs_desktop_accessories_0_2",
		"dcs_climate:main_container/dcs_gem_blue_1",
		"dcs_climate:main_yagen/dcs_gem_layer_4",
		"dcs_climate:main/dcs_planks_0",
		"enderio:ender_dust",
		"inspirations:building/mulch/plain",
		"mia:biomesoplenty/bamboo_thatching",
		"mia:mia/packed_paper/packed_paper_swap_0",
		"mia:mia/packed_paper/packed_paper_swap_1",
		"mia:mia/packed_paper/packed_paper_swap_2",
		"mia:mia/packed_paper/packed_paper_swap_3",
		"minecraft:chiseled_quartz_block",
		"minecraft:chiseled_red_sandstone",
		"minecraft:chiseled_sandstone",
		"minecraft:chiseled_stonebrick",
		"minecraft:furnace",
		"minecraft:granite_polished",
		"minecraft:pillar_quartz_block",
		"minecraft:purpur_pillar",
		"minecraft:slime",
		"minecraft:smooth_red_sandstone",
		"minecraft:smooth_sandstone",
		"railcraft:cone_oven_red$2",
		"tconstruct:common/slime/pink/congealed",
		"tconstruct:common/slime/pink/slimeblock",
		"tconstruct:gadgets/slimeboots/fallback",
		"tconstruct:gadgets/slimesling/fallback",
		"tconstruct:smeltery/casting_basin",
		"tconstruct:smeltery/casting_table",
		"tconstruct:smeltery/channel",
		"tconstruct:smeltery/faucet",
		"tconstruct:smeltery/smeltery_controller",
		"thermalfoundation:material_100",
		"thermalfoundation:material_99",
		"thermalfoundation:storage_alloy",
		"thermalfoundation:storage",
	];
	for i in mapRemoveByName {
		recipes.removeByRecipeName(i);
	}
		//Botania
		for i in 1 to 15 {
			recipes.removeByRecipeName("botania:custombrick_" ~ i);
		}
		//Heat And Climate
		for i in 1 to 9 {
			recipes.removeByRecipeName("dcs_climate:main_build/dcs_desktop_accessories_" ~ i);
		}
		//Ender IO
		val removeEnder as IItemStack[] = [
			//<enderio:block_self_resetting_lever5>,
			<enderio:block_self_resetting_lever10>,
			<enderio:block_self_resetting_lever30>,
			<enderio:block_self_resetting_lever60>,
			<enderio:block_self_resetting_lever300>,
			<enderio:block_self_resetting_lever5i>,
			<enderio:block_self_resetting_lever10i>,
			<enderio:block_self_resetting_lever30i>,
			<enderio:block_self_resetting_lever60i>,
			<enderio:block_self_resetting_lever300i>,
			<enderio:block_decoration1:*>,
			<enderio:block_decoration2:*>,
			<enderio:block_decoration3:*>,
			<enderio:item_redstone_not_filter>,
			<enderio:item_redstone_or_filter>,
			<enderio:item_redstone_and_filter>,
			<enderio:item_redstone_nor_filter>,
			<enderio:item_redstone_nand_filter>,
			<enderio:item_redstone_xor_filter>,
			<enderio:item_redstone_xnor_filter>,
			<enderio:item_redstone_toggle_filter>,
			<enderio:item_redstone_counting_filter>,
			<enderio:item_redstone_sensor_filter>,
			<enderio:item_redstone_timer_filter>,
		];
		for i in removeEnder {
			recipes.remove(i);
		}
		//Railcraft
		for i in 0 to 10 {
			recipes.removeByRecipeName("railcraft:metal#" ~ i ~ "$1");
			recipes.removeByRecipeName("railcraft:ingot#" ~ i ~ "$1");
			recipes.removeByRecipeName("railcraft:ingot#" ~ i ~ "$2");
			recipes.removeByRecipeName("railcraft:nugget#" ~ i ~ "$1");
		}
		val mapRCDecoration as string[] = [
			"andesite",
			"badlands",
			"bleachedbone",
			"bloodstained",
			"diorite",
			"frostbound",
			"granite",
			"infernal",
			"jaded",
			"nether",
			"pearlized",
			"red_nether",
			"sandy",
		];
		val mapRCMeta as string[] = [
			"#0$1",
			"#1$1",
			"#3$1",
			"#4$1",
		];
		for i in mapRCDecoration {
			for j in mapRCMeta {
				recipes.removeByRecipeName("railcraft:" ~ i ~ j);
			}
		}
		//Thermal Foundation
		for i in 1 to 9 {
			recipes.removeByRecipeName("thermalfoundation:storage_" ~ i);
			recipes.removeByRecipeName("thermalfoundation:storage_alloy_" ~ i);
		}
		for i in 8 to 82 {
			recipes.removeByRecipeName("thermalfoundation:material_" ~ i);
		}
	//既存のレシピの編集および新規レシピの登録
		//Applied Energistics
		//Artifacts
		HiiragiUtils.addShapeless(ChestMimic, [<ore:itemArtifact>, <minecraft:trapped_chest>, <gohd_tweaks:ragi_ticket>], null, null);
		//Biomes O Plenty
		//Botania
		HiiragiUtils.addShapeless(<botania:fertilizer>, [<minecraft:dye:15>, <minecraft:dye:15>, <minecraft:dye:15>, <twilightforest:liveroot>], null, null);
		//Heat And Climate
		HiiragiUtils.recipeReplace(<ore:fuelCoke>, <dcs_climate:dcs_reagent:13>, <dcs_climate:dcs_cont_fuel>);
		HiiragiUtils.recipeReplace(<ore:plankWood>, <ore:slabWood>, <dcs_climate:dcs_device_lowchest_wood>);
		//Inspirations
		HiiragiUtils.addShaped(<inspirations:mulch:0>*2, RecipeUtils.createCross(null, <ore:stickWood>), null, null);
		//Minecraft
		//Thermal Foundation
		HiiragiUtils.addShaped(<minecraft:furnace>, RecipeUtils.createSurround(<dcs_climate:dcs_tinder:1>, <ore:cobblestone>), null, null);
		HiiragiUtils.addShaped(<minecraft:slime>, RecipeUtils.createFull3(<minecraft:slime_ball>), null, null);
		HiiragiUtils.recipeReplace(<ore:fuelCoke>, <thermalfoundation:material:802>, <thermalfoundation:storage_resource:1>);
		HiiragiUtils.recipeReplace(<ore:plankWood>, <minecraft:planks>, <minecraft:trapdoor>);
		HiiragiUtils.recipeReplace(<ore:plankWood>, <minecraft:planks>, <minecraft:wooden_pressure_plate>);
		HiiragiUtils.recipeReplace(<thermalfoundation:material:864>, <ore:gemSlag>|<ore:dustSlag>, <thermalfoundation:fertilizer:0>);
		for i in 0 to 16 {
			HiiragiUtils.recipeReplace(<minecraft:dye>.definition.makeStack(i), HiiragiUtils.listDye[i], <thermalfoundation:rockwool>.definition.makeStack(i));
		}
		//Tinker's Construct
		HiiragiUtils.addShaped(<tconstruct:slime_boots:5>, RecipePattern.init(["A A", "B B"]).map({A:<tconstruct:edible:5>, B:<tconstruct:slime_congealed:5>}).ingredients, null, null);
		HiiragiUtils.addShaped(<tconstruct:slime_congealed:5>, RecipeUtils.createFull2(<tconstruct:edible:5>), null, null);
		HiiragiUtils.addShaped(<tconstruct:slime:5>, RecipeUtils.createFull3(<tconstruct:edible:5>), null, null);
		HiiragiUtils.addShaped(<tconstruct:slimesling:5>, RecipePattern.init(["ABA", "C C", " C "]).map({A:<minecraft:string>, B:<tconstruct:slime_congealed:5>, C:<tconstruct:edible:5>}).ingredients, null, null);
		HiiragiUtils.addShaped(<tconstruct:smeltery_controller>, RecipePattern.init(["ABA", "ACA", "ADA"]).map({A:<tconstruct:materials:0>, B:<tconstruct:seared_furnace_controller>, C:<tconstruct:tinker_tank_controller>, D:<dcs_climate:dcs_device_chamber>}).ingredients, null, null);
		HiiragiUtils.addShaped(TablePart, RecipePattern.init(["A", "B"]).map({A:<tconstruct:pattern>, B:<twilightforest:twilight_log>}).ingredients, null, null);
		HiiragiUtils.addShaped(TableStencil, RecipePattern.init(["A", "B"]).map({A:<tconstruct:pattern>, B:<twilightforest:twilight_oak_planks>}).ingredients, null, null);
		HiiragiUtils.addShaped(ToolForge, RecipePattern.init(["AAA", "BCB", "B B"]).map({A:<ore:blockSeared>, B:<dcs_climate:dcs_ore_heatingmetal:2>, C:<tconstruct:tooltables:3>}).ingredients, null, null);
		HiiragiUtils.addShapeless(<tconstruct:faucet>*2, [<tconstruct:channel>, ToolSaw], null, null);

//Furnace Recipes
	//Remove
	val mapFurnaceRemove as IItemStack[] = [
		<minecraft:coal:1>,
		<thermalfoundation:material:130>,
		<thermalfoundation:material:132>,
		<thermalfoundation:material:133>,
		<thermalfoundation:material:134>,
		<thermalfoundation:material:135>,
		<thermalfoundation:material:136>,
		<thermalfoundation:material:160>,
		<thermalfoundation:material:161>,
		<thermalfoundation:material:162>,
		<thermalfoundation:material:163>,
		<thermalfoundation:material:164>,
	];
	for i in mapFurnaceRemove {
		furnace.remove(i);
	}
	//Addition
	val mapAddFurnace as IIngredient[IItemStack] = {
		//<tconstruct:casting:0>: <gohd_tweaks:grout_formed:0>,
		//<tconstruct:casting:1>: <gohd_tweaks:grout_formed:1>,
		//<tconstruct:channel>: <gohd_tweaks:grout_formed:2>,
		<appliedenergistics2:material:23>: <gohd_tweaks:parts_assembly:0>,
		<appliedenergistics2:material:24>: <gohd_tweaks:parts_assembly:1>,
		<appliedenergistics2:material:22>: <gohd_tweaks:parts_assembly:2>,
		<threng:material:6>: <gohd_tweaks:parts_assembly:3>,
		<threng:material:13>: <gohd_tweaks:parts_assembly:4>,
	};
	for output, input in mapAddFurnace {
		furnace.addRecipe(output, input);
	}

//Tooltip
	val mapTooltip as string[IItemStack] = {
		<minecraft:chest>.withTag({BlockEntityTag: {LootTable: "artifacts:mimic_underground"}, display: {LocName: "gohd.custom.safety_mimic.name"}}): "gohd.tooltip.safety_mimic.name",
	};
for i, j in mapTooltip {
	i.addTooltip(I18n.format(j));
}

//読み込みの完了をログに出力
print("unification.zs loaded!");
