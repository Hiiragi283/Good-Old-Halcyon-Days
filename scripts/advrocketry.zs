#======================================================================
# name : advrocktery.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Scripts for Advanced Rocktery
#======================================================================

#priority 0
#norun

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
print("Start loading advrocktery.zs ...");

//変数の定義
    val toRemove as IItemStack[] = [
        <libvulpes:productdust:*>,
        <libvulpes:productingot:*>,
        <libvulpes:productboule:*>,
        <libvulpes:productnugget:*>,
        <libvulpes:productplate:*>,
        <libvulpes:productrod:*>,
        <libvulpes:productfan:6>,
        <libvulpes:productsheet:*>,
        <libvulpes:productgear:*>,
        <libvulpes:ore0:*>,
        <libvulpes:metal0:4>,
        <libvulpes:metal0:5>,
        <libvulpes:metal0:6>,
        //<libvulpes:metal0:7>,
        <libvulpes:metal0:9>,
        <libvulpes:metal0:10>,
        <advancedrocketry:productdust:*>,
        <advancedrocketry:productingot:*>,
        <advancedrocketry:productnugget:*>,
        <advancedrocketry:productplate:*>,
        <advancedrocketry:productrod:*>,
        <advancedrocketry:productgear:*>,
    ];
    for i in toRemove {
        HiiragiUtils.removeFromJEI(i);
        HiiragiUtils.removeOreDict(i);
    }

//作業台レシピの編集
    //削除
        val removeCrafting as IItemStack[] = [
            <advancedrocketry:misc:1>,
            <advancedrocketry:sawbladeiron>
        ];
        for i in removeCrafting {
            HiiragiUtils.removeCrafting(i);
        }
    //上書き
    HiiragiUtils.addCrafting(true, true, <advancedrocketry:satelliteidchip>, [[<ore:circuitExtreme>]]);
    HiiragiUtils.addCrafting(true, true, <advancedrocketry:carbonscrubbercartridge>, [[<metaitem:fluid_cell.universal>, <metaitem:electric.pump.hv>]]);

    recipes.replaceAllOccurences(<libvulpes:productsheet:1>, <ore:plateIron>);
    recipes.replaceAllOccurences(<libvulpes:productsheet:4>, <ore:plateCopper>);
    recipes.replaceAllOccurences(<libvulpes:productsheet:6>, <ore:plateSteel>);
    recipes.replaceAllOccurences(<libvulpes:productsheet:7>, <ore:plateTitanium>);
    recipes.replaceAllOccurences(<advancedrocketry:wafer>, <metaitem:wafer.silicon>);
    recipes.replaceAllOccurences(<advancedrocketry:ic:3>, <metaitem:circuit.quantum_processor>);
    recipes.replaceAllOccurences(<advancedrocketry:ic:4>, <metaitem:robot.arm.hv>);
    recipes.replaceAllOccurences(<advancedrocketry:ic:5>, <metaitem:fluid.regulator.hv>);
    recipes.replaceAllOccurences(<advancedrocketry:misc:0>, <metaitem:cover.screen>);
    recipes.replaceAllOccurences(<advancedrocketry:lens>, <metaitem:lensGlass>);
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
        RecipeBuilder.get("basic")
            .setShapeless([<ore:blockQuartz>])
            .addTool(<ore:GT.tool.hammer.hard>, 1)
            .addTool(<chisel:chisel_iron>, 1)
            .addOutput(<advancedrocketry:iquartzcrucible>)
            .create();

