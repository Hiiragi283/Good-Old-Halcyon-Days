#====================================================================
# ファイル名 : railcraft.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Script for Railcraft
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import mods.tconstruct.Casting;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading railcraft.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
	val removeCrafting as IItemStack[] = [
		<railcraft:tie:0>,
	];
	for i in removeCrafting {
		HiiragiUtils.removeCrafting(i);
	}
	//上書き
	//新規
	HiiragiUtils.addCraftingShaped(false, <railcraft:frostbound:2>*8, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<minecraft:packed_ice>, B:<ore:dropBlue>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <railcraft:badlands:2>*8, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<minecraft:red_sandstone:2>, B:<ore:dropRed>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <railcraft:sandy:2>*8, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<minecraft:sandstone:2>, B:<ore:dropWhite>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <railcraft:jaded:2>*8, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<ore:stone>, B:<ore:dropGreen>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <railcraft:pearlized:2>*8, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<minecraft:end_stone>, B:<ore:dropGreen>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <railcraft:infernal:2>*8, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<minecraft:soul_sand>, B:<ore:dropBlack>}).ingredients, null, null);

//AWレシピの編集
	//import
	//新規
	RecipeBuilder.get("basic")
	.setShaped(RecipePattern.init(["AA"]).map({A:<ore:slabWood>}).ingredients)
	.setFluid(<liquid:creosote>*500)
	.addOutput(<railcraft:tie>*2)
	.create();
	RecipeBuilder.get("basic")
	.setShaped([[<ore:logWood>]])
	.setFluid(<liquid:creosote>*500)
	.addOutput(<railcraft:creosote_block>)
	.create();

//Castingレシピの追加
	mods.tconstruct.Casting.addBasinRecipe(<railcraft:bloodstained:2>, <minecraft:sandstone:2>, <liquid:blood>, 40, true);

//このscriptの読み込みの完了をログに出力
print("railcraft.zs loaded!");
