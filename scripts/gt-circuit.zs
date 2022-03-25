#======================================================================
# name : gt-circuit.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : scripts for circuit assembling
#======================================================================

#priority 0

#crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

#各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import mods.gregtech.recipe.RecipeMap;

#scriptのimport
import scripts.HiiragiUtils;

#このscriptの読み込みの開始をログに出力
print("Start loading gt-circuit.zs ...");

#変数の定義

#作業台レシピの編集
##削除
val toRemove as IItemStack[] = [
    <metaitem:circuit.electronic>,
    <metaitem:circuit.good_electronic>
];

for i in toRemove {
    HiiragiUtils.removeCrafting(i);
}

val hideFromJEI as IItemStack[] = [
    <metaitem:board.coated>,
    <metaitem:board.phenolic>,
    <metaitem:board.plastic>,
    <metaitem:board.epoxy>,
    <metaitem:board.fiber_reinforced>,
    <metaitem:board.multilayer.fiber_reinforced>,
    <metaitem:board.wetware>,
    <metaitem:circuit_board.basic>,
    <metaitem:circuit_board.good>,
    <metaitem:circuit_board.plastic>,
    <metaitem:circuit_board.advanced>,
    <metaitem:circuit_board.extreme>,
    <metaitem:circuit_board.elite>,
    <metaitem:circuit_board.wetware>,
    <metaitem:component.transistor>,
    //<metaitem:component.resistor>,
    <metaitem:component.capacitor>,
    //<metaitem:component.diode>,
    <metaitem:component.inductor>,
    <metaitem:circuit.basic_integrated>,
    <metaitem:circuit.good_integrated>,
    <metaitem:circuit.microprocessor>,
    <metaitem:circuit.assembly>,
    <metaitem:circuit.workstation>
];
for i in hideFromJEI {
    HiiragiUtils.removeFromJEI(i);
    HiiragiUtils.removeOreDict(i);
}

/*
<recipemap:name>.recipeBuilder()
    .inputs([])
    .outputs()
    .duration()
    .EUt()
    .buildAndRegister();
*/

//回路部品
    //Transistor
        <recipemap:assembler>.findRecipe(120, [<metaitem:plateSilicon>, <metaitem:wireFineTin> * 6], [<liquid:plastic> * 144]).remove();
    //Capacitor
    <recipemap:assembler>.findRecipe(120, [<metaitem:foilPlastic>, <metaitem:foilAluminium> * 2], [<liquid:plastic> * 144]).remove();
    //Inductor
        <recipemap:assembler>.findRecipe(30, [<metaitem:ringSteel>, <metaitem:wireFineCopper> * 2], [<liquid:plastic> * 36]).remove();
        <recipemap:assembler>.findRecipe(30, [<metaitem:ringNickelZincFerrite>, <metaitem:wireFineAnnealedCopper> * 2], [<liquid:plastic> * 36]).remove();
        <recipemap:assembler>.findRecipe(30, [<metaitem:ringSteel>, <metaitem:wireFineAnnealedCopper> * 2], [<liquid:plastic> * 36]).remove();
        <recipemap:assembler>.findRecipe(30, [<metaitem:ringNickelZincFerrite>, <metaitem:wireFineCopper> * 2], [<liquid:plastic> * 36]).remove();

    //Etched Basic Wiring
        //Copper
            <recipemap:chemical_reactor>.recipeBuilder()
                .inputs([<ore:foilCopper>])
                .fluidInputs([<liquid:iron_iii_chloride>*250])
                .outputs([<contenttweaker:wiring_basic>])
                .duration(5*20)
                .EUt(30)
                .buildAndRegister();
            <recipemap:chemical_reactor>.recipeBuilder()
                .inputs([<ore:foilCopper>])
                .fluidInputs([<liquid:sodium_persulfate>*500])
                .outputs([<contenttweaker:wiring_basic>])
                .duration(5*20)
                .EUt(30)
                .buildAndRegister();
            <recipemap:laser_engraver>.recipeBuilder()
                .inputs([<ore:foilCopper>])
                .notConsumable([<ore:craftingLensOrange>])
                .outputs([<contenttweaker:wiring_basic>])
                .duration(10*20)
                .EUt(120)
                .buildAndRegister();
        //Annealed Copper
            <recipemap:chemical_reactor>.recipeBuilder()
                .inputs([<ore:foilAnnealedCopper>])
                .fluidInputs([<liquid:iron_iii_chloride>*250])
                .outputs([<contenttweaker:wiring_basic>*2])
                .duration(5*20)
                .EUt(30)
                .buildAndRegister();
            <recipemap:chemical_reactor>.recipeBuilder()
                .inputs([<ore:foilAnnealedCopper>])
                .fluidInputs([<liquid:sodium_persulfate>*500])
                .outputs([<contenttweaker:wiring_basic>*2])
                .duration(5*20)
                .EUt(30)
                .buildAndRegister();
            <recipemap:laser_engraver>.recipeBuilder()
                .inputs([<ore:foilAnnealedCopper>])
                .notConsumable([<ore:craftingLensOrange>])
                .outputs([<contenttweaker:wiring_basic>*2])
                .duration(10*20)
                .EUt(120)
                .buildAndRegister();
    //etched Advanced Wiring
        <recipemap:chemical_reactor>.recipeBuilder()
            .inputs([<ore:foilGold>])
            .fluidInputs([<liquid:iron_iii_chloride>*500])
            .outputs([<contenttweaker:wiring_advanced>])
            .duration(5*20)
            .EUt(120)
            .buildAndRegister();
        <recipemap:chemical_reactor>.recipeBuilder()
            .inputs([<ore:foilGold>])
            .fluidInputs([<liquid:sodium_persulfate>*1000])
            .outputs([<contenttweaker:wiring_advanced>])
            .duration(5*20)
            .EUt(120)
            .buildAndRegister();
        <recipemap:laser_engraver>.recipeBuilder()
            .inputs([<ore:foilGold>])
            .notConsumable([<ore:craftingLensYellow>])
            .outputs([<contenttweaker:wiring_advanced>])
            .duration(10*20)
            .EUt(480)
            .buildAndRegister();
    //Etched Elite Wiring
        <recipemap:chemical_reactor>.recipeBuilder()
            .inputs([<ore:foilPlatinum>])
            .fluidInputs([<liquid:iron_iii_chloride>*1000])
            .outputs([<contenttweaker:wiring_elite>])
            .duration(5*20)
            .EUt(1920)
            .buildAndRegister();
        <recipemap:chemical_reactor>.recipeBuilder()
            .inputs([<ore:foilPlatinum>])
            .fluidInputs([<liquid:sodium_persulfate>*2000])
            .outputs([<contenttweaker:wiring_elite>])
            .duration(5*20)
            .EUt(1920)
            .buildAndRegister();
        <recipemap:laser_engraver>.recipeBuilder()
            .inputs([<ore:foilPlatinum>])
            .notConsumable([<ore:craftingLensWhite>])
            .outputs([<contenttweaker:wiring_elite>])
            .duration(10*20)
            .EUt(7680)
            .buildAndRegister();