//GTレシピの編集
    //削除
    //上書き
    //新規
        <recipemap:laser_engraver>.recipeBuilder()
            .inputs([<contenttweaker:circuit_board_elite>])
            .notConsumable([<metaitem:lensSapphire>])
            .outputs([<advancedrocketry:ic:0>*4])
            .duration(10*20)
            .EUt(60)
            .buildAndRegister();
        <recipemap:laser_engraver>.recipeBuilder()
            .inputs([<contenttweaker:circuit_board_elite>])
            .notConsumable([<metaitem:lensRuby>])
            .outputs([<advancedrocketry:ic:1>*2])
            .duration(10*20)
            .EUt(60)
            .buildAndRegister();
        <recipemap:laser_engraver>.recipeBuilder()
            .inputs([<contenttweaker:circuit_board_elite>])
            .notConsumable([<metaitem:lensEmerald>])
            .outputs([<advancedrocketry:ic:2>*2])
            .duration(10*20)
            .EUt(60)
            .buildAndRegister();
        <recipemap:laser_engraver>.recipeBuilder()
            .inputs([<metaitem:tool.datastick>])
            .notConsumable([<metaitem:lensEmerald>])
            .outputs([<advancedrocketry:dataunit>])
            .duration(10*20)
            .EUt(60)
            .buildAndRegister();
        //Space Suits
            <recipemap:assembler>.recipeBuilder()
                .inputs([<ore:platePolytetrafluoroethylene>*10, <ore:platePlastic>*5, <ore:foilAluminum>*5, <ore:foilGold>])
                .fluidInputs(<liquid:silicone_rubber>*1440)
                .outputs([<advancedrocketry:spacehelmet>])
                .duration(60*20)
                .EUt(1920)
                .buildAndRegister();
            <recipemap:assembler>.recipeBuilder()
                .inputs([<ore:platePolytetrafluoroethylene>*16, <ore:platePlastic>*8, <ore:foilAluminum>*8])
                .fluidInputs(<liquid:silicone_rubber>*1152)
                .outputs([<advancedrocketry:spacechestplate>])
                .duration(60*20)
                .EUt(1920)
                .buildAndRegister();
            <recipemap:assembler>.recipeBuilder()
                .inputs([<ore:platePolytetrafluoroethylene>*14, <ore:platePlastic>*7, <ore:foilAluminum>*7])
                .fluidInputs(<liquid:silicone_rubber>*1008)
                .outputs([<advancedrocketry:spaceleggings>])
                .duration(60*20)
                .EUt(1920)
                .buildAndRegister();
            <recipemap:assembler>.recipeBuilder()
                .inputs([<ore:platePolytetrafluoroethylene>*8, <ore:platePlastic>*4, <ore:foilAluminum>*4])
                .fluidInputs(<liquid:silicone_rubber>*576)
                .outputs([<advancedrocketry:spaceboots>])
                .duration(60*20)
                .EUt(1920)
                .buildAndRegister();
        <recipemap:extruder>.recipeBuilder()
            .inputs([<ore:plateWroughtIron>*4])
            .notConsumable([<metaitem:shape.extruder.bottle>])
            .outputs([<advancedrocketry:pressuretank:0>])
            .duration(10*20)
            .EUt(60)
            .buildAndRegister();
        <recipemap:extruder>.recipeBuilder()
            .inputs([<ore:plateSteel>*4])
            .notConsumable([<metaitem:shape.extruder.bottle>])
            .outputs([<advancedrocketry:pressuretank:1>])
            .duration(10*20)
            .EUt(60)
            .buildAndRegister();
        <recipemap:extruder>.recipeBuilder()
            .inputs([<ore:plateAluminum>*4])
            .notConsumable([<metaitem:shape.extruder.bottle>])
            .outputs([<advancedrocketry:pressuretank:2>])
            .duration(10*20)
            .EUt(60)
            .buildAndRegister();
        <recipemap:extruder>.recipeBuilder()
            .inputs([<ore:plateTitanium>*4])
            .notConsumable([<metaitem:shape.extruder.bottle>])
            .outputs([<advancedrocketry:pressuretank:4>])
            .duration(10*20)
            .EUt(60)
            .buildAndRegister();
        <recipemap:compressor>.recipeBuilder()
            .inputs([<ore:dustCarbon>])
            .outputs([<advancedrocketry:misc:1>])
            .duration(4*20)
            .EUt(4)
            .buildAndRegister();
        <recipemap:lathe>.recipeBuilder()
            .inputs([<ore:plateWroughtIron>])
            .outputs([<advancedrocketry:sawbladeiron>, <metaitem:dustSmallWroughtIron>])
            .duration(5.6*20)
            .EUt(16)
            .buildAndRegister();
    /*
    <recipemap:name>.recipeBuilder()
        .inputs([])
        .outputs()
        .duration()
        .EUt()
        .buildAndRegister();
    */

//このscriptの読み込みの完了をログに出力
print("advrocktery.zs loaded!");
