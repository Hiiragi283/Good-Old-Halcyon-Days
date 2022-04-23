#======================================================================
# name : ender.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Scripts for category of Ender
#======================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.astralsorcery.Altar;
import mods.botania.PureDaisy as PureDaisy;
import mods.ctintegration.util.RecipePattern;
import mods.evilcraft.EnvironmentalAccumulator;
import mods.gregtech.recipe.RecipeMap;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading ender.zs ...");

//変数の定義

//作業台レシピの編集
    //削除
        val removeCrafting as IItemStack[] = [];
        for i in removeCrafting {
            HiiragiUtils.removeCrafting(i);
        }
    //上書き
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

//GTレシピの編集
    //削除
    //上書き
    //新規
        //Resonant Ender
        <recipemap:extractor>.recipeBuilder()
            .inputs([<minecraft:ender_pearl>])
            .fluidOutputs([<liquid:ender>*250])
            .duration(2.5*20)
            .EUt(30)
            .buildAndRegister();
        <recipemap:extractor>.recipeBuilder()
            .inputs([<ore:dustEnderPearl>])
            .fluidOutputs([<liquid:ender>*250])
            .duration(2.5*20)
            .EUt(30)
            .buildAndRegister();
        //Dew of the Void
        <recipemap:distillery>.recipeBuilder()
            .property("circuit", 0)
            .fluidInputs(<liquid:ender>*1000)
            .outputs(<enderio:item_material:28>)
            .fluidOutputs(<liquid:ender_distillation>*200)
            .duration(12*20)
            .EUt(480)
            .buildAndRegister();
        //Ender Stone
        <recipemap:autoclave>.recipeBuilder()
            .inputs([<appliedenergistics2:material:45>])
            .fluidInputs([<liquid:ender_distillation>*1000])
            .outputs([<contenttweaker:ender_stone>])
            .duration(60*20)
            .EUt(480)
            .buildAndRegister();

        //Liquid Death
        <recipemap:extractor>.recipeBuilder()
            .inputs([<extrautils2:ingredients:10>])
            .fluidOutputs([<liquid:liquid_death>*250])
            .duration(2.5*20)
            .EUt(30)
            .buildAndRegister();
        //Dew of the Evil
        <recipemap:distillery>.recipeBuilder()
            .property("circuit", 0)
            .fluidInputs(<liquid:liquid_death>*1000)
            .outputs(<astralsorcery:itemusabledust:1>)
            .fluidOutputs(<liquid:evil_distillation>*200)
            .duration(12*20)
            .EUt(480)
            .buildAndRegister();
        //Evil Infused Metal
        <recipemap:electric_blast_furnace>.recipeBuilder()
            .property("temperature", "4444")
            .inputs([<metaitem:dustTungsten>])
            .fluidInputs(<liquid:evil_distillation>*1000)
            .outputs(<extrautils2:ingredients:17>)
            .duration(13*20)
            .EUt(480)
            .buildAndRegister();

    /*
    <recipemap:name>.recipeBuilder()
        .inputs([])
        .outputs()
        .duration()
        .EUt()
        .buildAndRegister();
    */

//ブロックのpropertyを改変
    <minecraft:end_portal_frame>.hardness = 100;

//Starlight Crafting Tableによる加工
    HiiragiUtils.addAltarAS2(<contenttweaker:end_portal_altar>, 1500, 300, RecipePattern.init(["A ABCBBBBAAAA"]).map({A:<metaitem:plateEnderium>, B:<minecraft:end_stone>, C:<thaumcraft:void_seed>}).ingredients);

//Pure Daisyによる加工
    //End Stone
    PureDaisy.addRecipe(<contenttweaker:ender_stone>, <minecraft:end_stone>);

//SEAによる加工
    mods.evilcraft.EnvironmentalAccumulator.addRecipe(<minecraft:ender_pearl>, "LIGHTNING", <minecraft:ender_eye>, "CLEAR", 10, 10, -1.0);

//このscriptの読み込みの完了をログに出力
print("ender.zs loaded!");