//回路基板
    //coated Circuit Board
    //Phenolic Circuit Board
        <recipemap:assembler>.findRecipe(7, [<metaitem:dustWood>, <metaitem:foilCopper> * 2, <metaitem:shape.mold.plate>], [<liquid:glue> * 50]).remove();
    //Plastic Circuit Board
        <recipemap:chemical_reactor>.findRecipe(10, [<metaitem:platePolyvinylChloride>, <metaitem:foilCopper> * 4], [<liquid:sulfuric_acid> * 250]).remove();
        <recipemap:chemical_reactor>.findRecipe(10, [<metaitem:platePolybenzimidazole>, <metaitem:foilCopper> * 4], [<liquid:sulfuric_acid> * 250]).remove();
        <recipemap:chemical_reactor>.findRecipe(10, [<metaitem:platePolytetrafluoroethylene>, <metaitem:foilCopper> * 4], [<liquid:sulfuric_acid> * 250]).remove();
        <recipemap:chemical_reactor>.findRecipe(10, [<metaitem:platePlastic>, <metaitem:foilCopper> * 4], [<liquid:sulfuric_acid> * 250]).remove();
        <recipemap:large_chemical_reactor>.findRecipe(10, [<metaitem:platePolyvinylChloride>, <metaitem:foilCopper> * 4], [<liquid:sulfuric_acid> * 250]).remove();
        <recipemap:large_chemical_reactor>.findRecipe(10, [<metaitem:platePolybenzimidazole>, <metaitem:foilCopper> * 4], [<liquid:sulfuric_acid> * 250]).remove();
        <recipemap:large_chemical_reactor>.findRecipe(10, [<metaitem:platePolytetrafluoroethylene>, <metaitem:foilCopper> * 4], [<liquid:sulfuric_acid> * 250]).remove();
        <recipemap:large_chemical_reactor>.findRecipe(10, [<metaitem:platePlastic>, <metaitem:foilCopper> * 4], [<liquid:sulfuric_acid> * 250]).remove();
    //Epoxy Circuit Board
        <recipemap:chemical_reactor>.findRecipe(30, [<metaitem:plateEpoxy>, <metaitem:foilGold> * 8], [<liquid:sulfuric_acid> * 500]).remove();
        <recipemap:large_chemical_reactor>.findRecipe(30, [<metaitem:plateEpoxy>, <metaitem:foilGold> * 8], [<liquid:sulfuric_acid> * 500]).remove();
    //Fiber-Reinforced Circuit Board
        <recipemap:chemical_reactor>.findRecipe(10, [<metaitem:plateReinforcedEpoxyResin>, <metaitem:foilAnnealedCopper> * 8], [<liquid:sulfuric_acid> * 125]).remove();
        <recipemap:large_chemical_reactor>.findRecipe(10, [<metaitem:plateReinforcedEpoxyResin>, <metaitem:foilAnnealedCopper> * 8], [<liquid:sulfuric_acid> * 125]).remove();
    //Multi-layer Fiber-Reinforced Circuit Board
        <recipemap:chemical_reactor>.findRecipe(480, [<metaitem:board.fiber_reinforced> * 2, <metaitem:foilPlatinum> * 8], [<liquid:sulfuric_acid> * 500]).remove();
        <recipemap:large_chemical_reactor>.findRecipe(480, [<metaitem:board.fiber_reinforced> * 2, <metaitem:foilPlatinum> * 8], [<liquid:sulfuric_acid> * 500]).remove();
    //Wetware Lifesupport Circuit Board
    //Basic Circuit Board
        <recipemap:assembler>.findRecipe(7, [<metaitem:foilCopper> * 4, <metaitem:plateWood>], [<liquid:polytetrafluoroethylene> * 18]).remove();
        <recipemap:assembler>.findRecipe(7, [<metaitem:foilCopper> * 4, <metaitem:plateWood>], [<liquid:polybenzimidazole> * 9]).remove();
        <recipemap:assembler>.findRecipe(7, [<metaitem:foilCopper> * 4, <metaitem:plateWood>], [<liquid:epoxy> * 18]).remove();
        <recipemap:assembler>.findRecipe(7, [<metaitem:foilCopper> * 4, <metaitem:plateWood>], [<liquid:plastic> * 36]).remove();
        <recipemap:assembler>.findRecipe(7, [<metaitem:foilCopper> * 4, <metaitem:plateWood>], [<liquid:glue> * 100]).remove();
    //Good Circuit Board
        <recipemap:large_chemical_reactor>.findRecipe(30, [<metaitem:foilSilver> * 4, <metaitem:board.phenolic>], [<liquid:iron_iii_chloride> * 100]).remove();
        <recipemap:chemical_reactor>.findRecipe(30, [<metaitem:foilSilver> * 4, <metaitem:board.phenolic>], [<liquid:sodium_persulfate> * 200]).remove();
        <recipemap:chemical_reactor>.findRecipe(30, [<metaitem:foilSilver> * 4, <metaitem:board.phenolic>], [<liquid:iron_iii_chloride> * 100]).remove();
    //Plastic Circuit Board
        <recipemap:large_chemical_reactor>.findRecipe(30, [<metaitem:board.plastic>, <metaitem:foilCopper> * 6], [<liquid:iron_iii_chloride> * 250]).remove();
        <recipemap:large_chemical_reactor>.findRecipe(30, [<metaitem:board.plastic>, <metaitem:foilCopper> * 6], [<liquid:sodium_persulfate> * 500]).remove();
        <recipemap:chemical_reactor>.findRecipe(30, [<metaitem:board.plastic>, <metaitem:foilCopper> * 6], [<liquid:iron_iii_chloride> * 250]).remove();
        <recipemap:chemical_reactor>.findRecipe(30, [<metaitem:board.plastic>, <metaitem:foilCopper> * 6], [<liquid:sodium_persulfate> * 500]).remove();
    //Advanced Circuit Board
        <recipemap:large_chemical_reactor>.findRecipe(30, [<metaitem:board.epoxy>, <metaitem:foilElectrum> * 8], [<liquid:iron_iii_chloride> * 500]).remove();
        <recipemap:large_chemical_reactor>.findRecipe(30, [<metaitem:board.epoxy>, <metaitem:foilElectrum> * 8], [<liquid:sodium_persulfate> * 1000]).remove();
        <recipemap:chemical_reactor>.findRecipe(30, [<metaitem:board.epoxy>, <metaitem:foilElectrum> * 8], [<liquid:iron_iii_chloride> * 500]).remove();
        <recipemap:chemical_reactor>.findRecipe(30, [<metaitem:board.epoxy>, <metaitem:foilElectrum> * 8], [<liquid:sodium_persulfate> * 1000]).remove();
    //Extreme Circuit Board
        <recipemap:large_chemical_reactor>.findRecipe(30, [<metaitem:board.fiber_reinforced>, <metaitem:foilAnnealedCopper> * 12], [<liquid:iron_iii_chloride> * 1000]).remove();
        <recipemap:large_chemical_reactor>.findRecipe(30, [<metaitem:board.fiber_reinforced>, <metaitem:foilAnnealedCopper> * 12], [<liquid:sodium_persulfate> * 2000]).remove();
        <recipemap:chemical_reactor>.findRecipe(30, [<metaitem:board.fiber_reinforced>, <metaitem:foilAnnealedCopper> * 12], [<liquid:iron_iii_chloride> * 1000]).remove();
        <recipemap:chemical_reactor>.findRecipe(30, [<metaitem:board.fiber_reinforced>, <metaitem:foilAnnealedCopper> * 12], [<liquid:sodium_persulfate> * 2000]).remove();
    //Elite Circuit Board
        <recipemap:large_chemical_reactor>.findRecipe(120, [<metaitem:board.multilayer.fiber_reinforced>, <metaitem:foilPlatinum> * 8], [<liquid:iron_iii_chloride> * 2000]).remove();
        <recipemap:large_chemical_reactor>.findRecipe(120, [<metaitem:board.multilayer.fiber_reinforced>, <metaitem:foilPlatinum> * 8], [<liquid:sodium_persulfate> * 4000]).remove();
        <recipemap:chemical_reactor>.findRecipe(120, [<metaitem:board.multilayer.fiber_reinforced>, <metaitem:foilPlatinum> * 8], [<liquid:iron_iii_chloride> * 2000]).remove();
        <recipemap:chemical_reactor>.findRecipe(120, [<metaitem:board.multilayer.fiber_reinforced>, <metaitem:foilPlatinum> * 8], [<liquid:sodium_persulfate> * 4000]).remove();
    //Master Circuit Board
        <recipemap:large_chemical_reactor>.findRecipe(480, [<metaitem:board.wetware>, <metaitem:foilNiobiumTitanium> * 32], [<liquid:iron_iii_chloride> * 5000]).remove();
        <recipemap:large_chemical_reactor>.findRecipe(480, [<metaitem:board.wetware>, <metaitem:foilNiobiumTitanium> * 32], [<liquid:sodium_persulfate> * 10000]).remove();
        <recipemap:chemical_reactor>.findRecipe(480, [<metaitem:board.wetware>, <metaitem:foilNiobiumTitanium> * 32], [<liquid:iron_iii_chloride> * 5000]).remove();
        <recipemap:chemical_reactor>.findRecipe(480, [<metaitem:board.wetware>, <metaitem:foilNiobiumTitanium> * 32], [<liquid:sodium_persulfate> * 10000]).remove();

    //Basic cirucit Board
        <recipemap:forming_press>.recipeBuilder()
            .inputs([<ore:plateTreatedWood>*2, <contenttweaker:wiring_basic>*2, <metaitem:wireFineTin>*8])
            .outputs([<contenttweaker:circuit_board_basic>])
            .duration(5*20)
            .EUt(16)
            .buildAndRegister();
        <recipemap:forming_press>.recipeBuilder()
            .inputs([<ore:platePlastic>, <contenttweaker:wiring_basic>*2, <metaitem:wireFineTin>*8])
            .outputs([<contenttweaker:circuit_board_basic>*2])
            .duration(5*20)
            .EUt(16)
            .buildAndRegister();
        <recipemap:forming_press>.recipeBuilder()
            .inputs([<ore:platePolyvinylChloride>, <contenttweaker:wiring_basic>*2, <metaitem:wireFineTin>*8])
            .outputs([<contenttweaker:circuit_board_basic>*2])
            .duration(5*20)
            .EUt(16)
            .buildAndRegister();
    //Advanced Circuit Board
        <recipemap:forming_press>.recipeBuilder()
            .inputs([<ore:platePlastic>, <contenttweaker:wiring_advanced>*2, <metaitem:wireFineSilver>*8])
            .outputs([<contenttweaker:circuit_board_advanced>])
            .duration(5*20)
            .EUt(60)
            .buildAndRegister();
        <recipemap:forming_press>.recipeBuilder()
            .inputs([<ore:platePolyvinylChloride>, <contenttweaker:wiring_advanced>*2, <metaitem:wireFineSilver>*8])
            .outputs([<contenttweaker:circuit_board_advanced>*2])
            .duration(5*20)
            .EUt(606)
            .buildAndRegister();
        <recipemap:forming_press>.recipeBuilder()
            .inputs([<ore:platePolytetrafluoroethylene>, <contenttweaker:wiring_advanced>*2, <metaitem:wireFineSilver>*8])
            .outputs([<contenttweaker:circuit_board_advanced>*4])
            .duration(5*20)
            .EUt(60)
            .buildAndRegister();
        <recipemap:forming_press>.recipeBuilder()
            .inputs([<ore:platePolybenzimidazole>, <contenttweaker:wiring_advanced>*2, <metaitem:wireFineSilver>*8])
            .outputs([<contenttweaker:circuit_board_advanced>*8])
            .duration(5*20)
            .EUt(60)
            .buildAndRegister();
    //Elite Circuit Board
        <recipemap:forming_press>.recipeBuilder()
            .inputs([<ore:plateEpoxy>*2, <contenttweaker:wiring_elite>*2, <metaitem:wireFinePlatinum>*8])
            .outputs([<contenttweaker:circuit_board_elite>])
            .duration(5*20)
            .EUt(1920)
            .buildAndRegister();
        <recipemap:forming_press>.recipeBuilder()
            .inputs([<ore:plateReinforcedEpoxyResin>*2, <contenttweaker:wiring_elite>*2, <metaitem:wireFinePlatinum>*8])
            .outputs([<contenttweaker:circuit_board_elite>*2])
            .duration(5*20)
            .EUt(1920)
            .buildAndRegister();
        <recipemap:forming_press>.recipeBuilder()
            .inputs([<ore:platePolybenzimidazole>, <contenttweaker:wiring_elite>*2, <metaitem:wireFinePlatinum>*8])
            .outputs([<contenttweaker:circuit_board_elite>*4])
            .duration(5*20)
            .EUt(1920)
            .buildAndRegister();

