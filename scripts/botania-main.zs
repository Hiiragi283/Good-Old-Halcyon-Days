#======================================================================
# name : botania-main.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Scripts for Botania
#======================================================================

#priority 0
//norun

//crafttweakerからclassをimport
import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.botania.Apothecary;
import mods.botania.ElvenTrade;
import mods.botania.ManaInfusion;
import mods.botania.PureDaisy;
import mods.chisel.Carving;
import mods.ctintegration.util.RecipePattern;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading botania-main.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
		val removeCrafting as IItemStack[] = [
			<botania:manaresource:6>,
			<botania:fertilizer>,
			<botania:runealtar:*>,
			<botania:terraaxe>,
		];
		for i in removeCrafting {
			HiiragiUtils.removeCrafting(i);
		}
		recipes.removeByRecipeName("botania:terrapick");

		HiiragiUtils.removeFromJEI(<botania:pool:2>);
	//上書き
		//Botania
			HiiragiUtils.addCrafting(false, true, <botania:lexicon>, RecipePattern.init(["AA ", "AB ", "   "]).map({A:<minecraft:paper>, B:<twilightforest:naga_scale>}).ingredients);
			HiiragiUtils.addCrafting(true, true, <botania:lens:10>, [[<botania:lens:0>, <ore:ingotFerrite>, <ore:dyeRed>, <ore:dyeBlue>]]);
			val toolManasteel as IItemStack[IItemStack] = {
				<botania:manasteelpick>: <tconstruct:pick_head>,
				<botania:manasteelshovel>: <tconstruct:shovel_head>,
				<botania:manasteelaxe>: <tconstruct:axe_head>,
				<botania:manasteelsword>: <tconstruct:sword_blade>,
			};
			for tool, toolHead in toolManasteel {
				HiiragiUtils.addCrafting(true, true, tool, [[toolHead.withTag({Material: "manasteel"}), <botania:manaresource:3>]]);
			}
			HiiragiUtils.addCrafting(true, true, <botania:terrasword>, [[<tconstruct:sword_blade>.withTag({Material: "terrasteel"}), <botania:manaresource:3>]]);
			HiiragiUtils.addCraftingAdv(false, true, <botania:terrasword>, [[<tconstruct:sword_blade>.withTag({Material: "terrasteel"}), <botania:manasteelsword>.marked("inherit")]], HiiragiUtils.inheritStatus(<botania:terrasword>), null);
			val toolElementium as IItemStack[IItemStack] = {
				<botania:elementiumpick>: <tconstruct:pick_head>,
				<botania:elementiumshovel>: <tconstruct:shovel_head>,
				<botania:elementiumaxe>: <tconstruct:axe_head>,
				<botania:elementiumsword>: <tconstruct:sword_blade>,
			};
			for tool, toolHead in toolElementium {
				HiiragiUtils.addCrafting(true, true, tool, [[toolHead.withTag({Material: "elementium"}), <botania:manaresource:13>]]);
			}
			HiiragiUtils.addCrafting(true, true, <botania:craftinghalo>, [[<ore:workbench>, <ore:ringManasteel>]]);
			HiiragiUtils.addCrafting(false, true, <botania:crystalbow>, RecipePattern.init([" AB", "C B", " AB"]).map({A:<botania:manaresource:13>, B:<botania:manaresource:16>, C:<botania:manaresource:3>}).ingredients);
			HiiragiUtils.addCraftingAdv(false, false, <botania:crystalbow>, RecipePattern.init([" A", "BC", " A"]).map({A:<botania:manaresource:13>, B:<botania:manaresource:3>, C:<botania:livingwoodbow>.marked("inherit")}).ingredients, HiiragiUtils.inheritStatus(<botania:crystalbow>), null);
			HiiragiUtils.addCrafting(true, true, <botania:swapring>, [[<artisanworktables:toolbox>, <ore:ringManasteel>]]);
			val redStringed as IIngredient[IItemStack] = {
				<botania:redstringcontainer>: <ore:chest>,
				<botania:redstringdispenser>: <minecraft:dispenser>,
				<botania:redstringfertilizer>: <botania:fertilizer>,
				<botania:redstringcomparator>: <minecraft:comparator>,
				<botania:redstringrelay>: <botania:spreader:0>
			};
			for output, input in redStringed {
				//HiiragiUtils.addCrafting(false, true, output, RecipePattern.init(["ABC"]).map({A:<contenttweaker:casing_livingrock>, B:<botania:manaresource:12>, C:input}).ingredients);
			}

		//Botanic Adds
			HiiragiUtils.addCrafting(false, true, <botanicadds:pool_dreaming>, RecipePattern.init(["A A", "AAA"]).map({A:<botanicadds:dreamrock>}).ingredients);
			HiiragiUtils.addCraftingAdv(false, true, <botanicadds:mana_stealer_sword>, RecipePattern.init(["A", "A", "B"]).map({A:<botanicadds:gaiasteel_ingot>, B:<botania:terrasword>.marked("inherit")}).ingredients, HiiragiUtils.inheritStatus(<botanicadds:mana_stealer_sword>), null);

	//新規

//かまどレシピの編集
	//削除
			val removeFurnace as IItemStack[] = [];
			for i in removeFurnace {
				HiiragiUtils.removeFurnace(i);
			}
		//新規
		val addFurnace as IIngredient[IItemStack] = {};
		for output, input in addFurnace {
			HiiragiUtils.addFurnace(false, output, input);
		}

