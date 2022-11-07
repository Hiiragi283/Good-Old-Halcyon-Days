#====================================================================
# ファイル名 : extendedcrafting.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for Extended Crafting
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

//各種modからclassをimport
import mods.ctintegration.util.RecipePattern;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading extendedcrafting.zs ...");

//作業台レシピの編集
	//上書き
	HiiragiUtils.addCraftingShaped(true, <extendedcrafting:material:7>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:dustMica>, B:<enderio:block_holier_fog>, C:<ore:itemGrindingBallLumium>}).ingredients, null, null);
	//HiiragiUtils.addCraftingShaped(true, <extendedcrafting:ender_alternator>, RecipePattern.init([" A ", " B ", "BCB"]).map({A:<ore:pearlEnderEye>, B:<extrautils2:decorativesolid:3>, C:<ore:blockBedrockium>}).ingredients, null, null);
	//HiiragiUtils.addCraftingShaped(true, <extendedcrafting:ender_crafter>, RecipePattern.init(["ABA", "CDC", "CCC"]).map({A:<ore:pearlEnderEye>, B:<ore:workbench>, C:<extrautils2:decorativesolid:3>, D:<ore:blockBedrockium>}).ingredients, null, null);
	//新規
	//置換
	HiiragiUtils.recipeReplace(<ore:blockGlass>, <dcs_climate:dcs_synthetic:2>, <extendedcrafting:frame>);

//Combination Craftingレシピの編集
mods.extendedcrafting.CombinationCrafting.addRecipe(<contenttweaker:division_sigil_perm>, 200000, <contenttweaker:division_sigil_temp:*>, [<contenttweaker:rune_fire>, <contenttweaker:rune_earth>, <contenttweaker:rune_water>, <contenttweaker:rune_air>]);
	//Magical Snow Globe
	var mapTerrarium as IIngredient[] = [];
	for i in 0 to 14 {
		mapTerrarium += <biomesoplenty:terrarium>.definition.makeStack(i);
	}
	//mods.extendedcrafting.CombinationCrafting.addRecipe(<extrautils2:snowglobe:1>, 128000, <extrautils2:snowglobe>, mapTerrarium);
	//Rainbow Oak Sapling
	var saplingTwilight as IIngredient[] = [];
	for i in 0 to 9 {
		saplingTwilight += <twilightforest:twilight_sapling:0>.definition.makeStack(i);
	}
	mods.extendedcrafting.CombinationCrafting.addRecipe(<twilightforest:twilight_sapling:9>, 128000, <biomesoplenty:sapling_1:7>, saplingTwilight);

//Ender Craftingレシピの編集
mods.extendedcrafting.EnderCrafting.remove(<extendedcrafting:material:48>);

mods.extendedcrafting.EnderCrafting.addShaped(<minecraft:nether_star>, RecipePattern.init(["AAA", "BBB", "CBD"]).map({A:<minecraft:skull:1>, B:<minecraft:soul_sand>, C:<minecraft:diamond_sword>, D:<minecraft:bow>}).ingredients, 500);

//Quantum Compressorレシピの編集
mods.extendedcrafting.CompressionCrafting.addRecipe(<extendedcrafting:singularity_ultimate>, <extendedcrafting:material:32>, 128, <extendedcrafting:material:13>, 1280000);

//このscriptの読み込みの完了をログに出力
print("extendedcrafting.zs loaded!");
