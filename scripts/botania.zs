#======================================================================
# name : botania.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Scripts for Botania
#======================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import mods.gregtech.recipe.RecipeMap;

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

//このscriptの読み込みの完了をログに出力
print("botania.zs loaded!");
