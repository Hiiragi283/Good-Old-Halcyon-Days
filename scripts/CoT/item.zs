#====================================================================
# Name   : item.zs
# Author : Hiiragi R. Tsubasa: https://github.com/Hiiragi283
# Info   : Register items
#====================================================================

#loader contenttweaker
#priority 0

//Classのimport
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.contenttweaker.VanillaFactory;
import mods.zenutils.HexHelper;
import mods.zenutils.I18n;
import scripts.grassUtils.CotUtils;

//読み込みの開始をログに出力
print("Start loading item.zs ...");

//関数の定義

//登録
	val mapItem as string[] = [
		"ragi_ticket"
	];
	for i in mapItem {
		CotUtils.addNormalItem(i);
	}

//読み込みの完了をログに出力
print("item.zs loaded!");
