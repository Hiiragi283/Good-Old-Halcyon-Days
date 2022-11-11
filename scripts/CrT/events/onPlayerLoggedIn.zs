#====================================================================
# Name   : onPlayerLoggedIn.zs
# Author : Hiiragi R. Tsubasa: https://github.com/Hiiragi283
# Info   : fired when player log in the world
#====================================================================

#priority 0

//Classのimport
import crafttweaker.block.IBlock;
import crafttweaker.data.IData;
import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.events.IEventManager;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.player.IPlayer;
import crafttweaker.text.ITextComponent;
import mods.zenutils.HexHelper;
import mods.zenutils.I18n;
import scripts.grassUtils.EventUtils;
import scripts.HiiragiUtils;

//読み込みの開始をログに出力
print("Start loading onPlayerLoggedIn.zs ...");

events.onPlayerLoggedIn(function(event as PlayerLoggedInEvent) {
	val player as IPlayer = event.player;
	if(!player.world.isRemote()) {
		player.sendRichTextStatusMessage(ITextComponent.fromString("§c============================================="), false);
		player.sendRichTextStatusMessage(ITextComponent.fromTranslation("gohd.custom.welcome.name"), false);
		player.sendRichTextStatusMessage(ITextComponent.fromString("§c============================================="), false);
		server.commandManager.executeCommand(server, "projecte reloadEMC");
	}
});

//読み込みの完了をログに出力
print("onPlayerLoggedIn.zs loaded!");
