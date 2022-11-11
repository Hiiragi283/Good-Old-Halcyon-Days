#====================================================================
# Name   : block.zs
# Author : Hiiragi R. Tsubasa: https://github.com/Hiiragi283
# Info   : Register blocks
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
print("Start loading block.zs ...");

//関数の定義

//登録
	//Unfired Casting **
	val mapUnfired as string[] = [
		"unfired_casting_basin",
		"unfired_casting_channel",
		"unfired_casting_table",
	];
	for i in mapUnfired {
	CotUtils.addBlock(i, <blockmaterial:grass>, 3.0, 0.5, <soundtype:ground>, 0, false, "shovel", -1);
	}

//読み込みの完了をログに出力
print("block.zs loaded!");
