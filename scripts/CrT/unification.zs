#====================================================================
# Name   : unification.zs
# Author : Hiiragi R. Tsubasa: https://github.com/Hiiragi283
# Info   : Unification for many features
#====================================================================

#priority 99

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

//Crafting Recipes
	//Remove by recipe name
	val mapRemoveByName as string[] = [
		"appliedenergistics2:decorative/certus_quartz_pillar",
		"appliedenergistics2:decorative/chiseled_quartz_block",
		"biomesoplenty:chiseled_white_sandstone",
		"biomesoplenty:sapphire",
		"biomesoplenty:smooth_white_sandstone",
		"botania:custombrick_0_alt",
		"botania:dreamwood_3",
		"botania:dreamwood_4",
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
		"extendedcrafting:diamond_nugget_from",
		"extendedcrafting:diamond_nugget_to",
		"extendedcrafting:emerald_nugget_from",
		"extendedcrafting:emerald_nugget_to",
		"mia:biomesoplenty/bamboo_thatching",
		"mia:mia/packed_paper/packed_paper_swap_0",
		"mia:mia/packed_paper/packed_paper_swap_1",
		"mia:mia/packed_paper/packed_paper_swap_2",
		"mia:mia/packed_paper/packed_paper_swap_3",
		"minecraft:chiseled_quartz_block",
		"minecraft:chiseled_red_sandstone",
		"minecraft:chiseled_sandstone",
		"minecraft:chiseled_stonebrick",
		"minecraft:granite_polished",
		"minecraft:pillar_quartz_block",
		"minecraft:purpur_pillar",
		"minecraft:smooth_red_sandstone",
		"minecraft:smooth_sandstone",
		"railcraft:cone_oven_red$2",
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
		//Biomes O Plenty
		RecipeUtils.recipeTweak(false, <biomesoplenty:gem:6>*9, [[<biomesoplenty:gem_block:6>]]);
		//Content Tweaker
		//Heat And Climate
		HiiragiUtils.recipeReplace(<ore:fuelCoke>, <dcs_climate:dcs_reagent:13>, <dcs_climate:dcs_cont_fuel>);
		HiiragiUtils.recipeReplace(<ore:plankWood>, <ore:slabWood>, <dcs_climate:dcs_device_lowchest_wood>);
		RecipeUtils.recipeTweak(false, <dcs_climate:dcs_gem_blue:1>*4, [[<dcs_climate:dcs_ore_gemblock:4>]]);
		//Inspirations
		RecipeUtils.recipeTweak(true, <inspirations:mulch:0>*2, RecipeUtils.createCross(null, <ore:stickWood>));
		//Minecraft
		HiiragiUtils.recipeReplace(<ore:plankWood>, <minecraft:planks>, <minecraft:trapdoor>);
		HiiragiUtils.recipeReplace(<ore:plankWood>, <minecraft:planks>, <minecraft:wooden_pressure_plate>);
		RecipeUtils.recipeTweak(true, <minecraft:slime>, RecipeUtils.createFull3(<minecraft:slime_ball>));
		//Thermal Foundation
		HiiragiUtils.recipeReplace(<ore:fuelCoke>, <thermalfoundation:material:802>, <thermalfoundation:storage_resource:1>);
		//Tinker's Construct
		RecipeUtils.recipeTweak(true, <tconstruct:slime_boots:5>, RecipePattern.init(["A A", "B B"]).map({A:<tconstruct:edible:5>, B:<tconstruct:slime_congealed:5>}).ingredients);
		RecipeUtils.recipeTweak(true, <tconstruct:slime_congealed:5>, RecipePattern.init(["AA", "AA"]).map({A:<tconstruct:edible:5>}).ingredients);
		RecipeUtils.recipeTweak(true, <tconstruct:slime:5>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<tconstruct:edible:5>}).ingredients);
		RecipeUtils.recipeTweak(true, <tconstruct:slimesling:5>, RecipePattern.init(["ABA", "C C", " C "]).map({A:<minecraft:string>, B:<tconstruct:slime_congealed:5>, C:<tconstruct:edible:5>}).ingredients);
		RecipeUtils.recipeTweak(true, <tconstruct:toolforge>.withTag({textureBlock: {id: "dcs_climate:dcs_ore_heatingmetal", Count: 1 as byte, Damage: 2 as short}}), RecipePattern.init(["AAA", "BCB", "B B"]).map({A:<ore:blockSeared>, B:<dcs_climate:dcs_ore_heatingmetal:2>, C:<tconstruct:tooltables:3>}).ingredients);
		RecipeUtils.recipeTweak(true, <tconstruct:tooltables:1>.withTag({textureBlock: {id: "twilightforest:twilight_oak_planks", Count: 1 as byte, Damage: 0 as short}}), RecipePattern.init(["A", "B"]).map({A:<tconstruct:pattern>, B:<twilightforest:twilight_oak_planks>}).ingredients);
		RecipeUtils.recipeTweak(true, <tconstruct:tooltables:2>.withTag({textureBlock: {id: "twilightforest:twilight_log", Count: 1 as byte, Damage: 0 as short}}), RecipePattern.init(["A", "B"]).map({A:<tconstruct:pattern>, B:<twilightforest:twilight_log>}).ingredients);

//読み込みの完了をログに出力
print("unification.zs loaded!");
