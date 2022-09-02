#====================================================================
# ファイル名 : compactMachines3.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for Compact Machines 3
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading compactMachines3.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
		val removeCrafting as IItemStack[] = [
			<compactmachines3:psd>,
		];
		for i in removeCrafting {
			HiiragiUtils.removeCrafting(i);
		}
	//上書き
	HiiragiUtils.addCraftingShaped(true, <compactmachines3:fieldprojector>*4, RecipePattern.init([" A ", " B ", "CCC"]).map({A:<compactmachines3:psd>.reuse(), B:<appliedenergistics2:material:47>, C:<appliedenergistics2:smooth_sky_stone_block>}).ingredients, null, null);
	//新規

//AWレシピの編集
	//新規
	RecipeBuilder.get("basic")
		.setShaped([
			[null, <ore:pearlFluix>, null, <ore:pearlFluix>],
			[null, null, <appliedenergistics2:material:41>, null],
			[<openblocks:glyph:67>, <openblocks:glyph:97>, <openblocks:glyph:116>, null],
			[<openblocks:glyph:105>, <openblocks:glyph:115>, null, null],
			[<openblocks:glyph:99>, <openblocks:glyph:117>, <openblocks:glyph:116>, <openblocks:glyph:101>]])
		.setSecondaryIngredients([<mekanism:portableteleporter>, <thermalfoundation:material:359> * 32, <mekanism:controlcircuit:3> * 8, <mekanism:atomicalloy> * 8, <enderio:item_material:16> * 4])
		.addOutput(<compactmachines3:psd>)
		.create();

//このscriptの読み込みの完了をログに出力
print("compactMachines3.zs loaded!");
