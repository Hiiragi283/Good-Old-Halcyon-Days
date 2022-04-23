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

val removeFromJEI as IItemStack[] = [
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
    <metaitem:component.capacitor>,
    <metaitem:component.inductor>,
    <metaitem:circuit.basic_integrated>,
    <metaitem:circuit.good_integrated>,
    <metaitem:circuit.assembly>,
    <metaitem:circuit.mainframe>,
    <metaitem:circuit.nano_processor>,
    <metaitem:circuit.nano_assembly>,
    <metaitem:circuit.nano_computer>,
    <metaitem:circuit.nano_mainframe>,
    <metaitem:circuit.quantum_assembly>,
    <metaitem:circuit.quantum_computer>,
    <metaitem:circuit.quantum_mainframe>,
    <metaitem:circuit.crystal_assembly>,
    <metaitem:circuit.crystal_computer>,
    <metaitem:circuit.crystal_mainframe>
];
for i in removeFromJEI {
    //HiiragiUtils.removeFromJEI(i);
    //HiiragiUtils.removeOreDict(i);
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
        <recipemap:assembler>.findRecipe(120, [<metaitem:ringSteel>, <metaitem:wireFineCopper> * 2], [<liquid:plastic> * 36]).remove();
        <recipemap:assembler>.findRecipe(120, [<metaitem:ringNickelZincFerrite>, <metaitem:wireFineAnnealedCopper> * 2], [<liquid:plastic> * 36]).remove();
        <recipemap:assembler>.findRecipe(120, [<metaitem:ringSteel>, <metaitem:wireFineAnnealedCopper> * 2], [<liquid:plastic> * 36]).remove();
        <recipemap:assembler>.findRecipe(120, [<metaitem:ringNickelZincFerrite>, <metaitem:wireFineCopper> * 2], [<liquid:plastic> * 36]).remove();

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
            .EUt(480)
            .buildAndRegister();
        <recipemap:chemical_reactor>.recipeBuilder()
            .inputs([<ore:foilPlatinum>])
            .fluidInputs([<liquid:sodium_persulfate>*2000])
            .outputs([<contenttweaker:wiring_elite>])
            .duration(5*20)
            .EUt(480)
            .buildAndRegister();
        <recipemap:laser_engraver>.recipeBuilder()
            .inputs([<ore:foilPlatinum>])
            .notConsumable([<ore:craftingLensWhite>])
            .outputs([<contenttweaker:wiring_elite>])
            .duration(10*20)
            .EUt(1920)
            .buildAndRegister();

    //NOR Chip
        <recipemap:circuit_assembler>.findRecipe(600, [<metaitem:circuit_board.plastic>, <metaitem:plate.system_on_chip>, <metaitem:wireFineCopper> * 2, <metaitem:boltTin> * 2], [<liquid:tin> * 144]).remove();
        <recipemap:circuit_assembler>.findRecipe(600, [<metaitem:circuit_board.plastic>, <metaitem:plate.system_on_chip>, <metaitem:wireFineCopper> * 2, <metaitem:boltTin> * 2], [<liquid:soldering_alloy> * 72]).remove();
        //Fine Copper Wire
            //Polyethylene plate
                <recipemap:forming_press>.recipeBuilder()
                    .inputs([<ore:wireFineCopper>*2, <ore:dustElectrotine>, <ore:platePlastic>])
                    .outputs([<metaitem:circuit.microprocessor>])
                    .duration(5*20)
                    .EUt(60)
                    .buildAndRegister();
            //Silicone Plate
                <recipemap:forming_press>.recipeBuilder()
                    .inputs([<ore:wireFineCopper>*2, <ore:dustElectrotine>, <ore:plateSilicon>])
                    .outputs([<metaitem:circuit.microprocessor>*2])
                    .duration(5*20)
                    .EUt(60)
                    .buildAndRegister();
        //Fine Annealed Copper Wire
            //Polyethylene plate
                <recipemap:forming_press>.recipeBuilder()
                    .inputs([<ore:wireFineAnnealedCopper>*2, <ore:dustElectrotine>, <ore:platePlastic>])
                    .outputs([<metaitem:circuit.microprocessor>*2])
                    .duration(5*20)
                    .EUt(60)
                    .buildAndRegister();
            //Silicon Plate
                <recipemap:forming_press>.recipeBuilder()
                    .inputs([<ore:wireFineAnnealedCopper>*2, <ore:dustElectrotine>, <ore:plateSilicon>])
                    .outputs([<metaitem:circuit.microprocessor>*4])
                    .duration(5*20)
                    .EUt(60)
                    .buildAndRegister();

//Raw Crystal Chip
    <recipemap:autoclave>.findRecipe(320, [<metaitem:gemExquisiteEmerald>], [<liquid:europium> * 16]).remove();
    <recipemap:autoclave>.findRecipe(320, [<metaitem:gemExquisiteOlivine>], [<liquid:europium> * 16]).remove();
    <recipemap:autoclave>.findRecipe(480, [<metaitem:crystal.raw_chip>], [<liquid:mutagen> * 250]).remove();
    <recipemap:autoclave>.findRecipe(480, [<metaitem:crystal.raw_chip>], [<liquid:bacterial_sludge> * 250]).remove();
    <recipemap:autoclave>.findRecipe(480, [<metaitem:crystal.raw_chip>], [<liquid:europium> * 16]).remove();

//Raw Crystal Chip Parts
    <recipemap:forge_hammer>.findRecipe(480, [<metaitem:crystal.raw>], null).remove();

//Data Crystal Chip
    <recipemap:electric_blast_furnace>.findRecipe(480, [<metaitem:plateOlivine>, <metaitem:crystal.raw>], [<liquid:helium> * 1000]).remove();
    <recipemap:electric_blast_furnace>.findRecipe(480, [<metaitem:plateEmerald>, <metaitem:crystal.raw>], [<liquid:helium> * 1000]).remove();
    //Emerald Plate
        <recipemap:laser_engraver>.recipeBuilder()
            .inputs([<ore:plateEmerald>])
            .notConsumable([<ore:craftingLensGreen>])
            .outputs([<metaitem:engraved.crystal_chip>])
            .duration(5*20)
            .EUt(480)
            .buildAndRegister();
    //Green Sapphire Plate
        <recipemap:laser_engraver>.recipeBuilder()
            .inputs([<ore:plateGreenSapphire>])
            .notConsumable([<ore:craftingLensGreen>])
            .outputs([<metaitem:engraved.crystal_chip>])
            .duration(5*20)
            .EUt(480)
            .buildAndRegister();
    //Olivine Plate
        <recipemap:laser_engraver>.recipeBuilder()
            .inputs([<ore:plateOlivine>])
            .notConsumable([<ore:craftingLensGreen>])
            .outputs([<metaitem:engraved.crystal_chip>])
            .duration(5*20)
            .EUt(480)
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
            <recipemap:circuit_assembler>.recipeBuilder()
                .inputs([<ore:plateTin>, <ore:wireFineRedAlloy>*2, <ore:wireFineLead>*2])
                .fluidInputs([<liquid:tin>*72])
                .outputs([<metaitem:circuit.nand_chip>*2])
                .duration(5*20)
                .EUt(7)
                .buildAndRegister();
            <recipemap:circuit_assembler>.recipeBuilder()
                .inputs([<ore:plateTin>, <ore:wireFineRedAlloy>*2, <ore:wireFineLead>*2])
                .fluidInputs([<liquid:soldering_alloy>*36])
                .outputs([<metaitem:circuit.nand_chip>*2])
                .duration(5*20)
                .EUt(7)
                .buildAndRegister();

    //Electronic Circuit
            RecipeBuilder.get("basic")
                .setShaped(RecipePattern.init(["AAA", "BCB", "AAA"]).map({A:<ore:cableGtSingleTin>, B:<metaitem:circuit.nand_chip>, C:<ore:plateSteel>}).ingredients)
                .setFluid(<liquid:tin>*144)
                .addTool(<ore:artisansSolderer>, 2)
                .addTool(<ore:GT.tool.wirecutter>, 2)
                .addOutput(<metaitem:circuit.electronic>)
                .create();
            RecipeBuilder.get("basic")
                .setShaped(RecipePattern.init(["ABA", "ACA", "ABA"]).map({A:<ore:cableGtSingleTin>, B:<metaitem:circuit.nand_chip>, C:<ore:plateSteel>}).ingredients)
                .setFluid(<liquid:tin>*144)
                .addTool(<ore:artisansSolderer>, 2)
                .addTool(<ore:GT.tool.wirecutter>, 2)
                .addOutput(<metaitem:circuit.electronic>)
                .create();
            RecipeBuilder.get("basic")
                .setShaped(RecipePattern.init(["AAA", "BCB", "AAA"]).map({A:<ore:cableGtSingleTin>, B:<metaitem:circuit.nand_chip>, C:<ore:plateSteel>}).ingredients)
                .setFluid(<liquid:soldering_alloy>*72)
                .addTool(<ore:artisansSolderer>, 2)
                .addTool(<ore:GT.tool.wirecutter>, 2)
                .addOutput(<metaitem:circuit.electronic>)
                .create();
            RecipeBuilder.get("basic")
                .setShaped(RecipePattern.init(["ABA", "ACA", "ABA"]).map({A:<ore:cableGtSingleTin>, B:<metaitem:circuit.nand_chip>, C:<ore:plateSteel>}).ingredients)
                .setFluid(<liquid:soldering_alloy>*72)
                .addTool(<ore:artisansSolderer>, 2)
                .addTool(<ore:GT.tool.wirecutter>, 2)
                .addOutput(<metaitem:circuit.electronic>)
                .create();
        <recipemap:circuit_assembler>.findRecipe(16, [<metaitem:circuit_board.basic>, <metaitem:component.resistor> * 2, <metaitem:wireGtSingleRedAlloy> * 2, <metaitem:circuit.vacuum_tube> * 2], [<liquid:tin> * 144]).remove();
        <recipemap:circuit_assembler>.findRecipe(16, [<metaitem:circuit_board.basic>, <metaitem:component.resistor> * 2, <metaitem:wireGtSingleRedAlloy> * 2, <metaitem:circuit.vacuum_tube> * 2], [<liquid:soldering_alloy> * 72]).remove();
            //NAND Chip
                <recipemap:circuit_assembler>.recipeBuilder()
                    .inputs([<contenttweaker:circuit_board_basic>, <metaitem:circuit.nand_chip>, <ore:wireFineTin>*2])
                    .fluidInputs([<liquid:tin>*144])
                    .outputs([<metaitem:circuit.electronic>])
                    .duration(10*20)
                    .EUt(16)
                    .buildAndRegister();
                <recipemap:circuit_assembler>.recipeBuilder()
                    .inputs([<contenttweaker:circuit_board_basic>, <metaitem:circuit.nand_chip>, <ore:wireFineTin>*2])
                    .fluidInputs([<liquid:soldering_alloy>*72])
                    .outputs([<metaitem:circuit.electronic>])
                    .duration(10*20)
                    .EUt(16)
                    .buildAndRegister();
            //NAND Memory Chip
                <recipemap:circuit_assembler>.recipeBuilder()
                    .inputs([<contenttweaker:circuit_board_basic>, <metaitem:plate.nand_memory_chip>, <ore:wireFineTin>*2])
                    .fluidInputs([<liquid:tin>*144])
                    .outputs([<metaitem:circuit.electronic>])
                    .duration(10*20)
                    .EUt(16)
                    .buildAndRegister();
                <recipemap:circuit_assembler>.recipeBuilder()
                    .inputs([<contenttweaker:circuit_board_basic>, <metaitem:plate.nand_memory_chip>, <ore:wireFineTin>*2])
                    .fluidInputs([<liquid:soldering_alloy>*72])
                    .outputs([<metaitem:circuit.electronic>])
                    .duration(10*20)
                    .EUt(16)
                    .buildAndRegister();

    //Integrated Logic Circuit

    //Good Integrated Circuit

    //Good Electronic Circuit
            RecipeBuilder.get("basic")
                .setShaped(RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:cableGtSingleCopper>, B:<ore:circuitLv>, C:<ore:plateDoubleSteel>}).ingredients)
                .setFluid(<liquid:tin>*576)
                .addTool(<ore:artisansSolderer>, 5)
                .addTool(<ore:GT.tool.wirecutter>, 5)
                .addOutput(<metaitem:circuit.good_electronic>)
                .create();
            RecipeBuilder.get("basic")
                .setShaped(RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:cableGtSingleCopper>, B:<ore:circuitLv>, C:<ore:plateDoubleSteel>}).ingredients)
                .setFluid(<liquid:soldering_alloy>*288)
                .addTool(<ore:artisansSolderer>, 5)
                .addTool(<ore:GT.tool.wirecutter>, 5)
                .addOutput(<metaitem:circuit.good_electronic>)
                .create();
        <recipemap:circuit_assembler>.findRecipe(30, [<metaitem:circuit_board.good>, <metaitem:circuit.electronic> * 2, <metaitem:component.diode> * 2, <metaitem:wireGtSingleCopper> * 2], [<liquid:tin> * 144]).remove();
        <recipemap:circuit_assembler>.findRecipe(30, [<metaitem:circuit_board.good>, <metaitem:circuit.electronic> * 2, <metaitem:component.diode> * 2, <metaitem:wireGtSingleCopper> * 2], [<liquid:soldering_alloy> * 72]).remove();
        <recipemap:circuit_assembler>.recipeBuilder()
            .inputs([<ore:circuitLv>, <ore:plateSteel>, <ore:wireFineRedAlloy>*4])
            .fluidInputs([<liquid:tin>*288])
            .outputs([<metaitem:circuit.good_electronic>])
            .duration(10*20)
            .EUt(60)
            .buildAndRegister();
        <recipemap:circuit_assembler>.recipeBuilder()
            .inputs([<ore:circuitLv>, <ore:plateSteel>, <ore:wireFineRedAlloy>*4])
            .fluidInputs([<liquid:soldering_alloy>*144])
            .outputs([<metaitem:circuit.good_electronic>])
            .duration(10*20)
            .EUt(60)
            .buildAndRegister();

    //Integrated Processor
        <recipemap:circuit_assembler>.findRecipe(2400, [<metaitem:circuit_board.plastic>, <metaitem:plate.system_on_chip>, <metaitem:wireFineRedAlloy> * 4, <metaitem:boltAnnealedCopper> * 4], [<liquid:tin> * 144]).remove();
        <recipemap:circuit_assembler>.findRecipe(2400, [<metaitem:circuit_board.plastic>, <metaitem:plate.system_on_chip>, <metaitem:wireFineRedAlloy> * 4, <metaitem:boltAnnealedCopper> * 4], [<liquid:soldering_alloy> * 72]).remove();
        //Microprocessor
        <recipemap:circuit_assembler>.recipeBuilder()
            .inputs([<contenttweaker:circuit_board_advanced>, <metaitem:circuit.microprocessor>*2, <ore:wireFineCopper>*4])
            .fluidInputs([<liquid:tin>*144])
            .outputs([<metaitem:circuit.processor>])
            .duration(10*20)
            .EUt(60)
            .buildAndRegister();
        <recipemap:circuit_assembler>.recipeBuilder()
            .inputs([<contenttweaker:circuit_board_advanced>, <metaitem:circuit.microprocessor>*2, <ore:wireFineCopper>*4])
            .fluidInputs([<liquid:soldering_alloy>*72])
            .outputs([<metaitem:circuit.processor>])
            .duration(10*20)
            .EUt(60)
            .buildAndRegister();
        //Interated Processor Circuit
        <recipemap:circuit_assembler>.recipeBuilder()
            .inputs([<contenttweaker:circuit_board_advanced>, <metaitem:plate.nor_memory_chip>, <ore:wireFineCopper>*4])
            .fluidInputs([<liquid:tin>*144])
            .outputs([<metaitem:circuit.processor>])
            .duration(10*20)
            .EUt(60)
            .buildAndRegister();
        <recipemap:circuit_assembler>.recipeBuilder()
            .inputs([<contenttweaker:circuit_board_advanced>, <metaitem:plate.nor_memory_chip>, <ore:wireFineCopper>*4])
            .fluidInputs([<liquid:soldering_alloy>*72])
            .outputs([<metaitem:circuit.processor>])
            .duration(10*20)
            .EUt(60)
            .buildAndRegister();

    //Assembly (HV)

    //Mainframe (HV)

    //Advanced Integrated Processor
        <recipemap:circuit_assembler>.findRecipe(30, [<metaitem:circuit.good_integrated> * 2, <metaitem:plate.integrated_logic_circuit> * 2, <metaitem:plate.random_access_memory> * 2, <metaitem:component.smd.transistor> * 4, <metaitem:wireFineElectrum> * 8, <metaitem:boltAnnealedCopper> * 8], [<liquid:tin> * 144]).remove();
        <recipemap:circuit_assembler>.findRecipe(30, [<metaitem:circuit.good_integrated> * 2, <metaitem:plate.integrated_logic_circuit> * 2, <metaitem:plate.random_access_memory> * 2, <metaitem:component.smd.transistor> * 4, <metaitem:wireFineElectrum> * 8, <metaitem:boltAnnealedCopper> * 8], [<liquid:soldering_alloy> * 72]).remove();
        //Integrated Processor & Microprocessor
        <recipemap:circuit_assembler>.recipeBuilder()
            .inputs([<metaitem:circuit.processor>*4, <metaitem:circuit.microprocessor>, <ore:wireFineElectrum>*4])
            .fluidInputs([<liquid:tin>*144])
            .outputs([<metaitem:circuit.advanced_integrated>])
            .duration(10*20)
            .EUt(120)
            .buildAndRegister();
        <recipemap:circuit_assembler>.recipeBuilder()
            .inputs([<metaitem:circuit.processor>*4, <metaitem:circuit.microprocessor>, <ore:wireFineElectrum>*4])
            .fluidInputs([<liquid:soldering_alloy>*72])
            .outputs([<metaitem:circuit.advanced_integrated>])
            .duration(10*20)
            .EUt(120)
            .buildAndRegister();
        //CPU
        <recipemap:circuit_assembler>.recipeBuilder()
            .inputs([<contenttweaker:circuit_board_advanced>, <metaitem:plate.central_processing_unit>, <ore:wireFineGold>*4])
            .fluidInputs([<liquid:tin>*144])
            .outputs([<metaitem:circuit.advanced_integrated>])
            .duration(10*20)
            .EUt(240)
            .buildAndRegister();
        <recipemap:circuit_assembler>.recipeBuilder()
            .inputs([<contenttweaker:circuit_board_advanced>, <metaitem:plate.central_processing_unit>, <ore:wireFineGold>*4])
            .fluidInputs([<liquid:soldering_alloy>*72])
            .outputs([<metaitem:circuit.advanced_integrated>])
            .duration(10*20)
            .EUt(240)
            .buildAndRegister();

    //Nanoprocessor (HV)
        <recipemap:circuit_assembler>.findRecipe(9600, [<metaitem:circuit_board.advanced>, <metaitem:plate.advanced_system_on_chip>, <metaitem:wireFineElectrum> * 4, <metaitem:boltPlatinum> * 4], [<liquid:tin> * 144]).remove();
        <recipemap:circuit_assembler>.findRecipe(9600, [<metaitem:circuit_board.advanced>, <metaitem:plate.advanced_system_on_chip>, <metaitem:wireFineElectrum> * 4, <metaitem:boltPlatinum> * 4], [<liquid:soldering_alloy> * 72]).remove();
        <recipemap:circuit_assembler>.findRecipe(600, [<metaitem:circuit_board.advanced>, <metaitem:plate.nano_central_processing_unit>, <metaitem:component.advanced_smd.resistor> * 2, <metaitem:component.advanced_smd.capacitor> * 2, <metaitem:component.advanced_smd.transistor> * 2, <metaitem:wireFineElectrum> * 8], [<liquid:tin> * 144]).remove();
        <recipemap:circuit_assembler>.findRecipe(600, [<metaitem:circuit_board.advanced>, <metaitem:plate.nano_central_processing_unit>, <metaitem:component.advanced_smd.resistor> * 2, <metaitem:component.advanced_smd.capacitor> * 2, <metaitem:component.advanced_smd.transistor> * 2, <metaitem:wireFineElectrum> * 8], [<liquid:soldering_alloy> * 72]).remove();
        <recipemap:circuit_assembler>.findRecipe(600, [<metaitem:circuit_board.advanced>, <metaitem:plate.nano_central_processing_unit>, <metaitem:component.smd.resistor> * 8, <metaitem:component.smd.capacitor> * 8, <metaitem:component.smd.transistor> * 8, <metaitem:wireFineElectrum> * 8], [<liquid:tin> * 144]).remove();
        <recipemap:circuit_assembler>.findRecipe(600, [<metaitem:circuit_board.advanced>, <metaitem:plate.nano_central_processing_unit>, <metaitem:component.smd.resistor> * 8, <metaitem:component.smd.capacitor> * 8, <metaitem:component.smd.transistor> * 8, <metaitem:wireFineElectrum> * 8], [<liquid:soldering_alloy> * 72]).remove();

    //Nanoprocessor Assembly (EV)
        <recipemap:circuit_assembler>.findRecipe(600, [<metaitem:circuit_board.advanced>, <metaitem:circuit.nano_processor> * 2, <metaitem:component.advanced_smd.inductor>, <metaitem:component.advanced_smd.capacitor> * 2, <metaitem:plate.random_access_memory> * 8, <metaitem:wireFineElectrum> * 16], [<liquid:tin> * 288]).remove();
        <recipemap:circuit_assembler>.findRecipe(600, [<metaitem:circuit_board.advanced>, <metaitem:circuit.nano_processor> * 2, <metaitem:component.advanced_smd.inductor>, <metaitem:component.advanced_smd.capacitor> * 2, <metaitem:plate.random_access_memory> * 8, <metaitem:wireFineElectrum> * 16], [<liquid:soldering_alloy> * 144]).remove();
        <recipemap:circuit_assembler>.findRecipe(600, [<metaitem:circuit_board.advanced>, <metaitem:circuit.nano_processor> * 2, <metaitem:component.smd.inductor> * 4, <metaitem:component.smd.capacitor> * 8, <metaitem:plate.random_access_memory> * 8, <metaitem:wireFineElectrum> * 16], [<liquid:tin> * 288]).remove();
        <recipemap:circuit_assembler>.findRecipe(600, [<metaitem:circuit_board.advanced>, <metaitem:circuit.nano_processor> * 2, <metaitem:component.smd.inductor> * 4, <metaitem:component.smd.capacitor> * 8, <metaitem:plate.random_access_memory> * 8, <metaitem:wireFineElectrum> * 16], [<liquid:soldering_alloy> * 144]).remove();

    //Nano Supercomputer (IV)
        <recipemap:circuit_assembler>.findRecipe(600, [<metaitem:circuit_board.advanced>, <metaitem:circuit.nano_assembly> * 2, <metaitem:component.advanced_smd.diode> * 2, <metaitem:plate.nor_memory_chip> * 4, <metaitem:plate.random_access_memory> * 16, <metaitem:wireFineElectrum> * 16], [<liquid:tin> * 288]).remove();
        <recipemap:circuit_assembler>.findRecipe(600, [<metaitem:circuit_board.advanced>, <metaitem:circuit.nano_assembly> * 2, <metaitem:component.advanced_smd.diode> * 2, <metaitem:plate.nor_memory_chip> * 4, <metaitem:plate.random_access_memory> * 16, <metaitem:wireFineElectrum> * 16], [<liquid:soldering_alloy> * 144]).remove();
        <recipemap:circuit_assembler>.findRecipe(600, [<metaitem:circuit_board.advanced>, <metaitem:circuit.nano_assembly> * 2, <metaitem:component.smd.diode> * 8, <metaitem:plate.nor_memory_chip> * 4, <metaitem:plate.random_access_memory> * 16, <metaitem:wireFineElectrum> * 16], [<liquid:tin> * 288]).remove();
        <recipemap:circuit_assembler>.findRecipe(600, [<metaitem:circuit_board.advanced>, <metaitem:circuit.nano_assembly> * 2, <metaitem:component.smd.diode> * 8, <metaitem:plate.nor_memory_chip> * 4, <metaitem:plate.random_access_memory> * 16, <metaitem:wireFineElectrum> * 16], [<liquid:soldering_alloy> * 144]).remove();

    //Nanoprocessor mainframe (LuV
        <recipemap:circuit_assembler>.findRecipe(1920, [<metaitem:frameAluminium> * 2, <metaitem:circuit.nano_computer> * 2, <metaitem:component.advanced_smd.inductor> * 4, <metaitem:component.advanced_smd.capacitor> * 8, <metaitem:plate.random_access_memory> * 16, <metaitem:wireGtSingleAnnealedCopper> * 32], [<liquid:tin> * 576]).remove();
        <recipemap:circuit_assembler>.findRecipe(1920, [<metaitem:frameAluminium> * 2, <metaitem:circuit.nano_computer> * 2, <metaitem:component.advanced_smd.inductor> * 4, <metaitem:component.advanced_smd.capacitor> * 8, <metaitem:plate.random_access_memory> * 16, <metaitem:wireGtSingleAnnealedCopper> * 32], [<liquid:soldering_alloy> * 288]).remove();
        <recipemap:circuit_assembler>.findRecipe(1920, [<metaitem:frameAluminium> * 2, <metaitem:circuit.nano_computer> * 2, <metaitem:component.smd.inductor> * 16, <metaitem:component.smd.capacitor> * 32, <metaitem:plate.random_access_memory> * 16, <metaitem:wireGtSingleAnnealedCopper> * 32], [<liquid:tin> * 576]).remove();
        <recipemap:circuit_assembler>.findRecipe(1920, [<metaitem:frameAluminium> * 2, <metaitem:circuit.nano_computer> * 2, <metaitem:component.smd.inductor> * 16, <metaitem:component.smd.capacitor> * 32, <metaitem:plate.random_access_memory> * 16, <metaitem:wireGtSingleAnnealedCopper> * 32], [<liquid:soldering_alloy> * 288]).remove();

    //Data Storage Unit
        <recipemap:forming_press>.recipeBuilder()
            .inputs([<contenttweaker:circuit_board_advanced>, <metaitem:engraved.crystal_chip>, <ore:wireFineGold>*4])
            .outputs([<metaitem:circuit.workstation>])
            .duration(5*20)
            .EUt(480)
            .buildAndRegister();

    //Data Control Circuit
        <recipemap:circuit_assembler>.findRecipe(38400, [<metaitem:circuit_board.extreme>, <metaitem:plate.advanced_system_on_chip>, <metaitem:wireFinePlatinum> * 12, <metaitem:boltNiobiumTitanium> * 8], [<liquid:tin> * 144]).remove();
        <recipemap:circuit_assembler>.findRecipe(38400, [<metaitem:circuit_board.extreme>, <metaitem:plate.advanced_system_on_chip>, <metaitem:wireFinePlatinum> * 12, <metaitem:boltNiobiumTitanium> * 8], [<liquid:soldering_alloy> * 72]).remove();
        <recipemap:circuit_assembler>.findRecipe(2400, [<metaitem:circuit_board.extreme>, <metaitem:plate.qbit_central_processing_unit>, <metaitem:plate.nano_central_processing_unit>, <metaitem:component.advanced_smd.capacitor> * 3, <metaitem:component.advanced_smd.transistor> * 3, <metaitem:wireFinePlatinum> * 12], [<liquid:tin> * 144]).remove();
        <recipemap:circuit_assembler>.findRecipe(2400, [<metaitem:circuit_board.extreme>, <metaitem:plate.qbit_central_processing_unit>, <metaitem:plate.nano_central_processing_unit>, <metaitem:component.advanced_smd.capacitor> * 3, <metaitem:component.advanced_smd.transistor> * 3, <metaitem:wireFinePlatinum> * 12], [<liquid:soldering_alloy> * 72]).remove();
        <recipemap:circuit_assembler>.findRecipe(2400, [<metaitem:circuit_board.extreme>, <metaitem:plate.qbit_central_processing_unit>, <metaitem:plate.nano_central_processing_unit>, <metaitem:component.smd.capacitor> * 12, <metaitem:component.smd.transistor> * 12, <metaitem:wireFinePlatinum> * 12], [<liquid:tin> * 144]).remove();
        <recipemap:circuit_assembler>.findRecipe(2400, [<metaitem:circuit_board.extreme>, <metaitem:plate.qbit_central_processing_unit>, <metaitem:plate.nano_central_processing_unit>, <metaitem:component.smd.capacitor> * 12, <metaitem:component.smd.transistor> * 12, <metaitem:wireFinePlatinum> * 12], [<liquid:soldering_alloy> * 72]).remove();
        <recipemap:circuit_assembler>.recipeBuilder()
            .inputs([<contenttweaker:circuit_board_elite>, <metaitem:circuit.workstation>*3, <ore:wireFinePlatinum>*8])
            .outputs([<metaitem:circuit.quantum_processor>])
            .duration(10*20)
            .EUt(480)
            .buildAndRegister();

    //Quantumprocessor Assembly (IV)
        <recipemap:circuit_assembler>.findRecipe(2400, [<metaitem:circuit_board.extreme>, <metaitem:circuit.quantum_processor> * 2, <metaitem:component.advanced_smd.inductor> * 2, <metaitem:component.advanced_smd.capacitor> * 4, <metaitem:plate.random_access_memory> * 4, <metaitem:wireFinePlatinum> * 16], [<liquid:tin> * 288]).remove();
        <recipemap:circuit_assembler>.findRecipe(2400, [<metaitem:circuit_board.extreme>, <metaitem:circuit.quantum_processor> * 2, <metaitem:component.advanced_smd.inductor> * 2, <metaitem:component.advanced_smd.capacitor> * 4, <metaitem:plate.random_access_memory> * 4, <metaitem:wireFinePlatinum> * 16], [<liquid:soldering_alloy> * 144]).remove();
        <recipemap:circuit_assembler>.findRecipe(2400, [<metaitem:circuit_board.extreme>, <metaitem:circuit.quantum_processor> * 2, <metaitem:component.smd.inductor> * 8, <metaitem:component.smd.capacitor> * 16, <metaitem:plate.random_access_memory> * 4, <metaitem:wireFinePlatinum> * 16], [<liquid:tin> * 288]).remove();
        <recipemap:circuit_assembler>.findRecipe(2400, [<metaitem:circuit_board.extreme>, <metaitem:circuit.quantum_processor> * 2, <metaitem:component.smd.inductor> * 8, <metaitem:component.smd.capacitor> * 16, <metaitem:plate.random_access_memory> * 4, <metaitem:wireFinePlatinum> * 16], [<liquid:soldering_alloy> * 144]).remove();

    //Quantum Supercomputer (LuV)
        <recipemap:circuit_assembler>.findRecipe(2400, [<metaitem:circuit_board.extreme>, <metaitem:circuit.quantum_assembly> * 2, <metaitem:component.advanced_smd.diode> * 2, <metaitem:plate.nor_memory_chip> * 4, <metaitem:plate.random_access_memory> * 16, <metaitem:wireFinePlatinum> * 32], [<liquid:tin> * 288]).remove();
        <recipemap:circuit_assembler>.findRecipe(2400, [<metaitem:circuit_board.extreme>, <metaitem:circuit.quantum_assembly> * 2, <metaitem:component.advanced_smd.diode> * 2, <metaitem:plate.nor_memory_chip> * 4, <metaitem:plate.random_access_memory> * 16, <metaitem:wireFinePlatinum> * 32], [<liquid:soldering_alloy> * 144]).remove();
        <recipemap:circuit_assembler>.findRecipe(2400, [<metaitem:circuit_board.extreme>, <metaitem:circuit.quantum_assembly> * 2, <metaitem:component.smd.diode> * 8, <metaitem:plate.nor_memory_chip> * 4, <metaitem:plate.random_access_memory> * 16, <metaitem:wireFinePlatinum> * 32], [<liquid:tin> * 288]).remove();
        <recipemap:circuit_assembler>.findRecipe(2400, [<metaitem:circuit_board.extreme>, <metaitem:circuit.quantum_assembly> * 2, <metaitem:component.smd.diode> * 8, <metaitem:plate.nor_memory_chip> * 4, <metaitem:plate.random_access_memory> * 16, <metaitem:wireFinePlatinum> * 32], [<liquid:soldering_alloy> * 144]).remove();

    //Quantumprocessor Mainframe (ZPM)
        <recipemap:circuit_assembler>.findRecipe(7680, [<metaitem:frameHssg> * 2, <metaitem:circuit.quantum_computer> * 2, <metaitem:component.advanced_smd.inductor> * 6, <metaitem:component.advanced_smd.capacitor> * 12, <metaitem:plate.random_access_memory> * 24, <metaitem:wireGtSingleAnnealedCopper> * 48], [<liquid:tin> * 576]).remove();
        <recipemap:circuit_assembler>.findRecipe(7680, [<metaitem:frameHssg> * 2, <metaitem:circuit.quantum_computer> * 2, <metaitem:component.advanced_smd.inductor> * 6, <metaitem:component.advanced_smd.capacitor> * 12, <metaitem:plate.random_access_memory> * 24, <metaitem:wireGtSingleAnnealedCopper> * 48], [<liquid:soldering_alloy> * 288]).remove();
        <recipemap:circuit_assembler>.findRecipe(7680, [<metaitem:frameHssg> * 2, <metaitem:circuit.quantum_computer> * 2, <metaitem:component.smd.inductor> * 24, <metaitem:component.smd.capacitor> * 48, <metaitem:plate.random_access_memory> * 24, <metaitem:wireGtSingleAnnealedCopper> * 48], [<liquid:tin> * 576]).remove();
        <recipemap:circuit_assembler>.findRecipe(7680, [<metaitem:frameHssg> * 2, <metaitem:circuit.quantum_computer> * 2, <metaitem:component.smd.inductor> * 24, <metaitem:component.smd.capacitor> * 48, <metaitem:plate.random_access_memory> * 24, <metaitem:wireGtSingleAnnealedCopper> * 48], [<liquid:soldering_alloy> * 288]).remove();

    //Energy flow Circuit (IV)
        <recipemap:circuit_assembler>.findRecipe(86000, [<metaitem:circuit_board.elite>, <metaitem:crystal.system_on_chip>, <metaitem:wireFineNiobiumTitanium> * 8, <metaitem:boltYttriumBariumCuprate> * 8], [<liquid:tin> * 144]).remove();
        <recipemap:circuit_assembler>.findRecipe(86000, [<metaitem:circuit_board.elite>, <metaitem:crystal.system_on_chip>, <metaitem:wireFineNiobiumTitanium> * 8, <metaitem:boltYttriumBariumCuprate> * 8], [<liquid:soldering_alloy> * 72]).remove();
        <recipemap:circuit_assembler>.findRecipe(9600, [<metaitem:circuit_board.elite>, <metaitem:crystal.central_processing_unit>, <metaitem:plate.nano_central_processing_unit> * 2, <metaitem:component.advanced_smd.capacitor> * 6, <metaitem:component.advanced_smd.transistor> * 6, <metaitem:wireFineNiobiumTitanium> * 8], [<liquid:tin> * 144]).remove();
        <recipemap:circuit_assembler>.findRecipe(9600, [<metaitem:circuit_board.elite>, <metaitem:crystal.central_processing_unit>, <metaitem:plate.nano_central_processing_unit> * 2, <metaitem:component.advanced_smd.capacitor> * 6, <metaitem:component.advanced_smd.transistor> * 6, <metaitem:wireFineNiobiumTitanium> * 8], [<liquid:soldering_alloy> * 72]).remove();
        <recipemap:circuit_assembler>.recipeBuilder()
            .inputs([<contenttweaker:circuit_board_elite>, <metaitem:engraved.lapotron_chip>*3, <ore:wireFineNiobiumTitanium>*8])
            .outputs([<metaitem:circuit.crystal_processor>])
            .duration(10*20)
            .EUt(1920)
            .buildAndRegister();

    //Crystal Processor Assembly (LuV)
        <recipemap:circuit_assembler>.findRecipe(9600, [<metaitem:circuit_board.elite>, <metaitem:circuit.crystal_processor> * 2, <metaitem:component.advanced_smd.inductor> * 4, <metaitem:component.advanced_smd.capacitor> * 8, <metaitem:plate.random_access_memory> * 24, <metaitem:wireFineNiobiumTitanium> * 16], [<liquid:tin> * 288]).remove();
        <recipemap:circuit_assembler>.findRecipe(9600, [<metaitem:circuit_board.elite>, <metaitem:circuit.crystal_processor> * 2, <metaitem:component.advanced_smd.inductor> * 4, <metaitem:component.advanced_smd.capacitor> * 8, <metaitem:plate.random_access_memory> * 24, <metaitem:wireFineNiobiumTitanium> * 16], [<liquid:soldering_alloy> * 144]).remove();

    //Crystal Supercomputer (ZPM)
        <recipemap:circuit_assembler>.findRecipe(9600, [<metaitem:circuit_board.elite>, <metaitem:circuit.crystal_assembly> * 2, <metaitem:plate.random_access_memory> * 4, <metaitem:plate.nor_memory_chip> * 32, <metaitem:plate.nand_memory_chip> * 64, <metaitem:wireFineNiobiumTitanium> * 32], [<liquid:tin> * 288]).remove();
        <recipemap:circuit_assembler>.findRecipe(9600, [<metaitem:circuit_board.elite>, <metaitem:circuit.crystal_assembly> * 2, <metaitem:plate.random_access_memory> * 4, <metaitem:plate.nor_memory_chip> * 32, <metaitem:plate.nand_memory_chip> * 64, <metaitem:wireFineNiobiumTitanium> * 32], [<liquid:soldering_alloy> * 144]).remove();

    //Crystal Processor Mainframe (UV)
        <recipemap:assembly_line>.findRecipe(30720, [<metaitem:frameHsse> * 2, <metaitem:circuit.crystal_computer> * 2, <metaitem:plate.random_access_memory> * 32, <metaitem:plate.high_power_integrated_circuit> * 2, <metaitem:wireGtSingleNiobiumTitanium> * 8, <metaitem:component.advanced_smd.inductor> * 8, <metaitem:component.advanced_smd.capacitor> * 16, <metaitem:component.advanced_smd.diode> * 8], [<liquid:soldering_alloy> * 1440]).remove();



#このscriptの読み込みの完了をログに出力
print("gt-circuit.zs loaded!");
