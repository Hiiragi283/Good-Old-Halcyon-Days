#====================================================================
# ファイル名 : cot-registry.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Registry new feature with Content Tweaker
#====================================================================

#priority 999
#loader contenttweaker

//crafttweakerからclassをimport
import crafttweaker.data.IData;
import crafttweaker.entity.IEntityCreature;
import crafttweaker.entity.IEntityDefinition;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.player.IPlayer;
import crafttweaker.util.IRandom;
import crafttweaker.world.IBlockAccess;
import crafttweaker.world.IWorld;

//各種modからclassをimport
import mods.contenttweaker.AxisAlignedBB;
import mods.contenttweaker.BlockMaterial;
import mods.contenttweaker.BlockState;
import mods.contenttweaker.BlockPos;
import mods.contenttweaker.Color;
import mods.contenttweaker.Commands;
import mods.contenttweaker.enchantments.EnchantmentBuilder;
import mods.contenttweaker.IBlockColorSupplier;
import mods.contenttweaker.IItemRightClick;
import mods.contenttweaker.MaterialBuilder;
import mods.contenttweaker.MaterialSystem;
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
	function addBlockColored (id as string, material as BlockMaterial, hardness as float, resistance as float, tool as string, toolLevel as int, sound as SoundType, color as string, isFull as bool) {
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
		block.fullBlock = isFull;
		block.register();
	}
	//魔法のキューブを登録する関数
	function addCube (id as string, inactive as bool) {
		var cubeAct = VanillaFactory.createBlock(id, <blockmaterial:rock>);
		cubeAct.setBlockHardness(1.0);
		cubeAct.setBlockResistance(15.0);
		cubeAct.setToolClass("pickaxe");
		cubeAct.setToolLevel(-1);
		cubeAct.setBlockSoundType(<soundtype:stone>);
		cubeAct.fullBlock = false;
		cubeAct.axisAlignedBB = AxisAlignedBB.create(0.25, 0.25, 0.25, 0.75, 0.75, 0.75);
		cubeAct.register();
		if(inactive) {
			var cubeInact = VanillaFactory.createBlock(id ~ "_inactive", <blockmaterial:rock>);
			cubeInact.setBlockHardness(1.0);
			cubeInact.setBlockResistance(15.0);
			cubeInact.setToolClass("pickaxe");
			cubeInact.setToolLevel(-1);
			cubeInact.setBlockSoundType(<soundtype:stone>);
			cubeInact.fullBlock = false;
			cubeInact.axisAlignedBB = AxisAlignedBB.create(0.25, 0.00, 0.25, 0.75, 0.50, 0.75);
			cubeInact.register();
		}
	}

//アイテムの登録処理
	//ただのアイテムの登録
	val mapItems as string[] = [
		"assembly_parallel",
		"assembly_speculative",
		"division_sigil",
		"elven_pearl",
		"ephemerald",
		"gem_carbon",
		"ingot_bedrockium",
		"ingot_stable",
		"ingot_unstable",
		"ragi_ticket",
		"reagent_halogen",
	];
	for i in mapItems {
		addItem(i);
	}
	//色付きアイテムの登録処理
	val mapItemColor as string[string][string] = {
		"drop_soul": {"FFCCFF": "dcs_climate:items/food/drop_cream"},
		"dust_shadestone": {"2D2D2D": "minecraft:items/sugar"},
		"feather_black": {"181818": "minecraft:items/feather"},
		//"grout_ball": {"D0D1D6": "minecraft:items/snowball"},
	};
	for i, j in mapItemColor {
		for k, l in j {
			addItemColor(i, k, l);
		}
	}
	//エンチャント効果を持つアイテムを登録
	val mapItemShimmer as string[] = [
		"division_sigil_perm",
		"quantum_entangler",
		"rune_air",
		"rune_earth",
		"rune_fire",
		"rune_water",
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
	//デバッグ専用アイテムの登録
		//CrT用
		val book_syntax = mods.contenttweaker.VanillaFactory.createItem("book_syntax");
		book_syntax.rarity = "epic";
		book_syntax.itemRightClick = function(stack, world, player, hand) {
			Commands.call("ct syntax", player, world);
			Commands.call("ct reload", player, world);
			return "Pass";
		};
		book_syntax.register();
		//正面向く用
		val book_facing = mods.contenttweaker.VanillaFactory.createItem("book_facing");
		book_facing.rarity = "epic";
		book_facing.itemRightClick = function(stack, world, player, hand) {
			Commands.call("tp @p -335 64 -144 0 0", player, world);
			return "Pass";
		};
		book_facing.register();

//ブロックの登録
	//機能をもたないブロック
	addBlock("block_bedrockium", <blockmaterial:rock>, 1000.0, 18000000.0, "pickaxe", 8, <soundtype:stone>, true);
	addBlock("block_shadestone", <blockmaterial:glass>, 0.3, 0.3, "pickaxe", -1, <soundtype:glass>, true);
	addBlock("dummy_collector", <blockmaterial:rock>, 0.3, 0.3, "pickaxe", -1, <soundtype:stone>, true);
	addBlock("dummy_link", <blockmaterial:rock>, 0.3, 0.3, "pickaxe", -1, <soundtype:stone>, true);
	addBlock("dummy_relay", <blockmaterial:rock>, 0.3, 0.3, "pickaxe", -1, <soundtype:stone>, true);
	addBlock("nether_grout", <blockmaterial:grass>, 3.0, 3.0, "shovel", -1, <soundtype:ground>, true);
	addBlock("pumpkin_melon", <blockmaterial:wood>, 1.0, 1.0, "axe", -1, <soundtype:wood>, true); //Pumpkin Melon (@PumpkinMelon4) 氏に感謝!

	val mapSeared as string[] = [
		"unfired_casting_basin",
		"unfired_casting_channel",
		"unfired_casting_table",
		"unfired_scorched_basin",
		"unfired_scorched_channel",
		"unfired_scorched_table",
	];
	for i in mapSeared {
		addBlock(i, <blockmaterial:grass>, 3.0, 0.5, "shovel", -1, <soundtype:ground>, false);
	}

	//色付きブロックの登録
	addBlockColored("dustblock_lead", <blockmaterial:rock>, 1.5, 15.0, "shovel", 0, <soundtype:stone>, "605E6A", true);

	//HaCのキューブを追加
	val mapCube as bool[string] = {
		"cube_cyan": true,
		"cube_iridescent": false,
		"cube_magenta": true,
		"cube_yellow": true,
	};
	for i, j in mapCube {
		addCube(i, j);
	}

//エンチャントの登録

//溶融錬鉄の登録
val materialWroughtIron = MaterialSystem.getMaterialBuilder()
	.setName("Wrought Iron")
	.setColor(HexHelper.toDecInteger("2e2e2e"))
	.build()
	.registerPart("molten" as string).getData();
	materialWroughtIron.addDataValue("density", "2000");
	materialWroughtIron.addDataValue("luminosity", "10");
	materialWroughtIron.addDataValue("temperature", "769");
	materialWroughtIron.addDataValue("vaporize", "false");
	materialWroughtIron.addDataValue("viscosity", "10000");

//このscriptの読み込みの完了をログに出力
print("cot-registry.zs loaded!");
