#====================================================================
# ファイル名 : ae2.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : このファイルについて書く
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.appliedenergistics2.Inscriber;
import mods.ctintegration.util.RecipePattern;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading ae2.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
		val removeCrafting as IItemStack[] = [];
		for i in removeCrafting {
			HiiragiUtils.removeCrafting(i);
		}
	//上書き
	//新規

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

//Inscriberのレシピ
	Inscriber.addRecipe(<enderio:item_basic_capacitor:0>, <ore:dustBedrock>, false, <ore:ingotCopper>, <ore:ingotRedstoneAlloy>);
	Inscriber.addRecipe(<enderio:item_basic_capacitor:1>, <ore:itemSilicon>, false, <ore:ingotSilver>, <ore:ingotEnergeticAlloy>);
	Inscriber.addRecipe(<enderio:item_basic_capacitor:2>, <ore:dustBismuth>, false, <ore:ingotGold>, <ore:ingotVibrantAlloy>);
	Inscriber.addRecipe(<enderio:item_material:3>, <ore:itemPowderPhotovoltaic>, false, <ore:fusedQuartz>, <dcs_climate:dcs_gem_blue:1>);

//このscriptの読み込みの完了をログに出力
print("ae2.zs loaded!");