//AWレシピの編集
//import
//新規
	//Terra Shatterer
	RecipeBuilder.get("basic")
		.setShaped(RecipePattern
			.init([" ABC ", "  CDC", "  BCB", " E  A", "F    "])
			.map({A:<botania:manaresource:4>, B:<tconstruct:large_plate>.withTag({Material: "terrasteel"}), C:<ore:plateLivingwood>, D:<botania:manatablet>, E:<botania:livingwood:0>, F:<tconstruct:tool_rod>.withTag({Material: "terrasteel"})})
			.ingredients)
		.addOutput(<botania:terrapick>)
		.create();
	//Terra Truncator
	RecipeBuilder.get("basic")
		.setShaped(RecipePattern
			.init(["  AA ", " ABBC", " ABDA", "  CA ", " E   "])
			.map({A:<botania:manaresource:4>, B:<tconstruct:large_plate>.withTag({Material: "terrasteel"}), C:<botania:livingwood:0>, D:<minecraft:glowstone>, E:<botania:manaresource:4>})
			.ingredients)
		.addOutput(<botania:terraaxe>)
		.create();
	//Dreaming Daisy
		ElvenTrade.addRecipe([<botania:specialflower>.withTag({type: "dreaming_daisy"})], [<botania:specialflower>.withTag({type: "puredaisy"})]);
	//Orechid Terrestris
		HiiragiUtils.addCrafting(false, false, <botania:specialflower>.withTag({type: "orechid_terrestris"}), [
			[<botania:biomestonea:7>, <botania:biomestonea:2>, <botania:biomestonea:6>],
			[<botania:biomestonea:0>, <botania:specialflower>.withTag({type: "orechid"}), <botania:biomestonea:5>],
			[<botania:biomestonea:4>, <twilightforest:liveroot>, <botania:biomestonea:3>]]);

//GTレシピの編集
//削除
//上書き
//新規

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
	//Manasteel ingot
		mods.botania.ManaInfusion.addInfusion(<botania:manaresource:0>*2, <ore:ingotSteel>, 3000);
		mods.botania.ManaInfusion.addInfusion(<botania:manaresource:0>*2, <twilightforest:steeleaf_ingot>, 3000);
		mods.botania.ManaInfusion.addInfusion(<botania:manaresource:0>*4, <ore:ingotStainlessSteel>, 3000);
		mods.botania.ManaInfusion.addInfusion(<botania:manaresource:0>*8, <ore:ingotTungstensteel>, 3000);
		mods.botania.ManaInfusion.addInfusion(<botania:manaresource:0>*8, <enderio:item_alloy_ingot:6>, 3000);
	//Block of Manasteel
		mods.botania.ManaInfusion.addInfusion(<botania:storage:0>*2, <ore:blockSteel>, 27000);
		mods.botania.ManaInfusion.addInfusion(<botania:storage:0>*2, <twilightforest:block_storage:2>, 27000);
		mods.botania.ManaInfusion.addInfusion(<botania:storage:0>*4, <ore:blockStainlessSteel>, 27000);
		mods.botania.ManaInfusion.addInfusion(<botania:storage:0>*8, <ore:blockTungstensteel>, 27000);
		mods.botania.ManaInfusion.addInfusion(<botania:storage:0>*8, <enderio:block_alloy:6>, 27000);

//Pure Daisyによる加工
	val toRemovePure as IIngredient[] = [
		<botania:livingwood>
	];
	for i in toRemovePure {
		PureDaisy.removeRecipe(i);
	}

	for i in 0 to 4 {
		PureDaisy.addRecipe(<twilightforest:twilight_log>.definition.makeStack(i), <botania:livingwood>);
	}

//Dreaming Daisyによる加工
	val dreaming_daisy = mods.morechids.Registry.getFlower("dreaming_daisy");
	dreaming_daisy.addRecipe(<botania:livingrock>, <botanicadds:dreamrock>, 1);

//アズレージョをChiselで加工するように変更
	mods.chisel.Carving.addGroup("azulejo");
	for i in 0 to 15 {
		HiiragiUtils.removeCrafting(<botania:custombrick>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("azulejo", <botania:custombrick>.definition.makeStack(i));
	}

//装飾品をchiselで加工するように変更
	mods.chisel.Carving.addGroup("botania_cosmetic");
	for i in 0 to 32 {
		HiiragiUtils.removeCrafting(<botania:cosmetic>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("botania_cosmetic", <botania:cosmetic>.definition.makeStack(i));
	}

//Thaumcraftの注入の儀式
/*
	mods.thaumcraft.Infusion.registerRecipe("runic_altar", "", <botania:runealtar>,
		10,[<aspect:ordo>*128, <aspect:praecantatio>*64, <aspect:alkimia>*64],
		<botania:manaresource:2>, [
			<twilightforest:castle_rune_brick:3>, <ore:plateLivingrock>, <ore:plateLivingrock>,
			<twilightforest:castle_rune_brick:1>, <ore:plateLivingrock>, <ore:plateLivingrock>,
			<twilightforest:castle_rune_brick:2>, <ore:plateLivingrock>, <ore:plateLivingrock>,
			<twilightforest:castle_rune_brick:0>, <ore:plateLivingrock>, <ore:plateLivingrock>
		]);
	mods.thaumcraft.Infusion.registerRecipe("elven_runic_altar", "", <botanicadds:elven_altar>,
		10,[<aspect:ordo>*128, <aspect:praecantatio>*64, <aspect:alkimia>*64],
		<botania:manaresource:9>, [
			<twilightforest:castle_rune_brick:3>, <ore:plateDreamrock>, <ore:plateDreamrock>,
			<twilightforest:castle_rune_brick:1>, <ore:plateDreamrock>, <ore:plateDreamrock>,
			<twilightforest:castle_rune_brick:2>, <ore:plateDreamrock>, <ore:plateDreamrock>,
			<twilightforest:castle_rune_brick:0>, <ore:plateDreamrock>, <ore:plateDreamrock>
		]);
*/
//このscriptの読み込みの完了をログに出力
print("botania-main.zs loaded!");
