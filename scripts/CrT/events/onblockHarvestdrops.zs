#====================================================================
# Name   : onblockharvestDrops.zs
# Author : Hiiragi R. Tsubasa: https://github.com/Hiiragi283
# Info   : Fired whe blocks harvested
#====================================================================

#loader crafttweaker reloadable
#priority 0

//Classのimport
import crafttweaker.block.IBlock;
import crafttweaker.data.IData;
import crafttweaker.event.BlockHarvestDropsEvent;
import crafttweaker.events.IEventManager;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.player.IPlayer;
import mods.zenutils.HexHelper;
import mods.zenutils.I18n;
import scripts.grassUtils.EventUtils;
import scripts.HiiragiUtils;

//読み込みの開始をログに出力
print("Start loading onblockharvestDrops.zs ...");

//ブロックが破壊された際に呼び出す
events.onBlockHarvestDrops(function(event as BlockHarvestDropsEvent) {
	//eventの実行者がプレイヤーかつ破壊したブロックがカボチャメロンの場合
	if(event.isPlayer && event.block.definition.id == "contenttweaker:pumpkin_melon") {
		//ドロップリストを上書き
		event.drops = [
			<minecraft:wheat_seeds>%100,
			<minecraft:pumpkin_seeds>%50,
			<minecraft:melon_seeds>%50,
			<minecraft:beetroot_seeds>%50,
			<inspirations:cactus_seeds>%25,
			<inspirations:sugar_cane_seeds>%25,
			<inspirations:carrot_seeds>%75,
			<inspirations:potato_seeds>%75,
		];
	}
});

//読み込みの完了をログに出力
print("onblockharvestDrops.zs loaded!");
