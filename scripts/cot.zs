#====================================================================
# ファイル名 : cot.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Script for Content Tweaker
#====================================================================

#priority 100
#loader contenttweaker

//crafttweakerからclassをimport
import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;

//各種modからclassをimport
import mods.contenttweaker.AxisAlignedBB;
import mods.contenttweaker.BlockMaterial;
import mods.contenttweaker.Color;
import mods.contenttweaker.Commands;
import mods.contenttweaker.IBlockColorSupplier;
import mods.contenttweaker.IItemRightClick;
import mods.contenttweaker.ResourceLocation;
import mods.contenttweaker.VanillaFactory;
import mods.ctintegration.baubles.IBaubleInventory;
import mods.ctintegration.data.DataUtil;
import mods.zenutils.HexHelper;

//scriptのimport
import scripts.RussellUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading cot.zs ...");

//アイテムの登録
	val items as string[] = [
		"assembly_parallel",
		"assembly_speculative",
		"elven_pearl",
		"ephemerald",
		"gem_carbon",
		"glyph_divide",
		"ingot_bedrockium",
		"ingot_rainbow",
		"reagent_halogen",
		"ticket_common",
		"ticket_uncommon",
		"ticket_rare",
		"ticket_epic",
		"ticket_legendary",
		"ticket_mythic",
	];
	for i in items {
		RussellUtils.addItem(i);
	}

	RussellUtils.addItemColored("grout_ball", "D0D1D6", "minecraft:items/snowball");
	RussellUtils.addItemColored("feather_black", "181818", "minecraft:items/feather");

	RussellUtils.addItemShimmer("quantum_entangler");

	//Coin
	val mapCoin as string[string] = {
		"coin_manasteel":"81B6F8",
		"coin_terrasteel":"69FD00",
		"coin_elementium":"EF5CD0",
	};
	for i, j in mapCoin {
		RussellUtils.addItemColored(i, j, "thermalfoundation:items/material/coin_iron");
	}

//Baubleの登録
	var ringGoldBlue = VanillaFactory.createBaubleItem("dcs_color_ring2");
	ringGoldBlue.onWornTick = function(bauble, wearer) {
		if(wearer instanceof IPlayer) {
			var player as IPlayer = wearer;
			var world as IWorld = player.world;
			if (world.getWorldTime() % 20 == 0) {
				player.addPotionEffect(<potion:dcs_lib:dcs.potion.freeze_res>.makePotionEffect(220, 0));
			}
		}
	};
	ringGoldBlue.baubleType = "RING";
	ringGoldBlue.register();

//ブロックの登録
	RussellUtils.addBlock("unfired_casting_channel", <blockmaterial:grass>, 3.0, 0.5, "shovel", -1, <soundtype:ground>, false);
	RussellUtils.addBlock("unfired_casting_table", <blockmaterial:grass>, 3.0, 0.5, "shovel", -1, <soundtype:ground>, false);
	RussellUtils.addBlock("unfired_casting_basin", <blockmaterial:grass>, 3.0, 0.5, "shovel", -1, <soundtype:ground>, false);
	RussellUtils.addBlock("block_bedrockium", <blockmaterial:rock>, 1000.0, 18000000.0, "pickaxe", 8, <soundtype:stone>, true);

//粉末ブロックの登録
	val registerDustBlock as string[string] = {
		"alubrass": "F3D367",
		"ardite": "C44712",
		"cobalt": "5050FA",
		"constantan": "D1A35B",
		"electrum": "BE9A45",
		"invar": "818D88",
		"iridium": "C6C4E2",
		"lead": "605E6A",
		"manyullyn": "A681E1",
		"osmium": "ABBDCF",
		"platinum": "C2D0D8",
	};
	for i, j in registerDustBlock {
		RussellUtils.addBlockColored("dustblock_" ~ i, <blockmaterial:rock>, 1.5, 15.0, "shovel", 0, <soundtype:stone>, j);
	}

//HaCのキューブを追加
	RussellUtils.addCubeInactive("cube_yellow_inactive", <blockmaterial:rock>, 1.0, 15.0, "pickaxe", -1, <soundtype:stone>, false);
	RussellUtils.addCubeInactive("cube_magenta_inactive", <blockmaterial:rock>, 1.0, 15.0, "pickaxe", -1, <soundtype:stone>, false);
	RussellUtils.addCubeInactive("cube_cyan_inactive", <blockmaterial:rock>, 1.0, 15.0, "pickaxe", -1, <soundtype:stone>, false);

	RussellUtils.addCube("cube_yellow", <blockmaterial:rock>, 1.0, 15.0, "pickaxe", -1, <soundtype:stone>, false);
	RussellUtils.addCube("cube_magenta", <blockmaterial:rock>, 1.0, 15.0, "pickaxe", -1, <soundtype:stone>, false);
	RussellUtils.addCube("cube_cyan", <blockmaterial:rock>, 1.0, 15.0, "pickaxe", -1, <soundtype:stone>, false);

	var block = VanillaFactory.createBlock("cube_iridescent", <blockmaterial:glass>);
	block.setBlockHardness(1.0);
	block.setBlockResistance(15.0);
	block.setToolClass("pickaxe");
	block.setToolLevel(4);
	block.setBlockSoundType(<soundtype:glass>);
	block.fullBlock = false;
	//block.lightOpacity = 0;
	block.lightValue = 1;
	//block.translucent = true;
	block.axisAlignedBB = AxisAlignedBB.create(0.25, 0.25, 0.25, 0.75, 0.75, 0.75);
	block.register();


//液体の登録
	val registerLiquid as string[string] = {
		"drop_red": "500001",
		"drop_green": "0c4e00",
		"drop_blue": "000b62",
		"drop_white": "544700",
		"drop_black": "27160d",
	};
	for i, j in registerLiquid {
		var liquid = mods.contenttweaker.VanillaFactory.createFluid(i, HexHelper.toDecInteger(j));
		liquid.register();
	}

//デバッグ専用アイテムの登録
	val book_reloadEvents = mods.contenttweaker.VanillaFactory.createItem("book_reloadevents");
	book_reloadEvents.rarity = "epic";
	book_reloadEvents.itemRightClick = function(stack, world, player, hand) {
		Commands.call("ct reloadevents", player, world);
		return "Pass";
	};
	book_reloadEvents.register();

	val book_syntax = mods.contenttweaker.VanillaFactory.createItem("book_syntax");
	book_syntax.rarity = "epic";
	book_syntax.itemRightClick = function(stack, world, player, hand) {
		Commands.call("ct syntax", player, world);
		return "Pass";
	};
	book_syntax.register();

	val book_facing = mods.contenttweaker.VanillaFactory.createItem("book_facing");
	book_facing.rarity = "epic";
	book_facing.itemRightClick = function(stack, world, player, hand) {
		Commands.call("tp @p -335 64 -144 180 0", player, world);
		return "Pass";
	};
	book_facing.register();

	val book_data = mods.contenttweaker.VanillaFactory.createItem("book_data");
	book_data.rarity = "epic";
	book_data.itemRightClick = function(stack, world, player, hand) {
		var data as IData = player.data;
		var json as string = mods.ctintegration.data.DataUtil.toJson(data);
		print(json);
		return "Pass";
	};
	book_data.register();

//このscriptの読み込みの完了をログに出力
print("cot.zs loaded!");
