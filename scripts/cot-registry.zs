#====================================================================
# ファイル名 : cot-registry.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Registry new feature with Content Tweaker
#====================================================================

#priority 100
#loader contenttweaker

//crafttweakerからclassをimport
import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IBlockAccess;
import crafttweaker.world.IWorld;

//各種modからclassをimport
import mods.contenttweaker.AxisAlignedBB;
import mods.contenttweaker.BlockMaterial;
import mods.contenttweaker.BlockState;
import mods.contenttweaker.BlockPos;
import mods.contenttweaker.Color;
import mods.contenttweaker.Commands;
import mods.contenttweaker.IBlockColorSupplier;
import mods.contenttweaker.IItemRightClick;
import mods.contenttweaker.ResourceLocation;
import mods.contenttweaker.SoundType;
import mods.contenttweaker.VanillaFactory;
import mods.ctintegration.baubles.IBaubleInventory;
import mods.ctintegration.data.DataUtil;
import mods.zenutils.HexHelper;

//scriptのimport

//このscriptの読み込みの開始をログに出力
print("Start loading cot-registry.zs ...");

//関数の定義
	//ただのアイテムを登録する関数
	function addItem(id as string) {
		mods.contenttweaker.VanillaFactory.createItem(id).register();
	}
	//色付きのアイテムを登録する関数
	function addItemColor(id  as string, color as string, texture as string) {
		var item = mods.contenttweaker.VanillaFactory.createItem(id);
		item.itemColorSupplier = function(item, tintindex) {
				return Color.fromHex(color);
			};
			item.textureLocation = ResourceLocation.create(texture);
			item.register();
	}
	//エンチャント効果を持つアイテムを登録する関数
	function addItemShimmer(id as string) {
		var itemShimmer = mods.contenttweaker.VanillaFactory.createItem(id);
		itemShimmer.glowing = true;
		itemShimmer.register();
	}
	//機能のないブロックを登録する関数
	function addBlock (id as string, material as BlockMaterial, hardness as float, resistance as float, tool as string, toolLevel as int, sound as SoundType, isFull as bool) {
		var block = VanillaFactory.createBlock(id, material);
		block.setBlockHardness(hardness);
		block.setBlockResistance(resistance);
		block.setToolClass(tool);
		block.setToolLevel(toolLevel);
		block.setBlockSoundType(sound);
		block.fullBlock = isFull;
		block.register();
	}
	//色付きのブロックを登録する関数
	function addBlockColored (id as string, material as BlockMaterial, hardness as float, resistance as float, tool as string, toolLevel as int, sound as SoundType, color as string) {
		var block = VanillaFactory.createBlock(id, material);
		block.setBlockHardness(hardness);
		block.setBlockResistance(resistance);
		block.setToolClass(tool);
		block.setToolLevel(toolLevel);
		block.setBlockSoundType(sound);
		block.blockColorSupplier = function(state as BlockState, access as IBlockAccess, pos as BlockPos, tintIndex as int) as Color {
			return Color.fromHex(color);
		};
		block.itemColorSupplier = function(item, tintindex) {
			return Color.fromHex(color);
		};
		block.register();
	}
	//粉末ブロックを登録する関数
	function addDustBlock (id as string, material as BlockMaterial, hardness as float, resistance as float, tool as string, toolLevel as int, sound as SoundType) {
		var block = VanillaFactory.createBlock(id, material);
		block.setBlockHardness(hardness);
		block.setBlockResistance(resistance);
		block.setToolClass(tool);
		block.setToolLevel(toolLevel);
		block.setBlockSoundType(sound);
		block.onUpdateTick = function(world, blockPos, blockState){
			return true;
		};
		block.register();
	}
	//活性済みキューブを登録する関数
	function addCube (id as string, material as BlockMaterial, hardness as float, resistance as float, tool as string, toolLevel as int, sound as SoundType, isFull as bool) {
		var block = VanillaFactory.createBlock(id, material);
		block.setBlockHardness(hardness);
		block.setBlockResistance(resistance);
		block.setToolClass(tool);
		block.setToolLevel(toolLevel);
		block.setBlockSoundType(sound);
		block.fullBlock = isFull;
		block.axisAlignedBB = AxisAlignedBB.create(0.25, 0.25, 0.25, 0.75, 0.75, 0.75);
		block.register();
	}
	//不活性なキューブを登録する関数
	function addCubeInactive (id as string, material as BlockMaterial, hardness as float, resistance as float, tool as string, toolLevel as int, sound as SoundType, isFull as bool) {
		var block = VanillaFactory.createBlock(id, material);
		block.setBlockHardness(hardness);
		block.setBlockResistance(resistance);
		block.setToolClass(tool);
		block.setToolLevel(toolLevel);
		block.setBlockSoundType(sound);
		block.fullBlock = isFull;
		block.axisAlignedBB = AxisAlignedBB.create(0.25, 0.00, 0.25, 0.75, 0.50, 0.75);
		block.register();
	}

