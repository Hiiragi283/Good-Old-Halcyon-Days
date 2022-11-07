#====================================================================
# ファイル名 : botania.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for Botania and its addons
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

//各種modからclassをimport
import mods.botania.Apothecary;
import mods.botania.ElvenTrade;
import mods.botania.ManaInfusion;
import mods.botania.Orechid;
import mods.botania.OrechidIgnem;
import mods.botania.PureDaisy;
import mods.botania.RuneAltar;
import mods.botaniatweaks.Agglomeration;
import mods.botaniatweaks.AgglomerationMultiblock;
import mods.botaniatweaks.AgglomerationRecipe;
import mods.ctintegration.util.RecipePattern;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading botania.zs ...");

//作業台レシピの編集
	//上書き
	//Botania
	HiiragiUtils.addCraftingShaped(true, <botania:crystalbow>, RecipePattern.init([" AD", "BCD", " AD"]).map({A:<botania:manaresource:13>, B:<botania:manaresource:3>, C:<botania:livingwoodbow>.marked("move"), D:<ore:manaString>}).ingredients, HiiragiUtils.moveNBT(<botania:crystalbow>), null);
	HiiragiUtils.addCraftingShaped(true, <botania:lexicon>, RecipePattern.init(["AA ", "AB ", "   "]).map({A:<minecraft:paper>, B:<twilightforest:naga_scale>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <botania:rfgenerator>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<botania:livingrock>, B:<thermalfoundation:material:514>, C:<botanicadds:rune_energy>}).ingredients, null, null);
	HiiragiUtils.addCraftingShapeless(true, <botania:fertilizer>*8, [<minecraft:dye:15>, <twilightforest:liveroot>, <ore:dustPlant>, <ore:dustPlant>], null, null);
	HiiragiUtils.addCraftingShapeless(true, <botania:lens:10>, [<botania:lens:0>, <ore:ingotMagnet>], null, null);
	HiiragiUtils.addCraftingShapeless(true, <botania:lens:12>, [<botania:lens:0>, <dcs_climate:dcs_device_conveyor>], null, null);
	HiiragiUtils.addCraftingShapeless(true, <botania:lens:13>, [<botania:lens:0>, <enderio:block_dark_paper_anvil>], null, null);
	HiiragiUtils.addCraftingShapeless(true, <botania:lens:14>, [<botania:lens:0>, <openblocks:paintbrush>], null, null);
	HiiragiUtils.addCraftingShapeless(true, <botania:lens:17>, [<botania:lens:0>, <dcs_climate:dcs_magic_card:4>], null, null);
	HiiragiUtils.addCraftingShapeless(true, <botania:lens:7>, [<botania:lens:0>, <thermalfoundation:material:656>], null, null);
	HiiragiUtils.recipeReplace(<botania:storage:0>, <biomesoplenty:terrestrial_artifact>, <botania:terraplate>);
	HiiragiUtils.recipeReplace(<ore:blockLapis>, <tconstruct:large_plate>.withTag({Material: "manasteel"}), <botania:terraplate>);
	//Botanic Adds
	HiiragiUtils.addCraftingShaped(true, <botanicadds:mana_stealer_sword>, RecipePattern.init(["A", "A", "B"]).map({A:<botanicadds:gaiasteel_ingot>, B:<botania:terrasword>.marked("move")}).ingredients, HiiragiUtils.moveNBT(<botanicadds:mana_stealer_sword>), null);
	HiiragiUtils.addCraftingShaped(true, <botanicadds:pool_dreaming>, RecipePattern.init(["A A", "AAA"]).map({A:<botanicadds:dreamrock>}).ingredients, null, null);

	//新規
	//Botania
	HiiragiUtils.addCraftingShaped(false, <botania:blacklotus:0>, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<dcs_climate:dcs_food_petals:1>, B:<botania:manaresource:23>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <botania:blacklotus:1>, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<dcs_climate:dcs_food_petals:1>, B:<thermalfoundation:material:1028>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <botania:platform:2>, RecipePattern.init(["AAA", "BCB"]).map({A:<dcs_climate:dcs_build_bricks:3>, B:<dcs_climate:dcs_ore_gemblock:12>, C:<ore:eternalLifeEssence>}).ingredients, null, null);

//Dreaming Daisyによる加工
	val dreaming_daisy = mods.morechids.Registry.getFlower("dreaming_daisy");
	dreaming_daisy.addRecipe(<botania:livingrock>, <botanicadds:dreamrock>, 1);
	dreaming_daisy.addRecipe(<botania:livingwood>, <botania:dreamwood>, 1);

//Elven Trade
	val toRemoveElven as IIngredient[] = [
		<botania:dreamwood>,
		<botania:manaresource:7>,
		<botania:manaresource:8>,
		<botania:manaresource:9>,
		<botania:storage:2>,
		<botania:storage:4>,
		<botanicadds:dreamrock>,
	];
	for i in toRemoveElven {
		ElvenTrade.removeRecipe(i);
	}

	ElvenTrade.addRecipe([<botania:specialflower>.withTag({type: "dreaming_daisy"})], [<botania:specialflower>.withTag({type: "puredaisy"})]);
	ElvenTrade.addRecipe([<contenttweaker:elven_pearl>], [<botania:manaresource:1>]);
	ElvenTrade.addRecipe([<contenttweaker:ephemerald>], [<botania:manaresource:2>]);

