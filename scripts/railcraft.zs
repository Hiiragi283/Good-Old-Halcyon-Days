#======================================================================
# ファイル名 : railcraft.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : このファイルについて書く
#======================================================================

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
		val removeCrafting as IItemStack[] = [];
		for i in removeCrafting {
			HiiragiUtils.removeCrafting(i);
		}
	//上書き
	//新規
		HiiragiUtils.addCrafting(false, false, <railcraft:frostbound:2>*8, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<minecraft:packed_ice>, B:<ore:dropBlue>}).ingredients);
		HiiragiUtils.addCrafting(false, false, <railcraft:badlands:2>*8, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<minecraft:red_sandstone:2>, B:<ore:dropRed>}).ingredients);
		HiiragiUtils.addCrafting(false, false, <railcraft:sandy:2>*8, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<minecraft:sandstone:2>, B:<ore:dropWhite>}).ingredients);
		HiiragiUtils.addCrafting(false, false, <railcraft:pearlized:2>*8, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<minecraft:end_stone>, B:<ore:dropGreen>}).ingredients);
		HiiragiUtils.addCrafting(false, false, <railcraft:infernal:2>*8, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<minecraft:soul_sand>, B:<ore:dropBlack>}).ingredients);

//かまどレシピの編集
	//削除
		val removeFurnace as IItemStack[] = [];
		for i in removeFurnace {
			HiiragiUtils.removeFurnace(i);
		}
	//新規
		val addFurnace as IIngredient[IItemStack] = {};
		for output, input in addFurnace {
			HiiragiUtils.addFurnace(false, output, input);
		}

//AWレシピの編集
	//import
	//新規

//Castingレシピの追加
	mods.tconstruct.Casting.addBasinRecipe(<railcraft:bloodstained:2>, <minecraft:sandstone:2>, <liquid:blood>, 40, true);

//このscriptの読み込みの完了をログに出力
print("railcraft.zs loaded!");
