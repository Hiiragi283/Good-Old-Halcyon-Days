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

//Crafting Recipes
	//アイテムに紐づいたすべてのレシピを削除
	val mapRemoveCrafting as IItemStack[] = [
		<astralsorcery:blockmarble:*>,
	];
	for i in mapRemoveCrafting {
		recipes.remove(i);
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
	//既存のレシピの編集および新規レシピの登録
		//Applied Energistics
		//Artifacts
		HiiragiUtils.addShapeless(ChestMimic, [<ore:itemArtifact>, <minecraft:trapped_chest>, <gohd_tweaks:ragi_ticket>], null, null);
		//Astral Sorcery
		HiiragiUtils.addShaped(<astralsorcery:blockaltar:0>, RecipePattern.init(["ABA", "ACA", "A A"]).map({A:<ore:blockMarble>, B:<astralsorcery:blockblackmarble:*>, C:<ore:workbench>}).ingredients, null, null);
		//Biomes O Plenty
		//Botania
		HiiragiUtils.addShapeless(<botania:fertilizer>, [<minecraft:dye:15>, <minecraft:dye:15>, <minecraft:dye:15>, <twilightforest:liveroot>], null, null);
		HiiragiUtils.addShapeless(<botania:lexicon>, [<twilightforest:magic_map_focus>, <minecraft:book>], null, null);
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
		HiiragiUtils.addShapeless(<tconstruct:faucet>*2, [<tconstruct:channel>, <bibliocraft:framingsaw>], null, null);

//Furnace Recipes
	//Remove
	val mapFurnaceRemove as IItemStack[] = [
		<appliedenergistics2:smooth_sky_stone_block>,
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
		<appliedenergistics2:material:23>:
		<gohd_tweaks:parts_assembly:0>,
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