//Mana Infusion
	val removePool as IItemStack[] = [
		<botania:manaresource:16>,
	];
	for i in removePool {
		mods.botania.ManaInfusion.removeRecipe(i);
	}
	mods.botania.ManaInfusion.addAlchemy(<ore:gemAquamarine>.firstItem, <ore:gemEmerald>, 10000);
	mods.botania.ManaInfusion.addAlchemy(<ore:ingotSteeleaf>.firstItem, <twilightforest:hedge>, 10000);
	mods.botania.ManaInfusion.addAlchemy(<twilightforest:raven_feather>, <contenttweaker:feather_black>, 10000);
	//Manasteel ingot
	mods.botania.ManaInfusion.addInfusion(<botania:manaresource:0>*2, <ore:ingotSteel>, 3000);
	mods.botania.ManaInfusion.addInfusion(<botania:manaresource:0>*2, <twilightforest:steeleaf_ingot>, 3000);
	mods.botania.ManaInfusion.addInfusion(<botania:manaresource:0>*4, <ore:ingotStainlessSteel>, 3000);
	mods.botania.ManaInfusion.addInfusion(<botania:manaresource:0>*8, <enderio:item_alloy_ingot:6>, 3000);
	//Block of Manasteel
	mods.botania.ManaInfusion.addInfusion(<botania:storage:0>*2, <ore:blockSteel>, 27000);
	mods.botania.ManaInfusion.addInfusion(<botania:storage:0>*2, <twilightforest:block_storage:2>, 27000);
	mods.botania.ManaInfusion.addInfusion(<botania:storage:0>*4, <ore:blockStainlessSteel>, 27000);
	mods.botania.ManaInfusion.addInfusion(<botania:storage:0>*8, <enderio:block_alloy:6>, 27000);
	//Mana String
	mods.botania.ManaInfusion.addInfusion(<botania:manaresource:16>, <minecraft:string>, 5000);
	mods.botania.ManaInfusion.addInfusion(<botania:manaresource:16>, <dcs_climate:dcs_misc:0>, 5000);
	mods.botania.ManaInfusion.addInfusion(<botania:manaresource:16>, <dcs_climate:dcs_misc:1>, 5000);
	mods.botania.ManaInfusion.addInfusion(<botania:manaresource:16>, <dcs_climate:dcs_misc:10>, 5000);
	mods.botania.ManaInfusion.addInfusion(<botania:manaresource:16>*2, <dcs_climate:dcs_misc:4>, 5000);
	mods.botania.ManaInfusion.addInfusion(<botania:manaresource:16>*2, <dcs_climate:dcs_misc:6>, 5000);
	mods.botania.ManaInfusion.addInfusion(<botania:manaresource:16>*3, <dcs_climate:dcs_synthetic:0>, 5000);
	mods.botania.ManaInfusion.addInfusion(<botania:manaresource:16>*4, <dcs_climate:dcs_misc:8>, 5000);

//Orechid Ignem
	mods.botania.OrechidIgnem.removeOre(<ore:oreQuartz>);

//Orechid Terrestris
	val orechid_terrestris = mods.morechids.Registry.getFlower("orechid_terrestris");
	for i in 1 to 8 {
		orechid_terrestris.addRecipe(<minecraft:stone>, <biomesoplenty:gem_ore>.definition.makeStack(i), 1.00);
	}

//Petal Apothecary
	mods.botania.Apothecary.removeRecipe("orechid");

	mods.botania.Apothecary.addRecipe("orechid_terrestris", [<ore:petalGreen>, <ore:petalYellow>, <ore:petalOrange>, <ore:petalLime>, <ore:petalPurple>, <ore:petalRed>, <ore:petalBlue>, <twilightforest:ore_magnet>]);

//Pure Daisyによる加工
	val toRemovePure as IIngredient[] = [
		<botania:livingwood>,
		<botania:livingrock>
	];
	for i in toRemovePure {
		PureDaisy.removeRecipe(i);
	}

	PureDaisy.addRecipe(<dcs_climate:dcs_ore_gemblock:6>, <botania:livingrock>);
	//PureDaisy.addRecipe(<extrautils2:compresseddirt:3>, <biomesoplenty:grass:5>);
	PureDaisy.addRecipe(<twilightforest:root:0>, <twilightforest:root:1>);
	PureDaisy.addRecipe(<twilightforest:twilight_sapling:9>, <biomesoplenty:sapling_1>);
	for i in 0 to 4 {
		PureDaisy.addRecipe(<twilightforest:twilight_log>.definition.makeStack(i), <botania:livingwood>);
		PureDaisy.addRecipe(<twilightforest:magic_log>.definition.makeStack(i), <botania:livingwood>);
	}

