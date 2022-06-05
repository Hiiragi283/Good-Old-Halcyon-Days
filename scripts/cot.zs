#======================================================================
# ファイル名 : _TEMPLATE.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : このファイルについて書く
#======================================================================

#loader contenttweaker
#priority 100

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.contenttweaker.BlockMaterial;
import mods.contenttweaker.Color;
import mods.contenttweaker.IBlockColorSupplier;
import mods.contenttweaker.ResourceLocation;
import mods.contenttweaker.VanillaFactory;
import mods.zenutils.HexHelper;

//scriptのimport
import scripts.RussellUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading _TEMPLATE.zs ...");

//アイテムの登録
	val items as string[] = [
		"elven_pearl",
		"ephemerald",
		"token_stone",
		"token_obsidian",
		"token_netherrack",
		"token_end_stone",
		"token_prismarine",
	];
	for i in items {
		RussellUtils.addItem(i);
	}

	RussellUtils.addItemColored("grout_ball", "D0D1D6", "minecraft:items/snowball");

	val itemsPebble as string[string] = {
		"pebble_stone": "CDCDCD",
		"pebble_granite": "CFA18C",
		"pebble_diorite": "EFEFEF",
		"pebble_andesite": "BEBEBE",
		"pebble_bedrock": "2F2F2F",
		"pebble_obsidian": "503264",
		"pebble_netherrack": "C80000",
		"pebble_end_stone": "D9DE9E",
		"pebble_prismarine": "C8FFFF",
	};
	for i, j in itemsPebble {
		RussellUtils.addItemColored(i, j, "dcs_climate:items/ores/gem_chal_white");
	}

//ブロックの登録
	RussellUtils.addBlockAdvanced("unfired_casting_channel", <blockmaterial:grass>, 3.0, 0.5, "shovel", -1, <soundtype:ground>, false);
	RussellUtils.addBlockAdvanced("unfired_casting_table", <blockmaterial:grass>, 3.0, 0.5, "shovel", -1, <soundtype:ground>, false);
	RussellUtils.addBlockAdvanced("unfired_casting_basin", <blockmaterial:grass>, 3.0, 0.5, "shovel", -1, <soundtype:ground>, false);

	//RussellUtils.addBlockAdvanced("block_evolite", <blockmaterial:iron>, 5.0, 5.0, "pickaxe", 2, <soundtype:metal>, false);

//このscriptの読み込みの完了をログに出力
print("_TEMPLATE.zs loaded!");
