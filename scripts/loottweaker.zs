#====================================================================
# ファイル名 : loottweaker.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Tweaking Loot Tables
#====================================================================

#priority 99

//crafttweakerからclassをimport
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

//各種modからclassをimport
import mods.ctintegration.util.RecipePattern;
import loottweaker.LootTweaker;
import loottweaker.vanilla.loot.LootPool;
import loottweaker.vanilla.loot.LootTable;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading loottweaker.zs ...");

//関数の定義
	//任意のLoottableからアイテムを削除する関数
	function removeLoot(lootTable as string, tableName as string, remove as string) {
		LootTweaker.getTable(lootTable).getPool(tableName).removeEntry(remove);
	}
	//任意のLoottableにアイテムを追加する関数
	function addLoot(lootTable as string, tableName as string, rollMin as int, rollMax as int, bonusMin as int, bonusMax as int, item as IItemStack, weight as int) {
		LootTweaker.getTable(lootTable).addPool(tableName, rollMin, rollMax, bonusMin, bonusMax).addItemEntry(item, weight);
	}

//Loottableの削除
removeLoot("minecraft:entities/wither_skeleton", "inspirations", "inspirations");

//Loottableの追加

//このscriptの読み込みの完了をログに出力
print("loottweaker.zs loaded!");