//回路
    //NAND Chip
        RecipeBuilder.get("basic")
            .setShaped(RecipePattern.init(["AB", "BC"]).map({A:<ore:plateTin>, B:<ore:wireGtSingleRedAlloy>, C:<ore:wireGtSingleLead>}).ingredients)
            .setFluid(<liquid:tin>*72)
            .addTool(<ore:artisansSolderer>, 1)
            .addTool(<ore:GT.tool.wirecutter>, 1)
            .addOutput(<metaitem:circuit.nand_chip>)
            .create();
        RecipeBuilder.get("basic")
            .setShaped(RecipePattern.init(["AB", "BC"]).map({A:<ore:plateTin>, B:<ore:wireGtSingleRedAlloy>, C:<ore:wireGtSingleLead>}).ingredients)
            .setFluid(<liquid:soldering_alloy>*36)
            .addTool(<ore:artisansSolderer>, 1)
            .addTool(<ore:GT.tool.wirecutter>, 1)
            .addOutput(<metaitem:circuit.nand_chip>)
            .create();
        <recipemap:circuit_assembler>.findRecipe(120, [<metaitem:circuit_board.good>, <metaitem:plate.simple_system_on_chip>, <metaitem:boltRedAlloy> * 2, <metaitem:wireFineTin> * 2], [<liquid:tin> * 144]).remove();
        <recipemap:circuit_assembler>.findRecipe(120, [<metaitem:circuit_board.good>, <metaitem:plate.simple_system_on_chip>, <metaitem:boltRedAlloy> * 2, <metaitem:wireFineTin> * 2], [<liquid:soldering_alloy> * 72]).remove();
        <recipemap:circuit_assembler>.findRecipe(120, [<metaitem:circuit_board.plastic>, <metaitem:plate.simple_system_on_chip>, <metaitem:boltRedAlloy> * 2, <metaitem:wireFineTin> * 2], [<liquid:tin> * 144]).remove();
        <recipemap:circuit_assembler>.findRecipe(120, [<metaitem:circuit_board.plastic>, <metaitem:plate.simple_system_on_chip>, <metaitem:boltRedAlloy> * 2, <metaitem:wireFineTin> * 2], [<liquid:soldering_alloy> * 72]).remove();
        //Molten Tin
            <recipemap:circuit_assembler>.recipeBuilder()
                .inputs([<ore:plateTin>, <ore:wireFineRedAlloy>*4, <ore:wireFineLead>*2])
                .fluidInputs([<liquid:tin>*72])
                .outputs([<metaitem:circuit.nand_chip>*2])
                .duration(2*20)
                .EUt(7)
                .buildAndRegister();
            <recipemap:circuit_assembler>.recipeBuilder()
                .inputs([<ore:plateTin>, <metaitem:plate.nand_memory_chip>, <ore:wireFineLead>*2])
                .fluidInputs([<liquid:tin>*72])
                .outputs([<metaitem:circuit.nand_chip>*8])
                .duration(2*20)
                .EUt(7)
                .buildAndRegister();
        //Molten Soldering Alloy
            <recipemap:circuit_assembler>.recipeBuilder()
                .inputs([<ore:plateTin>, <ore:wireFineRedAlloy>*4, <ore:wireFineLead>*2])
                .fluidInputs([<liquid:soldering_alloy>*36])
                .outputs([<metaitem:circuit.nand_chip>*2])
                .duration(2*20)
                .EUt(7)
                .buildAndRegister();
            <recipemap:circuit_assembler>.recipeBuilder()
                .inputs([<ore:plateTin>, <metaitem:plate.nand_memory_chip>, <ore:wireFineLead>*2])
                .fluidInputs([<liquid:soldering_alloy>*36])
                .outputs([<metaitem:circuit.nand_chip>*8])
                .duration(2*20)
                .EUt(7)
                .buildAndRegister();

    //Electronic Circuit
        //Molten Tin
            RecipeBuilder.get("basic")
                .setShaped(RecipePattern.init(["AAA", "BCB", "AAA"]).map({A:<ore:cableGtSingleCopper>, B:<ore:circuitPrimitive>, C:<ore:plateSteel>}).ingredients)
                .setFluid(<liquid:tin>*144)
                .addTool(<ore:artisansSolderer>, 2)
                .addTool(<ore:GT.tool.wirecutter>, 2)
                .addOutput(<metaitem:circuit.electronic>)
                .create();
            RecipeBuilder.get("basic")
                .setShaped(RecipePattern.init(["AAA", "BCB", "AAA"]).map({A:<ore:cableGtSingleCopper>, B:<ore:circuitPrimitive>, C:<ore:plateSteel>}).ingredients)
                .setSecondaryIngredients([<metaitem:component.resistor>*4])
                .setFluid(<liquid:tin>*144)
                .addTool(<ore:artisansSolderer>, 2)
                .addTool(<ore:GT.tool.wirecutter>, 2)
                .addOutput(<metaitem:circuit.electronic>*2)
                .create();
        //Molten Soldering Alloy
            RecipeBuilder.get("basic")
                .setShaped(RecipePattern.init(["AAA", "BCB", "AAA"]).map({A:<ore:cableGtSingleCopper>, B:<ore:circuitPrimitive>, C:<ore:plateSteel>}).ingredients)
                .setFluid(<liquid:soldering_alloy>*72)
                .addTool(<ore:artisansSolderer>, 2)
                .addTool(<ore:GT.tool.wirecutter>, 2)
                .addOutput(<metaitem:circuit.electronic>)
                .create();
            RecipeBuilder.get("basic")
                .setShaped(RecipePattern.init(["AAA", "BCB", "AAA"]).map({A:<ore:cableGtSingleCopper>, B:<ore:circuitPrimitive>, C:<ore:plateSteel>}).ingredients)
                .setSecondaryIngredients([<metaitem:component.resistor>*4])
                .setFluid(<liquid:soldering_alloy>*72)
                .addTool(<ore:artisansSolderer>, 2)
                .addTool(<ore:GT.tool.wirecutter>, 2)
                .addOutput(<metaitem:circuit.electronic>*2)
                .create();
        <recipemap:circuit_assembler>.findRecipe(16, [<metaitem:circuit_board.basic>, <metaitem:component.resistor> * 2, <metaitem:wireGtSingleRedAlloy> * 2, <metaitem:circuit.vacuum_tube> * 2], [<liquid:tin> * 144]).remove();
        <recipemap:circuit_assembler>.findRecipe(16, [<metaitem:circuit_board.basic>, <metaitem:component.resistor> * 2, <metaitem:wireGtSingleRedAlloy> * 2, <metaitem:circuit.vacuum_tube> * 2], [<liquid:soldering_alloy> * 72]).remove();
        //Molten tin
            //#ULV Circuit
                <recipemap:circuit_assembler>.recipeBuilder()
                    .inputs([<contenttweaker:circuit_board_basic>, <ore:wireFineCopper>*12, <ore:circuitPrimitive>])
                    .fluidInputs([<liquid:tin>*144])
                    .outputs([<metaitem:circuit.electronic>])
                    .duration(10*20)
                    .EUt(16)
                    .buildAndRegister();
                <recipemap:circuit_assembler>.recipeBuilder()
                    .inputs([<contenttweaker:circuit_board_basic>, <ore:wireFineCopper>*12, <ore:circuitPrimitive>, <ore:componentResistor>*2])
                    .fluidInputs([<liquid:tin>*144])
                    .outputs([<metaitem:circuit.electronic>*2])
                    .duration(10*20)
                    .EUt(16)
                    .buildAndRegister();
            //#NAND Chip
                <recipemap:circuit_assembler>.recipeBuilder()
                    .inputs([<contenttweaker:circuit_board_basic>, <ore:wireFineCopper>*6, <metaitem:plate.nand_memory_chip>])
                    .fluidInputs([<liquid:tin>*144])
                    .outputs([<metaitem:circuit.electronic>])
                    .duration(10*20)
                    .EUt(16)
                    .buildAndRegister();
                <recipemap:circuit_assembler>.recipeBuilder()
                    .inputs([<contenttweaker:circuit_board_basic>, <ore:wireFineCopper>*6, <metaitem:plate.nand_memory_chip>, <ore:componentResistor>*2])
                    .fluidInputs([<liquid:tin>*144])
                    .outputs([<metaitem:circuit.electronic>*2])
                    .duration(10*20)
                    .EUt(16)
                    .buildAndRegister();
        //Molten Soldering Alloy
            //#ULV Circuit
                <recipemap:circuit_assembler>.recipeBuilder()
                    .inputs([<contenttweaker:circuit_board_basic>, <ore:wireFineCopper>*12, <ore:circuitPrimitive>])
                    .fluidInputs([<liquid:soldering_alloy>*72])
                    .outputs([<metaitem:circuit.electronic>])
                    .duration(10*20)
                    .EUt(16)
                    .buildAndRegister();
                <recipemap:circuit_assembler>.recipeBuilder()
                    .inputs([<contenttweaker:circuit_board_basic>, <ore:wireFineCopper>*12, <ore:circuitPrimitive>, <ore:componentResistor>*2])
                    .fluidInputs([<liquid:soldering_alloy>*72])
                    .outputs([<metaitem:circuit.electronic>*2])
                    .duration(10*20)
                    .EUt(16)
                    .buildAndRegister();
            //#NAND Chip
                <recipemap:circuit_assembler>.recipeBuilder()
                    .inputs([<contenttweaker:circuit_board_basic>, <ore:wireFineCopper>*6, <metaitem:plate.nand_memory_chip>])
                    .fluidInputs([<liquid:soldering_alloy>*72])
                    .outputs([<metaitem:circuit.electronic>])
                    .duration(10*20)
                    .EUt(16)
                    .buildAndRegister();
                <recipemap:circuit_assembler>.recipeBuilder()
                    .inputs([<contenttweaker:circuit_board_basic>, <ore:wireFineCopper>*6, <metaitem:plate.nand_memory_chip>, <ore:componentResistor>*2])
                    .fluidInputs([<liquid:soldering_alloy>*72])
                    .outputs([<metaitem:circuit.electronic>*2])
                    .duration(10*20)
                    .EUt(16)
                    .buildAndRegister();

    //Good Electronic Circuit
        //Molten Tin
            RecipeBuilder.get("basic")
                .setShaped(RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:cableGtSingleGold>, B:<ore:circuitBasic>, C:<ore:plateDoubleSteel>}).ingredients)
                .setFluid(<liquid:tin>*576)
                .addTool(<ore:artisansSolderer>, 5)
                .addTool(<ore:GT.tool.wirecutter>, 5)
                .addOutput(<metaitem:circuit.good_electronic>)
                .create();
            RecipeBuilder.get("basic")
                .setShaped(RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:cableGtSingleGold>, B:<ore:circuitBasic>, C:<ore:plateDoubleSteel>}).ingredients)
                .setSecondaryIngredients([<metaitem:component.diode>*4])
                .setFluid(<liquid:tin>*576)
                .addTool(<ore:artisansSolderer>, 5)
                .addTool(<ore:GT.tool.wirecutter>, 5)
                .addOutput(<metaitem:circuit.good_electronic>*2)
                .create();
        //Molten Soldering Alloy
            RecipeBuilder.get("basic")
                .setShaped(RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:cableGtSingleGold>, B:<ore:circuitBasic>, C:<ore:plateDoubleSteel>}).ingredients)
                .setFluid(<liquid:tin>*576)
                .addTool(<ore:artisansSolderer>, 5)
                .addTool(<ore:GT.tool.wirecutter>, 5)
                .addOutput(<metaitem:circuit.good_electronic>)
                .create();
            RecipeBuilder.get("basic")
                .setShaped(RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:cableGtSingleGold>, B:<ore:circuitBasic>, C:<ore:plateDoubleSteel>}).ingredients)
                .setSecondaryIngredients([<metaitem:component.diode>*4])
                .setFluid(<liquid:tin>*576)
                .addTool(<ore:artisansSolderer>, 5)
                .addTool(<ore:GT.tool.wirecutter>, 5)
                .addOutput(<metaitem:circuit.good_electronic>*2)
                .create();
        <recipemap:circuit_assembler>.findRecipe(30, [<metaitem:circuit_board.good>, <metaitem:circuit.electronic> * 2, <metaitem:component.diode> * 2, <metaitem:wireGtSingleCopper> * 2], [<liquid:tin> * 144]).remove();
        <recipemap:circuit_assembler>.findRecipe(30, [<metaitem:circuit_board.good>, <metaitem:circuit.electronic> * 2, <metaitem:component.diode> * 2, <metaitem:wireGtSingleCopper> * 2], [<liquid:soldering_alloy> * 72]).remove();
        <recipemap:circuit_assembler>.recipeBuilder()
            .inputs([<ore:circuitBasic>, <ore:wireFineGold>*8, <ore:plateSteel>])
            .fluidInputs([<liquid:tin>*288])
            .outputs([<metaitem:circuit.good_electronic>])
            .duration(10*20)
            .EUt(60)
            .buildAndRegister();
        <recipemap:circuit_assembler>.recipeBuilder()
            .inputs([<ore:circuitBasic>, <ore:wireFineGold>*8, <ore:plateSteel>])
            .fluidInputs([<liquid:soldering_alloy>*144])
            .outputs([<metaitem:circuit.good_electronic>])
            .duration(10*20)
            .EUt(60)
            .buildAndRegister();

    //Integrated Processor
        <recipemap:circuit_assembler>.findRecipe(2400, [<metaitem:circuit_board.plastic>, <metaitem:plate.system_on_chip>, <metaitem:wireFineRedAlloy> * 4, <metaitem:boltAnnealedCopper> * 4], [<liquid:tin> * 144]).remove();
        <recipemap:circuit_assembler>.findRecipe(2400, [<metaitem:circuit_board.plastic>, <metaitem:plate.system_on_chip>, <metaitem:wireFineRedAlloy> * 4, <metaitem:boltAnnealedCopper> * 4], [<liquid:soldering_alloy> * 72]).remove();
        //<recipemap:circuit_assembler>.findRecipe(60, [<metaitem:circuit_board.plastic>, <metaitem:plate.central_processing_unit>, <ore:componentResistor> * 4, <metaitem:component.capacitor> * 4, <metaitem:component.transistor> * 4, <metaitem:wireFineRedAlloy> * 4], [<liquid:tin> * 144]).remove();
        //<recipemap:circuit_assembler>.findRecipe(60, [<metaitem:circuit_board.plastic>, <metaitem:plate.central_processing_unit>, <ore:componentResistor> * 4, <metaitem:component.capacitor> * 4, <metaitem:component.transistor> * 4, <metaitem:wireFineRedAlloy> * 4], [<liquid:soldering_alloy> * 72]).remove();
        <recipemap:circuit_assembler>.recipeBuilder()
            .inputs([<contenttweaker:circuit_board_advanced>, <ore:wireFineRedAlloy>*4, <metaitem:plate.integrated_logic_circuit>, <ore:componentTransistor>*4, <ore:componentResistor>*4, <ore:componentDiode>*4])
            .fluidInputs([<liquid:tin>*144])
            .outputs([<metaitem:circuit.processor>])
            .duration(10*20)
            .EUt(60)
            .buildAndRegister();
        <recipemap:circuit_assembler>.recipeBuilder()
            .inputs([<contenttweaker:circuit_board_advanced>, <ore:wireFineRedAlloy>*4, <metaitem:plate.integrated_logic_circuit>, <ore:componentTransistor>*4, <ore:componentResistor>*4, <ore:componentDiode>*4])
            .fluidInputs([<liquid:soldering_alloy>*72])
            .outputs([<metaitem:circuit.processor>])
            .duration(10*20)
            .EUt(60)
            .buildAndRegister();

