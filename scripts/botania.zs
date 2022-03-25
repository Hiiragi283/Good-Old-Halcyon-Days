#======================================================================
# name : botania-main.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Scripts for Botania
#======================================================================

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
import mods.ctintegration.util.RecipePattern;
import mods.gregtech.recipe.RecipeMap;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading botania-main.zs ...");

//変数の定義

//作業台レシピの編集
    //削除
        val removeCrafting as IItemStack[] = [
            <botania:fertilizer>,
            <botania:manaresource:6>
        ];
        for i in removeCrafting {
            HiiragiUtils.removeCrafting(i);
        }
    //上書き
        HiiragiUtils.addCrafting(false, true, <botania:lexicon>, RecipePattern.init(["AA ", "AB ", "   "]).map({A:<ore:paper>, B:<twilightforest:naga_scale>}).ingredients);
        HiiragiUtils.addCrafting(false, true, <botania:spreader:0>, RecipePattern.init(["   ", "ABC", "   "]).map({A:<botania:manaresource:2>, B:<contenttweaker:casing_livingwood>, C:<ore:ringGold>}).ingredients);
        HiiragiUtils.addCrafting(false, true, <botania:turntable>, RecipePattern.init([" A ", " B ", "CCC"]).map({A:<ore:slimeball>, B:<contenttweaker:casing_livingwood>, C:<ore:gearWood>}).ingredients);
        HiiragiUtils.addCrafting(true, true, <botania:opencrate:0>, [[<contenttweaker:casing_livingwood>, <ore:GT.tool.saw>]]);
        HiiragiUtils.addCrafting(false, true, <botania:pool:0>*2, RecipePattern.init(["A", "B", "C"]).map({A:<contenttweaker:casing_livingrock>, B:<botania:manaresource:1>, C:<ore:GT.tool.saw>}).ingredients);
        HiiragiUtils.addCrafting(true, true, <botania:manadetector>, [[<contenttweaker:casing_livingrock>, <minecraft:comparator>]]);
        val redStringed as IIngredient[IItemStack] = {
            <botania:redstringcontainer>: <ore:chest>,
            <botania:redstringdispenser>: <minecraft:dispenser>,
            <botania:redstringfertilizer>: <botania:fertilizer>,
            <botania:redstringcomparator>: <minecraft:comparator>,
            <botania:redstringrelay>: <botania:spreader:0>
        };
        for output, input in redStringed {
            HiiragiUtils.addCrafting(false, true, output, RecipePattern.init(["ABC"]).map({A:<contenttweaker:casing_livingrock>, B:<botania:manaresource:12>, C:input}).ingredients);
        }
        HiiragiUtils.addCrafting(false, true, <botania:manatablet>, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<contenttweaker:plate_livingrock>, B:<botania:manaresource:1>}).ingredients);
        HiiragiUtils.addCrafting(false, true, <botania:manatablet>, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<contenttweaker:plate_livingrock>, B:<botania:manaresource:2>}).ingredients);
        HiiragiUtils.addCrafting(true, true, <botania:manaresource:11>*6, [[<ore:workbench>, <contenttweaker:plate_livingrock>]]);
        HiiragiUtils.addCrafting(false, true, <botania:pylon:0>, RecipePattern.init([" A ", "BAB", "BCB"]).map({A:<ore:gemManaDiamond>, B:<ore:plateGold>, C:<ore:blockManasteel>}).ingredients);
        HiiragiUtils.addCrafting(false, true, <botania:pylon:1>, RecipePattern.init([" A ", "BAB", "BCB"]).map({A:<contenttweaker:ephemerald>, B:<contenttweaker:plate_livingwood>, C:<ore:blockTerrasteel>}).ingredients);


    //特殊レシピ
        //Band of Mana
            HiiragiUtils.removeCrafting(<botania:manaring>);
            recipes.addShapeless("HiiragiUtils_manaring", <botania:manaring>.withTag({mana:0}), [<botania:manatablet>.marked("tablet"), <ore:ringManasteel>],
                function(out, ins, cInfo){
                    if(!ins.tablet.hasTag) {
                        return <botania:manaring>.withTag({mana:0});
                    } else {
                        var nbt as IData = ins.tablet.tag;
                        return <botania:manaring>.withTag(nbt);
                    }
                }, null);


    //新規
        HiiragiUtils.addCrafting(true, false, <contenttweaker:plate_livingwood>, [[<botania:livingwood:0>, <ore:GT.tool.saw>]]);
        HiiragiUtils.addCrafting(false, true, <contenttweaker:casing_livingwood>, RecipePattern.init(["ABA", "ACA", "ADA"]).map({A:<contenttweaker:plate_livingwood>, B:<ore:GT.tool.saw>, C:<ore:frameGtWood>, D:<ore:GT.tool.hammer.soft>}).ingredients);
        HiiragiUtils.addCraftingConv(<botania:livingwood:1>, <contenttweaker:plate_livingwood>);
        HiiragiUtils.addCrafting(true, false, <contenttweaker:plate_livingrock>, [[<botania:livingrock>, <ore:GT.tool.saw>]]);
        HiiragiUtils.addCrafting(false, false, <contenttweaker:casing_livingrock>, RecipePattern.init(["ABA", "ACA", "ADA"]).map({A:<contenttweaker:plate_livingrock>, B:<ore:GT.tool.saw>, C:<ore:frameGtWood>, D:<ore:GT.tool.hammer.hard>}).ingredients);

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
        Manapool.addInfusion(<botania:manaresource:0>*2, <ore:ingotSteeleaf>, 3000);
        Manapool.addInfusion(<botania:manaresource:0>*4, <ore:ingotStainlessSteel>, 3000);
        Manapool.addInfusion(<botania:manaresource:0>*8, <ore:ingotTungstenSteel>, 3000);
        Manapool.addInfusion(<botania:manaresource:0>*8, <ore:ingotDarkSteel>, 3000);
    //Block of Manasteel
        Manapool.addInfusion(<botania:storage:0>, <ore:blockWroughtIron>, 27000);
        Manapool.addInfusion(<botania:storage:0>*2, <ore:blockSteel>, 27000);
        Manapool.addInfusion(<botania:storage:0>*2, <ore:blockSteeleaf>, 27000);
        Manapool.addInfusion(<botania:storage:0>*4, <ore:blockStainlessSteel>, 27000);
        Manapool.addInfusion(<botania:storage:0>*8, <ore:blockTungstenSteel>, 27000);
        Manapool.addInfusion(<botania:storage:0>*8, <ore:blockDarkSteel>, 27000);


//Pure Daisyによる加工
    val toRemovePure as IIngredient[] = [
        <botania:livingwood>
    ];
    for i in toRemovePure {
        PureDaisy.removeRecipe(i);
    }

    PureDaisy.addRecipe(<botania:livingwood>, <twilightforest:twilight_log:*>);

//このscriptの読み込みの完了をログに出力
print("botania-main.zs loaded!");
