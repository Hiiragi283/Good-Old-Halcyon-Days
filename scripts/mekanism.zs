#====================================================================
# ファイル名 : mekanism.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for Mekanism and its addon
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import mods.mekanism.infuser;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading mekanism.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
	val removeCrafting as IItemStack[] = [
		<mekanism:controlcircuit:*>,
		<mekanism:basicblock:8>,
		<mekanism:speedupgrade>,
		<mekanism:energyupgrade>,
		<mekanism:filterupgrade>,
		<mekanism:mufflingupgrade>,
		<mekanism:gasupgrade>,
		<mekanism:anchorupgrade>,
	];
	for i in removeCrafting {
		HiiragiUtils.removeCrafting(i);
	}
	//上書き
	HiiragiUtils.addCraftingShaped(true, <mekanism:basicblock:15>, RecipePattern.init([" A ", "ABA", " A "]).map({A:<mekanism:basicblock2>, B:<minecraft:iron_bars>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <mekanism:basicblock2:0>, RecipePattern.init([" A ", "ABA", " A "]).map({A:<ore:ingotBronze>, B:<ore:ingotCopper>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <mekanism:machineblock2:4>, RecipePattern.init(["ABA", "CDC", "AEA"]).map({A:<ore:ingotIron>, B:<mekanism:electrolyticcore>, C:<mekanism:gastank>, D:<mekanism:basicblock:8>, E:<mekanism:machineblock2:11>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <mekanism:cardboardbox>, RecipePattern.init(["AA", "AA"]).map({A:<tconstruct:large_plate>.withTag({Material: "paper"})}).ingredients, null, null);

	HiiragiUtils.addCraftingShaped(true, <mekanism:tierinstaller:0>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:sheetHDPE>, B:<ore:ingotStainlessSteel>, C:<ore:circuitBasic>, D:<mekanism:basicblock:8>, E:<mekanism:machineblock2:11>}).ingredients, null, null);
	val installer as string[] = [
		"Advanced",
		"Elite",
		"Ultimate"
	];
	for i in 0 to 3 {
		HiiragiUtils.addCraftingShaped(true, <mekanism:tierinstaller>.definition.makeStack(i+1), RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:sheetHDPE>, B:oreDict["alloy" ~ installer[i]], C:oreDict["circuit" ~ installer[i]]}).ingredients, null, null);
	}

	HiiragiUtils.addCraftingReplace(<ore:ingotOsmium>, <mekanism:basicblock:8>, <mekanism:machineblock:8>);
	//新規
	HiiragiUtils.addCraftingShaped(false, <mekanism:basicblock:8>*2, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:ingotStainlessSteel>, B:<ore:ingotOsmium>, C:<thermalexpansion:frame:0>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <mekanism:basicblock:8>*2, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:ingotStainlessSteel>, B:<ore:ingotOsmium>, C:<enderio:item_material:1>}).ingredients, null, null);

//AWレシピの編集
	//import
	//新規

//Metallurgic Infuser
	mods.mekanism.infuser.removeRecipe(<ore:ingotBronze>);
	mods.mekanism.infuser.removeRecipe(<mekanism:controlcircuit:0>);

	mods.mekanism.infuser.addRecipe("TIN", 10, <ore:ingotOsmium>, <mekanism:controlcircuit:0>);
	mods.mekanism.infuser.addRecipe("REDSTONE", 10, <mekanism:controlcircuit:0>, <mekanism:controlcircuit:1>);
	mods.mekanism.infuser.addRecipe("DIAMOND", 10, <mekanism:controlcircuit:1>, <mekanism:controlcircuit:2>);
	mods.mekanism.infuser.addRecipe("OBSIDIAN", 10, <mekanism:controlcircuit:2>, <mekanism:controlcircuit:3>);

//このscriptの読み込みの完了をログに出力
print("mekanism.zs loaded!");
