#====================================================================
# ファイル名 : initialInventory.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for Initial Inventory
#====================================================================

#priority 90
#norun

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.initialinventory.InvHandler;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading initialInventory.zs ...");

//初期装備の追加
	mods.initialinventory.InvHandler.addStartingItem(<ftbquests:book>);

//このscriptの読み込みの完了をログに出力
print("initialInventory.zs loaded!");
