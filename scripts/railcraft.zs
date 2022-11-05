#====================================================================
# ファイル名 : railcraft.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for Railcraft
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

//各種modからclassをimport
import mods.ctintegration.util.RecipePattern;
import mods.railcraft.BlastFurnace;
import mods.tconstruct.Casting;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading railcraft.zs ...");

//作業台レシピの編集
	//上書き
	//新規
	HiiragiUtils.addCraftingShaped(false, <railcraft:badlands:2>*8, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<minecraft:red_sandstone:2>, B:<ore:dropRed>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <railcraft:frostbound:2>*8, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<minecraft:packed_ice>, B:<ore:dropBlue>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <railcraft:infernal:2>*8, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<minecraft:soul_sand>, B:<ore:dropBlack>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <railcraft:jaded:2>*8, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<ore:stone>, B:<ore:dropGreen>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <railcraft:locomotive_steam_solid>, RecipePattern.init([" AB", "CCB", "DEE"]).map({A:<railcraft:equipment:3>, B:<railcraft:boiler_firebox_solid>, C:<railcraft:boiler_tank_pressure_high>, D:<ore:barsIron>, E:<minecraft:minecart>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <railcraft:pearlized:2>*8, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<minecraft:end_stone>, B:<ore:dropGreen>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <railcraft:sandy:2>*8, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<minecraft:sandstone:2>, B:<ore:dropWhite>}).ingredients, null, null);

//Blast Furnaceのレシピの編集
	val mapBlast as string[] = [
		"axe",
		"block",
		"boiler_tank",
		"boots",
		"bucket",
		"chestplate",
		"crowbar",
		"door",
		"helmet",
		"hoe",
		"horse_armor",
		"ingot",
		"iron_tank",
		"leggings",
		"pickaxe",
		"plate",
		"shears",
		"shovel",
		"sword",
		"trapdoor",
	];
	for i in mapBlast {
		mods.railcraft.BlastFurnace.removeRecipe("railcraft:smelt_" ~ i);
		mods.railcraft.BlastFurnace.removeRecipe("railcraft:recycle_" ~ i);
	}
	mods.railcraft.BlastFurnace.addRecipe("gohd:block_steel", <dcs_climate:dcs_ore_metal_alloy:2>, <dcs_climate:dcs_ore_dustblock:5>, 60*20, 9);
	mods.railcraft.BlastFurnace.addRecipe("gohd:block_steel_2", <dcs_climate:dcs_ore_metal_alloy:2>, <dcs_climate:dcs_ore_heatingmetal:2>, 60*20, 9);

//このscriptの読み込みの完了をログに出力
print("railcraft.zs loaded!");