//Advanced Integrated Processor
    <recipemap:circuit_assembler>.findRecipe(30, [<metaitem:circuit.good_integrated> * 2, <metaitem:plate.integrated_logic_circuit> * 2, <metaitem:plate.random_access_memory> * 2, <metaitem:component.smd.transistor> * 4, <metaitem:wireFineElectrum> * 8, <metaitem:boltAnnealedCopper> * 8], [<liquid:tin> * 144]).remove();
    <recipemap:circuit_assembler>.findRecipe(30, [<metaitem:circuit.good_integrated> * 2, <metaitem:plate.integrated_logic_circuit> * 2, <metaitem:plate.random_access_memory> * 2, <metaitem:component.smd.transistor> * 4, <metaitem:wireFineElectrum> * 8, <metaitem:boltAnnealedCopper> * 8], [<liquid:soldering_alloy> * 72]).remove();
    <recipemap:circuit_assembler>.recipeBuilder()
        .inputs([<metaitem:circuit.processor>*4, <metaitem:plate.integrated_logic_circuit>, <metaitem:plate.random_access_memory>, <ore:componentCapacitor>*4, <ore:componentDiode>*4, <ore:wireFineElectrum>*8])
        .fluidInputs([<liquid:tin>*144])
        .outputs([<metaitem:circuit.advanced_integrated>])
        .duration(20*20)
        .EUt(60)
        .buildAndRegister();
    <recipemap:circuit_assembler>.recipeBuilder()
        .inputs([<metaitem:circuit.processor>*4, <metaitem:plate.integrated_logic_circuit>, <metaitem:plate.random_access_memory>, <ore:componentCapacitor>*4, <ore:componentDiode>*4, <ore:wireFineElectrum>*8])
        .fluidInputs([<liquid:soldering_alloy>*72])
        .outputs([<metaitem:circuit.advanced_integrated>])
        .duration(20*20)
        .EUt(60)
        .buildAndRegister();

#このscriptの読み込みの完了をログに出力
print("gt-circuit.zs loaded!");
