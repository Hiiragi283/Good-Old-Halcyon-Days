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
		"biomesoplenty:sapphire",
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
		"railcraft:coke_oven_red$2",
		"tcomplement:steelworks/charcoal",
		"tcomplement:steelworks/steel_block",
		"tcomplement:steelworks/steel_ingot_from_block",
		"tcomplement:steelworks/steel_ingot_from_nugget",
		"tcomplement:steelworks/steel_nugget",
		"thermalfoundation:material_100",
		"thermalfoundation:material_99",
		"thermalfoundation:storage_alloy",
		"thermalfoundation:storage",
	];
	for i in mapRemoveByName {
		recipes.removeByRecipeName(i);
	}
		//Railcraftの金属素材
		for i in 0 to 10 {
			val nameRailcraftBlock as string = "railcraft:metal#" ~ i ~ "$1";
			val nameRailcraftIngot1 as string = "railcraft:ingot#" ~ i ~ "$1";
			val nameRailcraftIngot2 as string = "railcraft:ingot#" ~ i ~ "$2";
			val nameRailcraftNugget as string = "railcraft:nugget#" ~ i ~ "$1";
			recipes.removeByRecipeName(nameRailcraftBlock);
			recipes.removeByRecipeName(nameRailcraftIngot1);
			recipes.removeByRecipeName(nameRailcraftIngot2);
			recipes.removeByRecipeName(nameRailcraftNugget);
		}
		//Thermal Foundationの金属素材
		for i in 1 to 9 {
			val nameTFBlock as string = "thermalfoundation:storage_" ~ i;
			val nameTFBlockAlloy as string = "thermalfoundation:storage_alloy_" ~ i;
			recipes.removeByRecipeName(nameTFBlock);
			recipes.removeByRecipeName(nameTFBlockAlloy);
		}
		for i in 8 to 82 {
			recipes.removeByRecipeName("thermalfoundation:material_" ~ i);
		}
	//Tweak existing or new recipes
		//Biomes O Plenty
		RecipeUtils.recipeTweak(false, <biomesoplenty:gem:6>*9, [[<biomesoplenty:gem_block:6>]]);
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

//読み込みの完了をログに出力
print("unification.zs loaded!");
