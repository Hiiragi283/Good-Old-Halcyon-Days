#====================================================================
# Name   : onPlayerInteractBlock.zs
# Author : Hiiragi R. Tsubasa: https://github.com/Hiiragi283
# Info   : fired when player right-click a block
#====================================================================

#priority 0

//Classのimport
import crafttweaker.block.IBlock;
import crafttweaker.data.IData;
import crafttweaker.event.IBlockEvent;
import crafttweaker.event.PlayerInteractBlockEvent;
import crafttweaker.events.IEventManager;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;
import mods.zenutils.HexHelper;
import mods.zenutils.I18n;
import scripts.grassUtils.EventUtils;
import scripts.HiiragiUtils;

//読み込みの開始をログに出力
print("Start loading onPlayerInteractBlock.zs ...");

events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
	if(!event.world.remote && !isNull(event.block) && !isNull(event.item)) {
		//デバッグ用
		if(event.item.matches(<theoneprobe:creativeprobe>)) {
			event.cancel();
			val block = event.block;
			val blockDef = block.definition;
			event.player.sendMessage("=============================================");
			event.player.sendMessage("Name:" ~ blockDef.displayName);
			event.player.sendMessage("ID:" ~ blockDef.id);
			event.player.sendMessage("Meta:" ~ block.meta);
			event.player.sendMessage("Hardness:" ~ blockDef.hardness);
			event.player.sendMessage("Resistance:" ~ blockDef.resistance);
			event.player.sendMessage("Level:" ~ blockDef.harvestLevel);
			event.player.sendMessage("Tool:" ~ blockDef.harvestTool);
		}
	}
});

//読み込みの完了をログに出力
print("onPlayerInteractBlock.zs loaded!");
