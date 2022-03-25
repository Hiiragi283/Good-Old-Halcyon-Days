#======================================================================
# name : botania-flower.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Script for flowers in Botania
#======================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.botania.Apothecary;
import mods.botania.ElvenTrade as ElvenTrade;
import mods.botania.PureDaisy as PureDaisy;
import mods.ctintegration.util.RecipePattern;
import mods.gregtech.recipe.RecipeMap;
import mods.zenutils.I18n;
import thaumcraft.aspect.CTAspectStack;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading botania-flower.zs ...");

//機能をもつ花
    //Petal Apothecaryからレシピを削除する
        val recipeApothecary as string[]= [
            "puredaisy",
            "manastar",
            "endoflame",
            "hydroangeas",
            "thermalily",
            "arcanerose",
            "munchdew",
            "entropinnyum",
            "kekimurus",
            "gourmaryllis",
            "narslimmus",
            "spectrolus",
            "rafflowsia",
            "shulk_me_not",
            "dandelifeon",
            "jadedAmaranthus",
            "bellethorn",
            "dreadthorn",
            "heiseiDream",
            "tigerseye",
            "marimorphosis",
            "orechid",
            "orechidIgnem",
            "fallenKanade",
            "exoflame",
            "agricarnation",
            "hopperhock",
            "tangleberrie",
            "jiyuulia",
            "rannuncarpus",
            "hyacidus",
            "pollidisiac",
            "clayconia",
            "loonium",
            "daffomill",
            "vinculotus",
            "spectranthemum",
            "medumone",
            "bubbell",
            "solegnolia",
            "bergamute",
            "ba_wither_flower",
            "ba_rain_flower",
            "ba_snow_flower",
            "ba_lightning_flower"
        ];
        for i in recipeApothecary {
            mods.botania.Apothecary.removeRecipe(<botania:specialflower>.withTag({type:i}));
        }
    //Pure Daisy
        RecipeBuilder.get("basic")
            .setShaped(RecipePattern.init([" A ", "ABA", " A "]).map({A:<botania:petal:0>, B:<minecraft:red_flower:8>}).ingredients)
            .setFluid(<liquid:mana_fluid> * 1000)
            .addOutput(<botania:specialflower>.withTag({type: "puredaisy"}))
            .create();
    //Dreaming Daisy
            ElvenTrade.addRecipe([<botania:specialflower>.withTag({type: "dreaming_daisy"})], [<botania:specialflower>.withTag({type: "puredaisy"})]);
            <botania:specialflower>.withTag({type: "dreaming_daisy"}).addTooltip(I18n.format("gohd.tooltip.dreaming_daisy.name"));

    //Orechid
        HiiragiUtils.addCraftingArcane(false, false, "", 100, [], <botania:specialflower>.withTag({type: "orechid"}), [
                                    [<ore:blockLapis>, <ore:blockEmerald>, <ore:blockRedstone>],
                                    [<ore:blockCoal>, <ore:mysticFlowerLime>, <ore:blockGold>],
                                    [<ore:blockIron>, <twilightforest:ore_magnet>, <ore:blockDiamond>]]);
    //Orechid Terrestris
        HiiragiUtils.addCraftingArcane(false, false, "", 100, [], <botania:specialflower>.withTag({type: "orechid_terrestris"}), [
                                    [<botania:biomestonea:7>, <botania:biomestonea:2>, <botania:biomestonea:6>],
                                    [<botania:biomestonea:0>, <botania:specialflower>.withTag({type: "orechid"}), <botania:biomestonea:5>],
                                    [<botania:biomestonea:4>, <thaumcraft:nugget:10>, <botania:biomestonea:3>]]);


//このscriptの読み込みの完了をログに出力
print("botania-flower.zs loaded!");
