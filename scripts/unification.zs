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
	//Heat And Climate
	HiiragiUtils.recipeReplace(<ore:fuelCoke>, <dcs_climate:dcs_reagent:13>, <dcs_climate:dcs_cont_fuel>);
	HiiragiUtils.recipeReplace(<ore:plankWood>, <ore:slabWood>, <dcs_climate:dcs_device_lowchest_wood>);
	//Thermal Foundation
	HiiragiUtils.recipeReplace(<ore:fuelCoke>, <thermalfoundation:material:802>, <thermalfoundation:storage_resource:1>);
	HiiragiUtils.recipeReplace(<ore:plankWood>, <minecraft:planks>, <minecraft:trapdoor>);
	HiiragiUtils.recipeReplace(<ore:plankWood>, <minecraft:planks>, <minecraft:wooden_pressure_plate>);
	HiiragiUtils.recipeReplace(<thermalfoundation:material:864>, <ore:gemSlag>|<ore:dustSlag>, <thermalfoundation:fertilizer:0>);
	for i in 0 to 16 {
		HiiragiUtils.recipeReplace(<minecraft:dye>.definition.makeStack(i), HiiragiUtils.listDye[i], <thermalfoundation:rockwool>.definition.makeStack(i));
	}
	//Tinker's Construct
	HiiragiUtils.addShaped(TablePart, RecipePattern.init(["A", "B"]).map({A:<tconstruct:pattern>, B:<twilightforest:twilight_log>}).ingredients, null, null);
	HiiragiUtils.addShaped(TableStencil, RecipePattern.init(["A", "B"]).map({A:<tconstruct:pattern>, B:<twilightforest:twilight_oak_planks>}).ingredients, null, null);
	HiiragiUtils.addShaped(ToolForge, RecipePattern.init(["AAA", "BCB", "B B"]).map({A:<ore:blockSeared>, B:<dcs_climate:dcs_ore_heatingmetal:2>, C:<tconstruct:tooltables:3>}).ingredients, null, null);
	HiiragiUtils.addShapeless(<tconstruct:faucet>*2, [<tconstruct:channel>, <bibliocraft:framingsaw>], null, null);

//鉱石辞書の編集
for i in loadedMods["artifacts"].items {
	HiiragiUtils.tweakOreDict(i, [], [<ore:itemArtifact>]);
}

//読み込みの完了をログに出力
print("unification.zs loaded!");
