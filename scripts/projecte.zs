#====================================================================
# ファイル名 : projecte.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for ProjectE and its addon
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

//各種modからclassをimport
import mods.ctintegration.projecte.EMCManager;
import mods.ctintegration.util.RecipePattern;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading projecte.zs ...");

//作業台レシピの編集
recipes.removeByMod("projectex");
	//新規
	HiiragiUtils.addCraftingShaped(false, <projectex:energy_link>, RecipePattern.init(["ABA", "CDC", "ABA"]).map({A:<ore:ingotBedrockium>, B:<ore:blockDarkMatter>, C:<contenttweaker:drop_soul>, D:<projecte:transmutation_table>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <projectex:personal_link>, RecipePattern.init(["ABA", "BCB", "ADA"]).map({A:<ore:blockDarkMatter>, B:<ore:hopper>, C:<projecte:condenser_mk2>, D:<dcs_climate:dcs_device_hopper_filter>}).ingredients, null, null);
	HiiragiUtils.addCraftingShapeless(false, <projectex:refined_link>, [<projectex:personal_link>, <appliedenergistics2:interface>, <ore:itemRedMatter>], null, null);
	HiiragiUtils.addCraftingShapeless(false, <projectex:arcane_tablet>, [<projecte:item.pe_transmutation_tablet>, <projecte:item.pe_klein_star:5>, <tconstruct:tooltables>], null, null);
	HiiragiUtils.addCraftingShapeless(false, <projecte:item.pe_tome>, [<thermalfoundation:tome_experience>, <extendedcrafting:singularity_ultimate>.reuse()], null, null);

	HiiragiUtils.addCraftingConv(<projecte:collector_mk3>, <contenttweaker:dummy_collector>);
	HiiragiUtils.addCraftingConv(<projecte:relay_mk3>, <contenttweaker:dummy_relay>);
	HiiragiUtils.addCraftingConv(<projectex:energy_link>, <contenttweaker:dummy_link>);

	//置換
	//HiiragiUtils.recipeReplace(<ore:blockDiamond>, <ore:compressed5xCobblestone>, <projecte:item.pe_matter>);
	HiiragiUtils.recipeReplace(<ore:obsidian>, <contenttweaker:block_shadestone>, <projecte:relay_mk1>);
	HiiragiUtils.recipeReplace(<ore:obsidian>, <contenttweaker:block_shadestone>, <projecte:relay_mk2>);
	HiiragiUtils.recipeReplace(<ore:obsidian>, <contenttweaker:block_shadestone>, <projecte:relay_mk3>);

//EMCの編集
	//EMCの読み込み
	EMCManager.mapEMC();
	//EMCの削除
	//EMCの追加
	val mapEMC as long[IItemStack] = {
		//Stone
		<minecraft:cobblestone>: 1,
		<minecraft:stone:0>: 1,
		<minecraft:stone:1>: 1,
		<minecraft:stone:3>: 1,
		<minecraft:stone:5>: 1,
		<minecraft:mossy_cobblestone>: 2,
		<minecraft:netherrack>: 2,
		<minecraft:end_stone>: 4,
		<chisel:basalt2:7>: 1,
		<chisel:limestone2:7>: 1,
		<chisel:marble2:7>: 1,
		<dcs_climate:dcs_layer_stone_new:1>: 2,
		<dcs_climate:dcs_layer_skarn:0>: 1,
		<dcs_climate:dcs_layer_skarn:1>: 1,
		<dcs_climate:dcs_layer_skarn:2>: 1,
		<dcs_climate:dcs_ore_gemblock:6>: 1,
		<railcraft:abyssal_stone>: 1,
		<railcraft:jaded_stone>: 1,
		<railcraft:quarried_stone>: 1,
		<twilightforest:maze_stone>: 1,
		<twilightforest:naga_stone>: 1,
		<twilightforest:underbrick>: 2,
		<twilightforest:deadrock:2>: 4,
		<twilightforest:trollsteinn>: 4,
		<twilightforest:castle_brick>: 4,
		<twilightforest:castle_rune_brick:*>: 8,
		//Color Ore
		<dcs_climate:dcs_ore_stone_new:0>: 1024,
		<dcs_climate:dcs_ore_stone_new:1>: 1024,
		<dcs_climate:dcs_ore_stone_new:2>: 1024,
		<dcs_climate:dcs_ore_stone_new:3>: 1024,
		<dcs_climate:dcs_ore_stone_new:4>: 1024,
		<dcs_climate:dcs_ore_stone_new:5>: 2048,
		<dcs_climate:dcs_ore_stone_new:6>: 2048,
		<dcs_climate:dcs_ore_stone_new:7>: 2048,
		<dcs_climate:dcs_ore_stone_new:8>: 2048,
		<dcs_climate:dcs_ore_stone_new:9>: 2048,
		//Dirt
		<minecraft:dirt>: 1,
		<biomesoplenty:dirt:0>: 1,
		<biomesoplenty:dirt:1>: 1,
		<biomesoplenty:dirt:2>: 1,
		<twilightforest:uberous_soil>: 4,
		<tconstruct:slime_dirt:*>: 2,
		<tconstruct:slime_grass:*>: 2,
		//Gravel
		<minecraft:gravel>: 1,
		//Gem
		<minecraft:coal:0>: 64,
		<projecte:item.pe_fuel:0>: 256,
		<projecte:item.pe_fuel:1>: 1024,
		<projecte:item.pe_fuel:2>: 4096,
		<minecraft:diamond>: 8192,
		//Sand
		<minecraft:sand>: 1,
		<biomesoplenty:white_sand>: 1,
		<biomesoplenty:dried_sand>: 1,
		<chisel:brownstone>: 2,
		//Other
		<minecraft:dragon_egg>: 32768,
		<projecte:item.pe_matter:1>: 466944,
		<twilightforest:aurora_block>: 2,
		<twilightforest:wispy_cloud>: 4,
		<twilightforest:fluffy_cloud>: 4,
	};
	for i, j in mapEMC {
		EMCManager.setEMC(i, j);
	}
	for i in 0 to 16 {
		EMCManager.setEMC(<pickletweaks:colored_cobblestone>.definition.makeStack(i), 1);
	}

//このscriptの読み込みの完了をログに出力
print("projecte.zs loaded!");
