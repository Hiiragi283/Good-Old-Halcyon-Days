#====================================================================
# ファイル名 : advRocketry.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for Advanced Rocktery and LibVulpes
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading advRocketry.zs ...");

//作業台レシピの編集
	//上書き
	//Advanced Rocktery
	HiiragiUtils.addCraftingShaped(true, <advancedrocketry:structuretower>*8, RecipePattern.init(["AAA", "A A", "AAA"]).map({A:<ore:stickSteel>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <advancedrocketry:satellitepowersource>, RecipePattern.init([" A", "BA", " A"]).map({A:<enderio:item_material:3>, B:<ore:stickIron>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <advancedrocketry:seat>, [[<dcs_climate:dcs_big_cushion:0>], [<ore:plateIron>]], null, null);
	HiiragiUtils.addCraftingShaped(true, <advancedrocketry:advrocketmotor>, RecipePattern.init(["AAA", "BCB", "B B"]).map({A:<ore:ingotDarkSteel>, B:<ore:ingotStainlessSteel>, C:<advancedrocketry:rocketmotor>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <advancedrocketry:advbipropellantrocketmotor>, RecipePattern.init(["AAA", "BCB", "B B"]).map({A:<ore:ingotDarkSteel>, B:<ore:ingotStainlessSteel>, C:<advancedrocketry:bipropellantrocketmotor>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <advancedrocketry:nuclearrocketmotor>, RecipePattern.init(["AAA", " B ", "B B"]).map({A:<ore:ingotBedrockium>, B:<ore:ingotEndSteel>}).ingredients, null, null);
		//Space Suits
		HiiragiUtils.addCraftingShaped(true, <advancedrocketry:spacehelmet>, RecipePattern.init(["AAA", "ABA", " C "]).map({A:<ore:blockRockwool>, B:<dcs_climate:dcs_synthetic:2>, C:<ore:itemSyntheticCloth>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <advancedrocketry:spacechestplate>, RecipePattern.init(["ACA", "ABA", "AAA"]).map({A:<ore:blockRockwool>, B:<advancedrocketry:pressuretank:3>, C:<ore:itemSyntheticCloth>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <advancedrocketry:spaceleggings>, RecipePattern.init(["ABA", "A A", "A A"]).map({A:<ore:blockRockwool>, B:<ore:itemSyntheticCloth>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <advancedrocketry:spaceboots>, RecipePattern.init(["A A", "ABA"]).map({A:<ore:blockRockwool>, B:<ore:itemSyntheticCloth>}).ingredients, null, null);

	HiiragiUtils.addCraftingConv(<advancedrocketry:concrete>, <dcs_climate:dcs_build_build>);
	HiiragiUtils.recipeReplace(<advancedrocketry:solarpanel>, <enderio:item_material:3>, null);
	HiiragiUtils.recipeReplace(<ore:gearTitaniumAluminide>, <ore:gearDiamond>, null);
	HiiragiUtils.recipeReplace(<ore:plateTitaniumAluminide>, <tconstruct:large_plate>.withTag({Material: "dark_steel"}), <advancedrocketry:blackholegenerator>);
	HiiragiUtils.recipeReplace(<ore:sheetIron>, <ore:plateIron>, null);
	HiiragiUtils.recipeReplace(<ore:sheetSteel>, <enderio:block_tank:0>, null);
	HiiragiUtils.recipeReplace(<ore:sheetTitanium>, <enderio:block_tank:1>, null);
	HiiragiUtils.recipeReplace(<ore:sheetAluminum>, <enderio:item_material:3>, <advancedrocketry:satellite>);

	//LibVulpes
	HiiragiUtils.recipeReplace(<libvulpes:advstructuremachine>, <contenttweaker:advstructuremachine>, null);
	//新規
	//Advanced Rocktery
	HiiragiUtils.addCraftingShapeless(false, <advancedrocketry:elevatorchip>, [<advancedrocketry:spacestationchip>, <advancedrocketry:ic:1>], null, null);

//このscriptの読み込みの完了をログに出力
print("advRocketry.zs loaded!");
