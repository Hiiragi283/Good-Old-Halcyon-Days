#====================================================================
# ファイル名 : bop.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Script for Biomes O Plenty
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
print("Start loading bop.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
	val removeCrafting as IItemStack[] = [];
	for i in removeCrafting {
		HiiragiUtils.removeCrafting(i);
	}
	//上書き
	//新規

//AWレシピの編集
	//import
	//新規

//Orechid TerrestrisによるBOP鉱石の生成
	val orechid_terrestris = mods.morechids.Registry.getFlower("orechid_terrestris");
	for i in 1 to 8 {
		orechid_terrestris.addRecipe(<minecraft:stone>, <biomesoplenty:gem_ore>.definition.makeStack(i), 1);
	}

//このscriptの読み込みの完了をログに出力
print("bop.zs loaded!");