//Runic Altarによる加工
	/*mods.botania.RuneAltar.addRecipe(<extrautils2:simpledecorative:2>,[
		<ore:runeLustB>,
		<ore:runeGluttonyB>,
		<ore:runeGreedB>,
		<ore:runeSlothB>,
		<ore:runeWrathB>,
		<ore:runeEnvyB>,
		<ore:runePrideB>,
		<ore:blockEndSteel>,
		<minecraft:skull:1>,
		<ore:eternalLifeEssence>,
	], 250000);*/
	mods.botania.RuneAltar.addRecipe(<extendedcrafting:material:32>,[
		//Red
		<ore:ingotRedstoneAlloy>,
		<ore:ingotArdite>,
		<ore:ingotEnergeticAlloy>,
		//Yellow
		<ore:ingotLumium>,
		<ore:ingotGold>,
		<ore:ingotBrass>,
		//Green
		<ore:ingotVibrantAlloy>,
		<ore:ingotTerrasteel>,
		<ore:ingotEnderium>,
		//Blue
		<ore:ingotManasteel>,
		<ore:ingotCobalt>,
		<ore:ingotBismuth>,
		//Purple
		<ore:ingotManyullyn>,
		<ore:ingotBSCCO>,
		<ore:ingotFluixSteel>,
		//Clear
		<ore:ingotUnstable>,
	], 1000000);
	mods.botania.RuneAltar.addRecipe(<ore:ingotElvenElementium>.firstItem,[
		<ore:gemSchorl>,
		<ore:gemSchorl>,
		<ore:ingotManasteel>,
		<ore:dustMana>,
	], 10000);
	mods.botania.RuneAltar.addRecipe(<ore:elvenPixieDust>.firstItem,[
		<twilightforest:raven_feather>,
		<twilightforest:raven_feather>,
		<ore:manaPearl>,
		<ore:dustMana>,
	], 10000);
	mods.botania.RuneAltar.addRecipe(<ore:gemDragonStone>.firstItem,[
		<botania:manaresource:15>,
		<botania:manaresource:15>,
		<ore:gemManaDiamond>,
		<ore:dustMana>,
	], 10000);
	mods.botania.RuneAltar.addRecipe(<contenttweaker:rune_fire>,[
		<minecraft:magma>,
		<minecraft:lava_bucket>,
		<minecraft:fire_charge>,
		<railcraft:firestone_refined>,
		<tconstruct:firewood:0>,
		<tconstruct:firewood:1>,
		<twilightforest:firefly_jar>,
		<tconstruct:materials:11>,
		<dcs_climate:dcs_magic_card_m:4>,
	], 200000);
	mods.botania.RuneAltar.addRecipe(<contenttweaker:rune_earth>,[
		<minecraft:cobblestone>,
		<minecraft:log:0>,
		<minecraft:sand>,
		<minecraft:gravel>,
		<minecraft:clay>,
		<minecraft:bedrock>,
		<minecraft:grass>,
		<minecraft:ice>,
		<minecraft:obsidian>,
	], 200000);
	var runeWater as IIngredient[] = [];
	for i in 1 to 14 {
		runeWater += <dcs_climate:dcs_food_pack>.definition.makeStack(i);
	}
	mods.botania.RuneAltar.addRecipe(<contenttweaker:rune_water>,runeWater, 200000);
	mods.botania.RuneAltar.addRecipe(<contenttweaker:rune_air>, HiiragiUtils.listDisc, 200000);

//Terrestrial Agglomeratioによる加工
	/*val agglo_earth_polluting = AgglomerationMultiblock.create()
		.center(<twilightforest:miniature_structure:0>)
		.centerReplace(<minecraft:tnt:1>)
		.corner(<biomesoplenty:grass:5>)
		.cornerReplace(<extrautils2:cursedearth>)
		.edge(<minecraft:diamond_block>)
		.edgeReplace(<minecraft:coal_block>);*/
	val agglo_elven = AgglomerationMultiblock.create()
		.center(<botanicadds:dreamrock>)
		.corner(<botanicadds:dreamrock>)
		.edge(<botania:dreamwood:5>);
	val agglo_blood = AgglomerationMultiblock.create()
		.center(<railcraft:red_nether:4>)
		.corner(<minecraft:red_nether_brick>)
		.edge(<railcraft:bloodstained:2>);

	Agglomeration.addRecipe(AgglomerationRecipe.create()
		.output(<botanicadds:gaiasteel_ingot>)
		.inputs([
			<ore:gaiaIngot>,
			<ore:bottleWine>,
			<dcs_climate:dcs_food_cake:11>,
		])
		.manaCost(750000)
		.multiblock(agglo_blood));
	Agglomeration.addRecipe(AgglomerationRecipe.create()
		.output(<botania:manaresource:4>*2)
		.inputs([
			<contenttweaker:ephemerald>,
			<botania:manaresource:4>,
			<contenttweaker:elven_pearl>,
		])
		.manaCost(250000)
		.multiblock(agglo_elven));

//このscriptの読み込みの完了をログに出力
print("botania.zs loaded!");
