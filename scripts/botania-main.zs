#======================================================================
# name : botania-main.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Scripts for Botania
#======================================================================

//norun
#priority 0

//crafttweakerからclassをimport
import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.botania.ElvenTrade as ElvenTrade;
import mods.botania.ManaInfusion as Manapool;
import mods.botania.PureDaisy as PureDaisy;
import mods.chisel.Carving as chisel;
import mods.ctintegration.util.RecipePattern;

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
            <botania:altar:*>,
            <botania:runealtar:*>,
        ];
        for i in removeCrafting {
            HiiragiUtils.removeCrafting(i);
        }
        recipes.removeByRecipeName("botania:terrapick");

        HiiragiUtils.removeFromJEI(<botania:pool:2>);
    //上書き
        //Botania
            HiiragiUtils.addCrafting(false, true, <botania:lexicon>, RecipePattern.init(["AA ", "AB ", "   "]).map({A:<minecraft:paper>, B:<twilightforest:naga_scale>}).ingredients);
            //HiiragiUtils.addCrafting(true, true, <botania:lens:0>, [[<ore:ringManasteel>, <ore:paneGlass>, HiiragiUtils.toolInput(<extrautils2:glasscutter>, 1)]]);
            HiiragiUtils.addCrafting(true, true, <botania:lens:10>, [[<botania:lens:0>, <ore:ingotIronMagnetic>, <ore:dyeRed>, <ore:dyeBlue>]]);
            //HiiragiUtils.addCraftingAdv(false, true, <botania:manamirror>, RecipePattern.init(["A", "B", "C"]).map({A:<botania:manatablet>.marked("inherit"), B:<thaumcraft:mirrored_glass>, C:<botania:manaresource:3>}).ingredients, HiiragiUtils.inheritStatus(<botania:manamirror>), null);
            val toolManasteel as IItemStack[IItemStack] = {
                <botania:manasteelpick>: <tconstruct:pick_head>,
                <botania:manasteelshovel>: <tconstruct:shovel_head>,
                <botania:manasteelaxe>: <tconstruct:axe_head>,
                <botania:manasteelsword>: <tconstruct:sword_blade>,
            };
            for tool, toolHead in toolManasteel {
                HiiragiUtils.addCrafting(true, true, tool, [[toolHead.withTag({Material: "manasteel"}), <botania:manaresource:3>]]);
            }
            HiiragiUtils.addCrafting(false, true, <botania:manasteelshears>, RecipePattern.init(["AB", "CA"]).map({A:<tconstruct:kama_head>.withTag({Material: "manasteel"}), B:<ore:GT.tool.file>, C:<ore:boltLivingwood>}).ingredients);
            HiiragiUtils.addCrafting(true, true, <botania:terrasword>, [[<tconstruct:sword_blade>.withTag({Material: "terrasteel"}), <botania:manaresource:3>]]);
            HiiragiUtils.addCraftingAdv(false, true, <botania:terrasword>, [[<tconstruct:sword_blade>.withTag({Material: "terrasteel"}), <botania:manasteelsword>.marked("inherit")]], HiiragiUtils.inheritStatus(<botania:terrasword>), null);
            HiiragiUtils.addCraftingAdv(true, true, <botania:manaring>, [[<botania:manatablet>.marked("inherit"), <ore:ringManasteel>]], HiiragiUtils.inheritStatus(<botania:manaring>), null);
            HiiragiUtils.addCrafting(true, true, <botania:auraring>, [[<ore:runeManaB>, <ore:ringManasteel>]]);
            HiiragiUtils.addCrafting(true, true, <botania:magnetring>, [[<botania:lens:10>, <ore:ringManasteel>]]);
            HiiragiUtils.addCrafting(true, true, <botania:waterring>, [[<ore:runeWaterB>, <ore:ringManasteel>]]);
            HiiragiUtils.addCrafting(true, true, <botania:miningring>, [[<ore:runeEarthB>, <ore:ringManasteel>]]);
            val toolElementium as IItemStack[IItemStack] = {
                <botania:elementiumpick>: <tconstruct:pick_head>,
                <botania:elementiumshovel>: <tconstruct:shovel_head>,
                <botania:elementiumaxe>: <tconstruct:axe_head>,
                <botania:elementiumsword>: <tconstruct:sword_blade>,
            };
            for tool, toolHead in toolElementium {
                HiiragiUtils.addCrafting(true, true, tool, [[toolHead, <botania:manaresource:13>]]);
            }
            HiiragiUtils.addCrafting(false, true, <botania:elementiumshears>, RecipePattern.init(["AB", "CA"]).map({A:<ore:plateElvenElementium>, B:<ore:GT.tool.file>, C:<ore:boltDreamwood>}).ingredients);
            HiiragiUtils.addCrafting(false, true, <botania:openbucket>, RecipePattern.init(["A A", " A "]).map({A:<ore:plateElvenElementium>}).ingredients);
            HiiragiUtils.addCrafting(true, true, <botania:craftinghalo>, [[<ore:workbench>, <ore:ringManasteel>]]);
            HiiragiUtils.addCrafting(false, true, <botania:crystalbow>, RecipePattern.init([" AB", "C B", " AB"]).map({A:<botania:manaresource:13>, B:<botania:manaresource:16>, C:<botania:manaresource:3>}).ingredients);
            HiiragiUtils.addCraftingAdv(false, false, <botania:crystalbow>, RecipePattern.init([" A", "BC", " A"]).map({A:<botania:manaresource:13>, B:<botania:manaresource:3>, C:<botania:livingwoodbow>.marked("inherit")}).ingredients, HiiragiUtils.inheritStatus(<botania:crystalbow>), null);
            HiiragiUtils.addCrafting(true, true, <botania:swapring>, [[<artisanworktables:toolbox>, <ore:ringManasteel>]]);
            //HiiragiUtils.addCrafting(false, true, <botania:baublebox>, RecipePattern.init([" A ", "BCB", " B "]).map({A:<ore:plateGold>, B:<ore:plateManasteel>, C:<ore:chest>}).ingredients);
            HiiragiUtils.addCrafting(false, true, <botania:pylon:0>, RecipePattern.init([" A ", "BAB", "BCB"]).map({A:<ore:gemManaDiamond>, B:<ore:plateGold>, C:<botania:storage:0>}).ingredients);
            HiiragiUtils.addCrafting(false, true, <botania:pylon:1>, RecipePattern.init([" A ", "BAB", "BCB"]).map({A:<contenttweaker:ephemerald>, B:<ore:plateLivingwood>, C:<botania:storage:1>}).ingredients);
            //HiiragiUtils.addCrafting(false, true, <botania:spreader:0>, RecipePattern.init(["AAA", "BCD", "AAA"]).map({A:<botania:livingwood:0>, B:<ore:gemManaDiamond>, C:<ore:gearGold>, D:<botania:managlass>}).ingredients);
            //HiiragiUtils.addCrafting(false, true, <botania:pool:0>, RecipePattern.init(["A A", "AAA"]).map({A:<ore:plateLivingrock>}).ingredients);
            //HiiragiUtils.addCrafting(true, true, <botania:manadetector>, [[<contenttweaker:casing_livingrock>, <minecraft:comparator>]]);
            //HiiragiUtils.addCrafting(false, true, <botania:turntable>, RecipePattern.init([" A ", " B ", "CCC"]).map({A:<ore:slimeball>, B:<contenttweaker:casing_livingwood>, C:<ore:gearWood>}).ingredients);
            //HiiragiUtils.addCrafting(true, true, <botania:opencrate:0>, [[<contenttweaker:casing_livingwood>, <ore:GT.tool.saw>]]);
            //HiiragiUtils.addCrafting(false, true, <botania:opencrate:1>, RecipePattern.init(["ABA", "ACA", "A A"]).map({A:<ore:plateDreamwood>, B:<ore:workbench>, C:<ore:frameDreamwood>}).ingredients);
            //HiiragiUtils.addCrafting(false, true, <botania:terraplate>, RecipePattern.init([" A ", "BBB"]).map({A:<biomesoplenty:terrestrial_artifact>, B:<minecraft:lapis_block>}).ingredients);
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

            recipes.replaceAllOccurences(<botania:livingrock>, <ore:plateLivingrock>, <botania:manaresource:11>);
            //recipes.replaceAllOccurences(<botania:livingrock>, <ore:plateLivingrock>, <botania:manatablet>);
            //recipes.replaceAllOccurences(<botania:manaresource>, <ore:plateManasteel>, <botania:baublebox>);
            recipes.replaceAllOccurences(<minecraft:gold_ingot>, <ore:plateGold>, <botania:baublebox>);
            recipes.replaceAllOccurences(<minecraft:gold_ingot>, <ore:gearGold>, <botania:spreader:0>);
            recipes.replaceAllOccurences(<botania:livingrock>, <ore:plateLivingrock>, <botania:pool:0>);
            recipes.replaceAllOccurences(<botania:livingwood>, <ore:plateLivingwood>, <botania:turntable>);

        //Botanic Adds
            HiiragiUtils.addCrafting(false, true, <botanicadds:pool_dreaming>, RecipePattern.init(["A A", "AAA"]).map({A:<ore:plateDreamrock>}).ingredients);
            HiiragiUtils.addCraftingAdv(false, true, <botanicadds:mana_stealer_sword>, RecipePattern.init(["A", "A", "B"]).map({A:<botanicadds:gaiasteel_ingot>, B:<botania:terrasword>.marked("inherit")}).ingredients, HiiragiUtils.inheritStatus(<botanicadds:mana_stealer_sword>), null);

    //新規
        //Content Tweaker
            //HiiragiUtils.addCrafting(false, true, <contenttweaker:casing_livingwood>, RecipePattern.init(["ABA", "ACA", "ADA"]).map({A:<ore:plateLivingwood>, B:<ore:GT.tool.saw>, C:<ore:frameLivingwood>, D:<ore:GT.tool.hammer.soft>}).ingredients);
            //HiiragiUtils.addCrafting(false, false, <contenttweaker:casing_livingrock>, RecipePattern.init(["ABA", "ACA", "ADA"]).map({A:<ore:plateLivingrock>, B:<ore:GT.tool.saw>, C:<ore:frameLivingwood>, D:<ore:GT.tool.hammer.hard>}).ingredients);
            //HiiragiUtils.addCrafting(false, false, <contenttweaker:agglo_core_mana>, RecipePattern.init(["ABA", "CDC", "EEE"]).map({A:<botania:quartztypemana:2>, B:<botania:quartztypemana:1>, C:<ore:gemManaDiamond>, D:<botania:storage:0>, E:<ore:plateLivingrock>}).ingredients);
            //HiiragiUtils.addCrafting(false, false, <contenttweaker:agglo_core_terra>, RecipePattern.init(["ABA", "CDC", "EEE"]).map({A:<botania:quartztypeelf:2>, B:<botania:quartztypeelf:1>, C:<contenttweaker:ephemerald>, D:<botania:storage:1>, E:<ore:plateDreamrock>}).ingredients);
            //HiiragiUtils.addCrafting(false, false, <contenttweaker:agglo_core_elem>, RecipePattern.init(["ABA", "CDC", "EEE"]).map({A:<botania:quartztypelavender:2>, B:<botania:quartztypelavender:1>, C:<ore:gemDragonStone>, D:<botania:storage:2>, E:<botania:shimmerrock>}).ingredients);

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
            .map({A:<ore:plateTerrasteel>, B:<ore:plateDoubleTerrasteel>, C:<ore:plateLivingwood>, D:<botania:manatablet>, E:<botania:livingwood>, F:<ore:stickTerrasteel>})
            .ingredients)
        .addOutput(<botania:terrapick>)
        .create();
    //Terra Truncator
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern
            .init(["  AA ", " ABBC", " ABDA", "  CA ", " E   "])
            .map({A:<ore:plateTerrasteel>, B:<ore:plateDoubleTerrasteel>, C:<botania:livingwood:0>, D:<minecraft:glowstone>, E:<botania:manaresource:4>})
            .ingredients)
        .addOutput(<botania:terraaxe>)
        .create();

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
        Manapool.removeRecipe(<botania:manaresource:0>);
        Manapool.addInfusion(<botania:manaresource:0>, <ore:ingotWroughtIron>, 3000);
        Manapool.addInfusion(<botania:manaresource:0>*2, <ore:ingotSteel>, 3000);
        Manapool.addInfusion(<botania:manaresource:0>*2, <twilightforest:steeleaf_ingot>, 3000);
        Manapool.addInfusion(<botania:manaresource:0>*4, <ore:ingotStainlessSteel>, 3000);
        Manapool.addInfusion(<botania:manaresource:0>*8, <ore:ingotTungstensteel>, 3000);
        Manapool.addInfusion(<botania:manaresource:0>*8, <enderio:item_alloy_ingot:6>, 3000);
    //Block of Manasteel
        Manapool.addInfusion(<botania:storage:0>, <ore:blockWroughtIron>, 27000);
        Manapool.addInfusion(<botania:storage:0>*2, <ore:blockSteel>, 27000);
        Manapool.addInfusion(<botania:storage:0>*2, <twilightforest:block_storage:2>, 27000);
        Manapool.addInfusion(<botania:storage:0>*4, <ore:blockStainlessSteel>, 27000);
        Manapool.addInfusion(<botania:storage:0>*8, <ore:blockTungstensteel>, 27000);
        Manapool.addInfusion(<botania:storage:0>*8, <enderio:block_alloy:6>, 27000);

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
    //val dreaming_daisy = mods.morechids.Registry.getFlower("dreaming_daisy");
    //dreaming_daisy.addRecipe(<botania:livingrock>, <botanicadds:dreamrock>, 1);

//アズレージョをChiselで加工するように変更
    chisel.addGroup("azulejo");
    for i in 0 to 15 {
        HiiragiUtils.removeCrafting(<botania:custombrick>.definition.makeStack(i));
        chisel.addVariation("azulejo", <botania:custombrick>.definition.makeStack(i));
    }

//装飾品をchiselで加工するように変更
    chisel.addGroup("botania_cosmetic");
    for i in 0 to 32 {
        HiiragiUtils.removeCrafting(<botania:cosmetic>.definition.makeStack(i));
        chisel.addVariation("botania_cosmetic", <botania:cosmetic>.definition.makeStack(i));
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
