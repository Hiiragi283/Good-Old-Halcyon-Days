#====================================================================
# ファイル名 : minecraft.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for Minecraft
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

//各種modからclassをimport
import mods.ctintegration.util.RecipePattern;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading minecraft.zs ...");

//作業台レシピの編集
	//上書き
	HiiragiUtils.addCraftingShaped(true, <minecraft:furnace>, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<ore:cobblestone>, B:<dcs_climate:dcs_tinder:1>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <minecraft:enchanting_table>, RecipePattern.init([" A ", "BCB", "DDD"]).map({A:<ore:book>, B:<ore:gemDiamond>, C:<ore:woolRed>, D:<ore:obsidian>}).ingredients, null, null);

	HiiragiUtils.recipeReplace(<ore:plankWood>, <minecraft:planks:0>, <minecraft:wooden_pressure_plate>);
	HiiragiUtils.recipeReplace(<ore:slimeball>, <minecraft:slime_ball>, <minecraft:slime>);
	HiiragiUtils.recipeReplace(<ore:plankWood>, <minecraft:planks:0>, <minecraft:trapdoor>);
	HiiragiUtils.recipeReplace(<minecraft:blaze_powder>, <ore:dustMana>, <minecraft:ender_eye>);
	//新規
	HiiragiUtils.addCraftingShapeless(false, <minecraft:stick>, [<ore:treeSapling>], null, null);
	HiiragiUtils.addCraftingShaped(false, <minecraft:golden_apple:1>, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<ore:blockGold>, B:<extrautils2:magicapple>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <minecraft:knowledge_book>, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<ore:netherStar>, B:<minecraft:dragon_egg>}).ingredients, null, null);

//このscriptの読み込みの完了をログに出力
print("minecraft.zs loaded!");
