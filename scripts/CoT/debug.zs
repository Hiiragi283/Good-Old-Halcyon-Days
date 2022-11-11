#====================================================================
# Name   : debug.zs
# Author : Hiiragi R. Tsubasa: https://github.com/Hiiragi283
# Info   : Register debug items
#====================================================================

#loader contenttweaker
#priority 999

//Classのimport
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;
import mods.contenttweaker.Commands;
import mods.contenttweaker.IItemRightClick;
import mods.contenttweaker.VanillaFactory;

//読み込みの開始をログに出力
print("Start loading debug.zs ...");

//デバッグ専用アイテムの登録
	//CrTの文法チェック & eventの再読み込み
	val book_syntax = mods.contenttweaker.VanillaFactory.createItem("book_syntax");
	book_syntax.rarity = "epic";
	book_syntax.itemRightClick = function(stack, world, player, hand) {
		Commands.call("ct syntax", player, world);
		Commands.call("ct reload", player, world);
		return "Pass";
	};
	book_syntax.register();
	//真正面を向く用
	val book_facing = mods.contenttweaker.VanillaFactory.createItem("book_facing");
	book_facing.rarity = "epic";
	book_facing.itemRightClick = function(stack, world, player, hand) {
		val spawnX = world.getWorldInfo().spawnX;
		val spawnY = world.getWorldInfo().spawnY;
		val spawnZ = world.getWorldInfo().spawnZ;
		Commands.call("tp @p " ~ spawnX ~ " 128 " ~ spawnZ ~ " 0 0", player, world);
		return "Pass";
	};
	book_facing.register();

//読み込みの完了をログに出力
print("debug.zs loaded!");
