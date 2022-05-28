#======================================================================
# name : advrocktery.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Scripts for Advanced Rocktery
#======================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading advrocktery.zs ...");

//変数の定義

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
    HiiragiUtils.addCrafting(true, true, <advancedrocketry:satelliteidchip>, [[<techreborn:part:3>]]);
    HiiragiUtils.addCrafting(true, true, <advancedrocketry:carbonscrubbercartridge>, [[<techreborn:dynamiccell>, <minecraft:iron_bars>]]);

    recipes.replaceAllOccurences(<libvulpes:productsheet:1>, <ore:plateIron>);
    recipes.replaceAllOccurences(<libvulpes:productsheet:4>, <ore:plateCopper>);
    recipes.replaceAllOccurences(<libvulpes:productsheet:6>, <ore:plateSteel>);
    recipes.replaceAllOccurences(<libvulpes:productsheet:7>, <ore:plateTitanium>);
    //recipes.replaceAllOccurences(<advancedrocketry:ic:3>, <metaitem:circuit.quantum_processor>);
    //recipes.replaceAllOccurences(<advancedrocketry:ic:4>, <metaitem:robot.arm.hv>);
    //recipes.replaceAllOccurences(<advancedrocketry:ic:5>, <metaitem:fluid.regulator.hv>);
    recipes.replaceAllOccurences(<advancedrocketry:misc:0>, <techreborn:part:24>);
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

//このscriptの読み込みの完了をログに出力
print("advrocktery.zs loaded!");
