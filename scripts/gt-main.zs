#======================================================================
# name : gregtech.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Scripts for GregTech Community Ediiton Unofficial
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
print("Start loading gregtech.zs ...");

//変数の登録

//作業台レシピの編集
    //削除
        val removeCrafting as IItemStack[] = [
            <metaitem:compressed.coke_clay>
        ];
        for i in removeCrafting {
            HiiragiUtils.removeCrafting(i);
        }
    //上書き
        HiiragiUtils.addCrafting(true, true, <metaitem:wooden_form.empty>, [[<ore:slabWood>, <ore:GT.tool.saw>]]);
        HiiragiUtils.addCrafting(true, false, <metaitem:wooden_form.empty>, [[<ore:slabWood>, <artisanworktables:artisans_handsaw_flint>.anyDamage().transformDamage()]]);

    //新規
    HiiragiUtils.addCraftingConv(<tconstruct:pattern>, <metaitem:wooden_form.empty>);


//かまどレシピの編集
    //削除
        val removeFurnace as IItemStack[] = [
            <metaitem:compressed.coke_clay>
        ];
        for i in removeFurnace {
            HiiragiUtils.removeFurnace(i);
        }
    //新規
        val addFurnace as IIngredient[IItemStack] = {
            <ore:ingotAluminium>.firstItem: <ore:dustAluminium>
        };
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

//アルミニウム処理
    //Alumina Solution
        <recipemap:mixer>.recipeBuilder()
            .inputs([<ore:dustBauxite>, <ore:dustSodiumHydroxide>])
            .fluidInputs([<liquid:water>*3000])
            .fluidOutputs([<liquid:alumina_solution>*1000])
            .duration(3*20)
            .EUt(7)
            .buildAndRegister();
    //Hydroflouric Acid
        <recipemap:chemical_reactor>.recipeBuilder()
            .inputs([<ore:dustFluorite>])
            .fluidInputs([<liquid:sulfuric_acid>*1000])
            .outputs([<ore:dustGypsum>.firstItem])
            .fluidOutputs([<liquid:hydrofluoric_acid>*1000])
            .duration(3*20)
            .EUt(16)
            .buildAndRegister();
    //Alumina
        //Sapphire
            <recipemap:electrolyzer>.findRecipe(30, [<metaitem:dustSapphire> * 5], null).remove();
            <recipemap:electrolyzer>.recipeBuilder()
                .inputs([<ore:dustSapphire>*1])
                .outputs([<ore:dustAlumina>.firstItem*1])
                .duration(1*20)
                .EUt(30)
                .buildAndRegister();
        //Green Sapphire
            <recipemap:electrolyzer>.findRecipe(30, [<metaitem:dustGreenSapphire> * 5], null).remove();
            <recipemap:electrolyzer>.recipeBuilder()
                .inputs([<ore:dustSapphire>*1])
                .outputs([<ore:dustAlumina>.firstItem*1])
                .duration(1*20)
                .EUt(30)
                .buildAndRegister();
        //Ruby
            <recipemap:electrolyzer>.findRecipe(60, [<metaitem:dustRuby> * 6], null).remove();
            <recipemap:electrolyzer>.recipeBuilder()
                .inputs([<ore:dustRuby>*1])
                .outputs([<ore:dustAlumina>.firstItem*1, <ore:dustChrome>.firstItem*1])
                .duration(1.2*20)
                .EUt(60)
                .buildAndRegister();
        //Bauxite
            <recipemap:electrolyzer>.findRecipe(60, [<metaitem:dustBauxite> * 15], null).remove();
    //Alumina Solution
        <recipemap:chemical_reactor>.recipeBuilder()
            .fluidInputs([<liquid:alumina_solution>*2000, <liquid:hydrochloric_acid>*2000])
            .outputs([<ore:dustSalt>.firstItem*2, <ore:dustAlumina>.firstItem*1])
            .fluidOutputs([<liquid:water>*5000])
            .duration(3*20)
            .EUt(16)
            .buildAndRegister();
    //Cryolite Dust
        <recipemap:chemical_reactor>.recipeBuilder()
            .inputs([<ore:dustAlumina>, <ore:dustSodiumHydroxide>*6])
            .fluidInputs([<liquid:hydrofluoric_acid>*1000])
            .outputs([<ore:dustCryolite>.firstItem*2])
            .fluidOutputs([<liquid:water>*9000])
            .duration(3*20)
            .EUt(16)
            .buildAndRegister();
    //Aluminium
        <recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustAluminium>, <metaitem:circuit.integrated>.withTag({Configuration: 2})], [<liquid:nitrogen> * 1000]).remove();
        <recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustAluminium>, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();
        <recipemap:electric_blast_furnace>.recipeBuilder()
            .inputs([<ore:dustAlumina>, <ore:dustCryolite>])
            .fluidOutputs([<liquid:aluminium>*432])
            .duration(30*20)
            .EUt(120)
            .buildAndRegister();

//シリコン精製
    //Silane
        <recipemap:chemical_reactor>.recipeBuilder()
            .inputs([<ore:dustSilicon>])
            .fluidInputs([<liquid:hydrochloric_acid>*4000])
            .fluidOutputs([<liquid:silane>*1000, <liquid:hydrogen>*4000])
            .duration(10*20)
            .EUt(60)
            .buildAndRegister();
    //Refined Silicon
        <recipemap:chemical_reactor>.recipeBuilder()
            .fluidInputs([<liquid:silane>*1000, <liquid:hydrogen>*4000])
            .outputs([<ore:dustSiliconRefined>.firstItem])
            .fluidOutputs([<liquid:diluted_hydrochloric_acid>*4000])
            .duration(10*20)
            .EUt(60)
            .buildAndRegister();
    //Monocrystalline Silicon Boule
        <recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustSilicon> * 32, <metaitem:dustSmallGalliumArsenide>], null).remove();
        <recipemap:autoclave>.recipeBuilder()
            .inputs([<ore:dustSmallGalliumArsenide>])
            .fluidInputs([<liquid:silicon_refined>*4608])
            .outputs([<metaitem:boule.silicon>])
            .duration(5*60*20)
            .EUt(120)
            .buildAndRegister();

//このscriptの読み込みの完了をログに出力
print("gregtech.zs loaded!");
