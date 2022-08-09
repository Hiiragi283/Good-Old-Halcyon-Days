#====================================================================
# ファイル名 : botania.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Script for Botania and its addons
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.botania.Apothecary;
import mods.botania.ElvenTrade;
import mods.botania.ManaInfusion;
import mods.botania.Orechid;
import mods.botania.OrechidIgnem;
import mods.botania.PureDaisy;
import mods.botania.RuneAltar;
import mods.botaniatweaks.Agglomeration;
import mods.botaniatweaks.AgglomerationRecipe;
import mods.botaniatweaks.AgglomerationMultiblock;
import mods.chisel.Carving;
import mods.ctintegration.util.RecipePattern;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading botania.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
	val removeCrafting as IItemStack[] = [];
	for i in removeCrafting {
		HiiragiUtils.removeCrafting(i);
	}
	//上書き
	//Botania
	HiiragiUtils.addCraftingShaped(true, <botania:lexicon>, RecipePattern.init(["AA ", "AB ", "   "]).map({A:<minecraft:paper>, B:<twilightforest:naga_scale>}).ingredients, null, null);
	HiiragiUtils.addCraftingShapeless(true, <botania:lens:10>, [<botania:lens:0>, <ore:ingotFerrite>, <ore:dyeRed>, <ore:dyeBlue>], null, null);
	HiiragiUtils.addCraftingShapeless(true, <botania:terrasword>, [<tconstruct:sword_blade>.withTag({Material: "terrasteel"}), <botania:manaresource:3>], null, null);
	HiiragiUtils.addCraftingShapeless(true, <botania:terrasword>, [<tconstruct:sword_blade>.withTag({Material: "terrasteel"}), <botania:manasteelsword>.marked("inherit")], HiiragiUtils.inheritStatus(<botania:terrasword>), null);
	HiiragiUtils.addCraftingShapeless(true, <botania:craftinghalo>, [<ore:workbench>, <ore:ringManasteel>], null, null);
	//HiiragiUtils.addCraftingShaped(true, <botania:crystalbow>, RecipePattern.init([" AB", "C B", " AB"]).map({A:<botania:manaresource:13>, B:<botania:manaresource:16>, C:<botania:manaresource:3>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <botania:crystalbow>, RecipePattern.init([" AD", "BCD", " AD"]).map({A:<botania:manaresource:13>, B:<botania:manaresource:3>, C:<botania:livingwoodbow>.marked("inherit"), D:<ore:manaString>}).ingredients, HiiragiUtils.inheritStatus(<botania:crystalbow>), null);
	HiiragiUtils.addCraftingShapeless(true, <botania:swapring>, [<artisanworktables:toolbox>, <ore:ringManasteel>], null, null);
	HiiragiUtils.addCraftingShaped(true, <botania:rfgenerator>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<botania:livingrock>, B:<thermalfoundation:material:514>, C:<botanicadds:rune_energy>}).ingredients, null, null);
	/*val redStringed as IIngredient[IItemStack] = {
		<botania:redstringcontainer>: <ore:chest>,
		<botania:redstringdispenser>: <minecraft:dispenser>,
		<botania:redstringfertilizer>: <botania:fertilizer>,
		<botania:redstringcomparator>: <minecraft:comparator>,
		<botania:redstringrelay>: <botania:spreader:0>
	};
	for output, input in redStringed {
		HiiragiUtils.addCraftingShaped(true, output, RecipePattern.init(["ABC"]).map({A:<contenttweaker:casing_livingrock>, B:<botania:manaresource:12>, C:input}).ingredients, null, null);
	}*/

	//Botanic Adds
	HiiragiUtils.addCraftingShaped(true, <botanicadds:pool_dreaming>, RecipePattern.init(["A A", "AAA"]).map({A:<botanicadds:dreamrock>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <botanicadds:mana_stealer_sword>, RecipePattern.init(["A", "A", "B"]).map({A:<botanicadds:gaiasteel_ingot>, B:<botania:terrasword>.marked("inherit")}).ingredients, HiiragiUtils.inheritStatus(<botanicadds:mana_stealer_sword>), null);

	//新規

//AWレシピの編集
//import
//新規

	//Dreaming Daisy
	ElvenTrade.addRecipe([<botania:specialflower>.withTag({type: "dreaming_daisy"})], [<botania:specialflower>.withTag({type: "puredaisy"})]);
	//Orechid Terrestris
	HiiragiUtils.addCraftingShaped(false, <botania:specialflower>.withTag({type: "orechid_terrestris"}), [
		[<botania:biomestonea:7>, <botania:biomestonea:2>, <botania:biomestonea:6>],
		[<botania:biomestonea:0>, <botania:specialflower>.withTag({type: "orechid"}), <botania:biomestonea:5>],
		[<botania:biomestonea:4>, <twilightforest:liveroot>, <botania:biomestonea:3>]], null, null);

//エルフとの交易関連
	val toRemoveElven as IIngredient[] = [
		<botania:dreamwood>,
		<botania:manaresource:7>,
		<botania:storage:2>,
		<botania:manaresource:8>,
		<botania:manaresource:9>,
		<botania:storage:4>,
		<botanicadds:dreamrock>,
		<botanicadds:elven_lapis>,
		<botanicadds:elven_lapis_block>
	];
	for i in toRemoveElven {
		ElvenTrade.removeRecipe(i);
	}

	ElvenTrade.addRecipe([<contenttweaker:elven_pearl>], [<botania:manaresource:1>]);
	ElvenTrade.addRecipe([<contenttweaker:ephemerald>], [<botania:manaresource:2>]);

//マナプール周りのレシピ
	val removePool as IItemStack[] = [
		<botania:manaresource:16>,
	];
	for i in removePool {
		mods.botania.ManaInfusion.removeRecipe(i);
	}
	mods.botania.ManaInfusion.addAlchemy(<ore:gemAquamarine>.firstItem, <ore:gemEmerald>, 10000);
	mods.botania.ManaInfusion.addAlchemy(<ore:ingotSteeleaf>.firstItem, <twilightforest:hedge>, 10000);
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

//Orechid
	val removeOrechid as string[] = [
		"oreAmber",
		"oreSapphire",
		"oreApatite",
		"oreSulfur"
	];
	for i in removeOrechid {
		mods.botania.Orechid.removeOre(i);
	}

//orechid Ignem
	mods.botania.OrechidIgnem.removeOre(<ore:oreQuartz>);

//Pure Daisyによる加工
	val toRemovePure as IIngredient[] = [
		<botania:livingwood>
	];
	for i in toRemovePure {
		PureDaisy.removeRecipe(i);
	}

	PureDaisy.addRecipe(<extrautils2:compresseddirt:3>, <biomesoplenty:grass:5>);
	PureDaisy.addRecipe(<twilightforest:twilight_sapling:9>, <biomesoplenty:sapling_1>);

	for i in 0 to 4 {
		PureDaisy.addRecipe(<twilightforest:twilight_log>.definition.makeStack(i), <botania:livingwood>);
	}

//Runic Altarによる加工
	mods.botania.RuneAltar.addRecipe(<extrautils2:ingredients:17>,[
		<ore:runeLustB>,
		<ore:runeGluttonyB>,
		<ore:runeGreedB>,
		<ore:runeSlothB>,
		<ore:runeWrathB>,
		<ore:runeEnvyB>,
		<ore:runePrideB>,
		<ore:ingotEndSteel>,
		<ore:dropofevil>,
		<botanicadds:gaia_shard>,
	], 250000);

//Terrestrial Agglomeratioによる加工
	val agglo_terepad = AgglomerationMultiblock.create()
		.center(<enderio:block_tele_pad>)
		.edge(<enderio:block_tele_pad>)
		.corner(<enderio:block_tele_pad>);
	val agglo_ender_io_1 = AgglomerationMultiblock.create()
		.center(<enderio:block_decoration1:5>)
		.edge(<enderio:block_reinforced_obsidian>)
		.corner(<enderio:block_decoration1:1>);
	val agglo_gaia_steel = AgglomerationMultiblock.create()
		.center(<botania:enchanter>)
		.edge(<appliedenergistics2:sky_stone_stairs>)
		.corner(<botania:miniisland:15>);
	val agglo_earth_blessing = AgglomerationMultiblock.create()
		.center(<extrautils2:teleporter:0>)
		.edge(<minecraft:diamond_block>)
		.corner(<biomesoplenty:grass:5>);
	val agglo_earth_polluting = AgglomerationMultiblock.create()
		.center(<extrautils2:teleporter:0>)
		.centerReplace(<extrautils2:teleporter:1>)
		.edge(<minecraft:diamond_block>)
		.edgeReplace(<minecraft:coal_block>)
		.corner(<biomesoplenty:grass:5>)
		.cornerReplace(<extrautils2:cursedearth>);
	val agglo_high_tech = AgglomerationMultiblock.create()
		.center(<botania:platform:2>)
		.edge(<botania:quartztypedark:1>)
		.corner(<chisel:futura:4>);
	val agglo_rainbow = AgglomerationMultiblock.create()
		.center(<extrautils2:rainbowgenerator>)
		.edge(<extrautils2:decorativesolid:8>)
		.corner(<extrautils2:decorativesolid:8>);

	Agglomeration.addRecipe(AgglomerationRecipe.create()
		.output(<extrautils2:snowglobe:1>)
		.inputs([
			<extrautils2:snowglobe:0>,
			<biomesoplenty:terrarium:6>,
			<biomesoplenty:terrarium:2>,
			<biomesoplenty:terrarium:3>,
			<biomesoplenty:terrarium:0>,
			<biomesoplenty:terrarium:7>,
			<biomesoplenty:terrarium:14>,
			<biomesoplenty:terrarium:15>,
		])
		.multiblock(agglo_earth_blessing));
	Agglomeration.addRecipe(AgglomerationRecipe.create()
		.output(<contenttweaker:ingot_rainbow>)
		.inputs([
			<botanicadds:gaiasteel_ingot>,
			<enderio:item_alloy_ingot:1>,
			<mekanism:ingot:3>,
			<enderio:item_alloy_ingot:2>,
			<thermalfoundation:material:134>,
			<dcs_climate:dcs_ingot:13>,
			<tconstruct:ingots:2>,
		])
		.color1(0x000000 as int)
		.color2(0xFFFFFF as int)
		.manaCost(1000000)
		.multiblock(agglo_gaia_steel));
	Agglomeration.addRecipe(AgglomerationRecipe.create()
		.output(<biomesoplenty:earth>)
		.inputs([
			<botania:gaiahead>,
			<ore:runeEarthB>,
			<extrautils2:snowglobe:1>,
		])
		.manaCost(10000000)
		.multiblock(agglo_earth_polluting));
	Agglomeration.addRecipe(AgglomerationRecipe.create()
		.output(<botanicadds:gaiasteel_ingot>)
		.inputs([
			<ore:gaiaIngot>,
			<ore:bottleWine>,
			<dcs_climate:dcs_food_cake:11>,
		])
		.manaCost(750000)
		.multiblock(agglo_high_tech));
	Agglomeration.addRecipe(AgglomerationRecipe.create()
		.output(<twilightforest:twilight_sapling:9>)
		.inputs([
			<twilightforest:twilight_sapling:0>,
			<twilightforest:twilight_sapling:1>,
			<twilightforest:twilight_sapling:2>,
			<twilightforest:twilight_sapling:3>,
			<twilightforest:twilight_sapling:4>,
			<twilightforest:twilight_sapling:5>,
			<twilightforest:twilight_sapling:6>,
			<twilightforest:twilight_sapling:7>,
			<twilightforest:twilight_sapling:8>,
		])
		.manaCost(1000000)
		.multiblock(agglo_rainbow));

//Dreaming Daisyによる加工
	val dreaming_daisy = mods.morechids.Registry.getFlower("dreaming_daisy");
	dreaming_daisy.addRecipe(<botania:livingrock>, <botanicadds:dreamrock>, 1);
	dreaming_daisy.addRecipe(<botania:livingwood>, <botania:dreamwood>, 1);

//このscriptの読み込みの完了をログに出力
print("botania.zs loaded!");
