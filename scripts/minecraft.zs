#====================================================================
# ファイル名 : minecraft.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : このファイルについて書く
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
		HiiragiUtils.addCraftingShaped(true, <minecraft:furnace>, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<ore:cobblestone>, B:<dcs_climate:dcs_tinder:1>}).ingredients, null, null);
	//新規

//AWレシピの編集
	//import
	//新規

//このscriptの読み込みの完了をログに出力
print("minecraft.zs loaded!");
