#====================================================================
# ファイル名 : projecte.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for ProjectE and its addon
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

//各種modからclassをimport
import mods.ctintegration.projecte.EMCManager;
import mods.ctintegration.util.RecipePattern;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading projecte.zs ...");

//作業台レシピの編集
recipes.removeByMod("projectex");
	//上書き
	//新規

//EMCの編集
	//EMCの読み込み
	EMCManager.mapEMC();
	//EMCの削除
	//EMCの追加
	val mapEMC as long[IItemStack] = {
		//Stone
		<minecraft:cobblestone>: 1,
		<extrautils2:compressedcobblestone:0>: 9,
		<extrautils2:compressedcobblestone:1>: 81,
		<extrautils2:compressedcobblestone:2>: 729,
		<extrautils2:compressedcobblestone:3>: 6561,
		<extrautils2:compressedcobblestone:4>: 59049,
		<extrautils2:compressedcobblestone:5>: 531441,
		<extrautils2:compressedcobblestone:6>: 4782969,
		<extrautils2:compressedcobblestone:7>: 43046721,
		<minecraft:stone:0>: 1,
		<minecraft:stone:1>: 1,
		<minecraft:stone:3>: 1,
		<minecraft:stone:5>: 1,
		<minecraft:mossy_cobblestone>: 2,
		<minecraft:end_stone>: 4,
		<chisel:basalt2:7>: 1,
		<chisel:limestone2:7>: 1,
		<chisel:marble2:7>: 1,
		<dcs_climate:dcs_layer_stone_new:1>: 2,
		<dcs_climate:dcs_layer_skarn:0>: 1,
		<dcs_climate:dcs_layer_skarn:1>: 1,
		<dcs_climate:dcs_layer_skarn:2>: 1,
		<dcs_climate:dcs_ore_gemblock:6>: 1,
		//Color Ore
		<dcs_climate:dcs_ore_stone_new:0>: 1024,
		<dcs_climate:dcs_ore_stone_new:1>: 1024,
		<dcs_climate:dcs_ore_stone_new:2>: 1024,
		<dcs_climate:dcs_ore_stone_new:3>: 1024,
		<dcs_climate:dcs_ore_stone_new:4>: 1024,
		<dcs_climate:dcs_ore_stone_new:5>: 2048,
		<dcs_climate:dcs_ore_stone_new:6>: 2048,
		<dcs_climate:dcs_ore_stone_new:7>: 2048,
		<dcs_climate:dcs_ore_stone_new:8>: 2048,
		<dcs_climate:dcs_ore_stone_new:9>: 2048,
		//Dirt
		<minecraft:dirt>: 1,
		<extrautils2:compresseddirt:0>: 9,
		<extrautils2:compresseddirt:1>: 81,
		<extrautils2:compresseddirt:2>: 729,
		<extrautils2:compresseddirt:3>: 6561,
		<biomesoplenty:dirt:0>: 1,
		<biomesoplenty:dirt:1>: 1,
		<biomesoplenty:dirt:2>: 1,
		//Gravel
		<minecraft:gravel>: 1,
		<extrautils2:compressedgravel:0>: 9,
		<extrautils2:compressedgravel:1>: 81,
		//Netherrack
		<minecraft:netherrack>: 2,
		<extrautils2:compressednetherrack:0>: 18,
		<extrautils2:compressednetherrack:1>: 162,
		//Sand
		<minecraft:sand>: 1,
		<extrautils2:compressedsand:0>: 9,
		<extrautils2:compressedsand:1>: 81,
		<biomesoplenty:white_sand>: 1,
		<biomesoplenty:dried_sand>: 1,
		<chisel:brownstone>: 2,
		//Other
		<minecraft:dragon_egg>: 32768,
	};
	for i, j in mapEMC {
		EMCManager.setEMC(i, j);
	}
	for i in 0 to 16 {
		EMCManager.setEMC(<pickletweaks:colored_cobblestone>.definition.makeStack(i), 1);
	}

//このscriptの読み込みの完了をログに出力
print("projecte.zs loaded!");
