#====================================================================
# ファイル名 : artisanworktables.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for Artisan Worktables
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading artisanworktables.zs ...");

//作業台レシピの編集
	//上書き
	//新規
		HiiragiUtils.addCraftingShaped(false, <artisanworktables:workstation:5>, RecipePattern.init(["ABA", " C ", "DDD"]).map({A:<tconstruct:seared_tank:*>, B: <ore:chest>, C:<ore:workbench>, D:<tconstruct:seared:3>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(false, <artisanworktables:toolbox>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<tconstruct:pattern:0>, B:<tconstruct:tough_tool_rod>.withTag({Material: "wood"}), C:<minecraft:chest>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(false, <artisanworktables:mechanical_toolbox>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:plateBronze>, B:<ore:gearSteel>, C:<artisanworktables:toolbox>}).ingredients, null, null);
//AWレシピの編集
	//新規
	RecipeBuilder.get("basic")
		.setShapeless([<tconstruct:channel>])
		.addTool(<ore:artisansHandsaw>, 1)
		.addOutput(<tconstruct:faucet>*2)
		.create();
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
print("artisanworktables.zs loaded!");