//アイテムの登録処理
	//ただのアイテムの登録
	val mapItems as string[] = [
		"assembly_parallel",
		"assembly_speculative",
		"elven_pearl",
		"ephemerald",
		"gem_carbon",
		//"glyph_divide",
		"division_sigil",
		"ingot_bedrockium",
		"ingot_rainbow",
		"ingot_stable",
		"ingot_unstable",
		//"item_fire",
		"reagent_halogen",
		"ticket_common",
		"ticket_uncommon",
		"ticket_rare",
		"ticket_epic",
		"ticket_legendary",
		"ticket_mythic",
	];
	for i in mapItems {
		addItem(i);
	}
	//色付きアイテムの登録処理
	val mapItemColor as string[string][string] = {
		"grout_ball": {"D0D1D6": "minecraft:items/snowball"},
		"feather_black": {"181818": "minecraft:items/feather"},
	};
	for i, j in mapItemColor {
		for k, l in j {
			addItemColor(i, k, l);
		}
	}
	//エンチャント効果を持つアイテムを登録
	val mapItemShimmer as string[] = [
		"division_sigil_perm",
		"quantum_entangler"
	];
	for i in mapItemShimmer {
		addItemShimmer(i);
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
	//Activated Division Sigilの登録
	val sigilTemp = mods.contenttweaker.VanillaFactory.createItem("division_sigil_temp");
	sigilTemp.glowing = true;
	sigilTemp.maxDamage = 256;
	sigilTemp.maxStackSize = 1;
	sigilTemp.rarity = "rare";
	sigilTemp.register();
	//Ancient Tomeの登録
	val tomeAncient = mods.contenttweaker.VanillaFactory.createItem("tome_ancient");
	tomeAncient.maxStackSize = 1;
	tomeAncient.rarity = "epic";
	tomeAncient.itemRightClick = function(stack, world, player, hand) {
	Commands.call("say hello", player, world);
	return "Pass";
	};
	tomeAncient.register();

//ブロックの登録
	//機能をもたないブロック
	addBlock("unfired_casting_channel", <blockmaterial:grass>, 3.0, 0.5, "shovel", -1, <soundtype:ground>, false);
	addBlock("unfired_casting_table", <blockmaterial:grass>, 3.0, 0.5, "shovel", -1, <soundtype:ground>, false);
	addBlock("unfired_casting_basin", <blockmaterial:grass>, 3.0, 0.5, "shovel", -1, <soundtype:ground>, false);
	addBlock("block_bedrockium", <blockmaterial:rock>, 1000.0, 18000000.0, "pickaxe", 8, <soundtype:stone>, true);
	addBlock("pumpkin_melon", <blockmaterial:wood>, 1.0, 1.0, "axe", -1, <soundtype:wood>, true); //Pumpkin Melon (@PumpkinMelon4) 氏に感謝!
	addBlockColored("advstructuremachine", <blockmaterial:rock>, 3.0, 15.0, "pickaxe", 4, <soundtype:stone>, "AE9169");
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
		addBlockColored("dustblock_" ~ i, <blockmaterial:rock>, 1.5, 15.0, "shovel", 0, <soundtype:stone>, j);
	}

	//HaCのキューブを追加
	addCubeInactive("cube_yellow_inactive", <blockmaterial:rock>, 1.0, 15.0, "pickaxe", -1, <soundtype:stone>, false);
	addCubeInactive("cube_magenta_inactive", <blockmaterial:rock>, 1.0, 15.0, "pickaxe", -1, <soundtype:stone>, false);
	addCubeInactive("cube_cyan_inactive", <blockmaterial:rock>, 1.0, 15.0, "pickaxe", -1, <soundtype:stone>, false);
	addCube("cube_yellow", <blockmaterial:rock>, 1.0, 15.0, "pickaxe", -1, <soundtype:stone>, false);
	addCube("cube_magenta", <blockmaterial:rock>, 1.0, 15.0, "pickaxe", -1, <soundtype:stone>, false);
	addCube("cube_cyan", <blockmaterial:rock>, 1.0, 15.0, "pickaxe", -1, <soundtype:stone>, false);
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
print("cot-registry.zs loaded!");