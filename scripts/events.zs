#====================================================================
# ファイル名 : events.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for tweaking events
#====================================================================

#priority 97
#loader crafttweaker reloadableevents

//crafttweakerからclassをimport
import crafttweaker.block.IBlock;
import crafttweaker.command.ICommand;
import crafttweaker.command.ICommandManager;
import crafttweaker.data.IData;
import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityCreature;
import crafttweaker.entity.IEntityDefinition;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.event.BlockHarvestDropsEvent;
import crafttweaker.event.IBlockEvent;
import crafttweaker.event.ILivingEvent;
import crafttweaker.event.PlayerAttackEntityEvent;
import crafttweaker.event.PlayerDeathDropsEvent;
import crafttweaker.event.PlayerInteractBlockEvent;
import crafttweaker.event.PlayerInteractEvent;
import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.events.IEventManager;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.potions.IPotion;
import crafttweaker.potions.IPotionEffect;
import crafttweaker.text.ITextComponent;
import crafttweaker.world.IWorld;

//scriptのimport
//import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading events.zs ...");

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

//プレイヤーが死ぬと呼び出す
events.onPlayerDeathDrops(function(event as PlayerDeathDropsEvent) {
	//魂のかけらをドロップ
	event.addItem(<contenttweaker:drop_soul>);
});

//プレイヤーがブロックに干渉すると呼び出す
events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
	if(!event.world.remote && !isNull(event.block) && !isNull(event.item)) {
		//除算のシジルの一時的な活性化レシピ
		if(event.block.definition.id == "minecraft:enchanting_table" && event.item.matches(<contenttweaker:division_sigil>)) {
			event.cancel();
			if(event.player.xp >= 30) {
				event.player.xp -= 30;
				event.item.mutable().shrink(1);
				event.player.give(<contenttweaker:division_sigil_temp>);
			}
		}
		//HaCのwikiを開く
		if(event.item.matches(<dcs_climate:dcs_icons>)) {
			//ja_Jpの場合
			if(client.language == "ja_jp") {
				server.commandManager.executeCommand(server, "tellraw @a {\"translate\":\"gohd.955c06b4.7717ddde.f60cf47b.title\",\"clickEvent\":{\"action\":\"open_url\",\"value\":\"https://defeatedcrow.jp/modwiki/HeatAndClimate\"}}");
			} //それ以外の場合はen_USで固定
			else {
				server.commandManager.executeCommand(server, "tellraw @a {\"translate\":\"gohd.955c06b4.7717ddde.f60cf47b.title\",\"clickEvent\":{\"action\":\"open_url\",\"value\":\"https://defeatedcrow.jp/modwiki/HeatAndClimate_EN\"}}");
			}
		}
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

//プレイヤーがログインすると呼び出す
events.onPlayerLoggedIn(function(event as PlayerLoggedInEvent) {
	val player as IPlayer = event.player;
	if(!player.world.isRemote()) {
		player.sendRichTextStatusMessage(ITextComponent.fromString("§c============================================="), false);
		player.sendRichTextStatusMessage(ITextComponent.fromTranslation("gohd.custom.welcome.name"), false);
		player.sendRichTextStatusMessage(ITextComponent.fromString("§c============================================="), false);
		server.commandManager.executeCommand(server, "projecte reloadEMC");
		server.commandManager.executeCommand(server, "gamerule doMobGriefing false");
	}
});

//プレイヤーに対して毎tickごとに呼び出す
events.onPlayerTick(function(event as PlayerTickEvent) {
	val player as IPlayer = event.player;
	val world as IWorld = player.world;
	if(!world.remote) {
		//20tickに1回処理を挟む
		if(world.getWorldTime() % 20 == 0) {
			//特定のアイテムを利き手に持っている際にイベントを起こす
			if(!isNull(player.mainHandHeldItem)) {
				val itemMain as IItemStack = player.mainHandHeldItem;
				//Bedrockium Ingot
				if(itemMain.matches(<contenttweaker:ingot_bedrockium>) || itemMain.matches(<contenttweaker:block_bedrockium>)) {
					player.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(120, 4));
				}
			}
			//特定のアイテムを利き手とは逆に持っている際にイベントを起こす
			if(!isNull(player.offHandHeldItem)){
				val itemOff as IItemStack = player.offHandHeldItem;
				//Rainbow Ingot
				if(itemOff.matches(<extendedcrafting:material:32>)) {
					player.addPotionEffect(<potion:minecraft:strength>.makePotionEffect(120, 7));
					player.addPotionEffect(<potion:minecraft:fire_resistance>.makePotionEffect(120, 7));
					player.addPotionEffect(<potion:minecraft:haste>.makePotionEffect(120, 7));
					player.addPotionEffect(<potion:dcs_climate:dcs.potion.bird>.makePotionEffect(120, 7));
					player.addPotionEffect(<potion:minecraft:luck>.makePotionEffect(120, 7));
					player.addPotionEffect(<potion:dcs_lib:dcs.potion.freeze_res>.makePotionEffect(120, 7));
					player.addPotionEffect(<potion:minecraft:night_vision>.makePotionEffect(120, 7));
				}
			}
			//温泉につかると再生バフを付与
			if(world.getBlock(player.position).definition.id == "dcs_climate:dcs_fluidblock_hotspring") {
				player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(220, 0));
			}
			//魔材につかると吐き気デバフを付与
			if(world.getBlock(player.position).definition.id == "dcs_climate:dcs_fluidblock_mazai") {
				player.addPotionEffect(<potion:minecraft:nausea>.makePotionEffect(220, 0));
			}
			//液体青スライムにつかると跳躍力上昇バフを付与
			if(world.getBlock(player.position).definition.id == "tconstruct:blueslime") {
				player.addPotionEffect(<potion:minecraft:jump_boost>.makePotionEffect(220, 2));
			}
			//液体紫スライムにつかると幸運バフを付与
			if(world.getBlock(player.position).definition.id == "tconstruct:purpleslime") {
				player.addPotionEffect(<potion:minecraft:luck>.makePotionEffect(220, 2));
			}
		}
	}
});

//ウィザーが死ぬと除算のシジルを確定でドロップする
<entity:minecraft:wither>.addDropFunction(function(entity, damageSource) {
	return <contenttweaker:division_sigil>;
});

//このscriptの読み込みの完了をログに出力
print("events.zs loaded!");
