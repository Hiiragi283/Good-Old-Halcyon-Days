#====================================================================
# ファイル名 : minecraft.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for Minecraft
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading minecraft.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
	val removeCrafting as IItemStack[] = [];
	for i in removeCrafting {
		HiiragiUtils.removeCrafting(i);
	}
	//上書き
	HiiragiUtils.addCraftingShaped(true, <minecraft:wooden_pressure_plate>, RecipePattern.init(["AA"]).map({A:<minecraft:planks:0>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <minecraft:slime>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<minecraft:slime_ball>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <minecraft:trapdoor>*2, RecipePattern.init(["AAA", "AAA"]).map({A:<minecraft:planks:0>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <minecraft:furnace>, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<ore:cobblestone>, B:<dcs_climate:dcs_tinder:1>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <minecraft:enchanting_table>, RecipePattern.init([" A ", "BCB", "DDD"]).map({A:<ore:book>, B:<ore:gemDiamond>, C:<ore:woolRed>, D:<ore:obsidian>}).ingredients, null, null);
	HiiragiUtils.addCraftingShapeless(true, <minecraft:ender_eye>, [<ore:enderpearl>, <ore:dustMana>], null, null);
	//新規
	HiiragiUtils.addCraftingShapeless(false, <minecraft:stick>, [<ore:treeSapling>], null, null);

//AWレシピの編集
	//import
	//新規

//このscriptの読み込みの完了をログに出力
print("minecraft.zs loaded!");
