#======================================================================
# name : thermal.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Scripts for Thermal Series
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
print("Start loading thermal.zs ...");

//変数の定義
    val removeFromJEI as IItemStack[] = [
        <thermalfoundation:storage:*>,
        <thermalfoundation:storage_alloy:*>,
        <thermalfoundation:material:0>,
        <thermalfoundation:material:1>,
        <thermalfoundation:material:22>,
        <thermalfoundation:material:23>,
        <thermalfoundation:material:24>,
        <thermalfoundation:material:25>,
        <thermalfoundation:material:26>,
        <thermalfoundation:material:27>,
        <thermalfoundation:material:32>,
        <thermalfoundation:material:33>,
        <thermalfoundation:material:64>,
        <thermalfoundation:material:65>,
        <thermalfoundation:material:66>,
        <thermalfoundation:material:67>,
        <thermalfoundation:material:68>,
        <thermalfoundation:material:69>,
        <thermalfoundation:material:70>,
        <thermalfoundation:material:71>,
        //<thermalfoundation:material:72>,
        <thermalfoundation:material:96>,
        <thermalfoundation:material:97>,
        <thermalfoundation:material:98>,
        <thermalfoundation:material:99>,
        <thermalfoundation:material:100>,
        <thermalfoundation:material:101>,
        <thermalfoundation:material:102>,
        <thermalfoundation:material:103>,
        <thermalfoundation:material:128>,
        <thermalfoundation:material:129>,
        <thermalfoundation:material:130>,
        <thermalfoundation:material:131>,
        <thermalfoundation:material:132>,
        <thermalfoundation:material:133>,
        <thermalfoundation:material:134>,
        <thermalfoundation:material:135>,
        //<thermalfoundation:material:136>,
        <thermalfoundation:material:160>,
        <thermalfoundation:material:161>,
        <thermalfoundation:material:162>,
        <thermalfoundation:material:163>,
        <thermalfoundation:material:164>,
        <thermalfoundation:material:165>,
        <thermalfoundation:material:166>,
        <thermalfoundation:material:167>,
        <thermalfoundation:material:192>,
        <thermalfoundation:material:193>,
        <thermalfoundation:material:194>,
        <thermalfoundation:material:195>,
        <thermalfoundation:material:196>,
        <thermalfoundation:material:197>,
        <thermalfoundation:material:198>,
        <thermalfoundation:material:199>,
        //<thermalfoundation:material:200>,
        <thermalfoundation:material:224>,
        <thermalfoundation:material:225>,
        <thermalfoundation:material:226>,
        <thermalfoundation:material:227>,
        <thermalfoundation:material:228>,
        <thermalfoundation:material:229>,
        <thermalfoundation:material:230>,
        <thermalfoundation:material:231>,
        <thermalfoundation:material:256>,
        <thermalfoundation:material:257>,
        <thermalfoundation:material:258>,
        <thermalfoundation:material:259>,
        <thermalfoundation:material:260>,
        <thermalfoundation:material:261>,
        <thermalfoundation:material:262>,
        <thermalfoundation:material:263>,
        //<thermalfoundation:material:264>,
        <thermalfoundation:material:288>,
        <thermalfoundation:material:289>,
        <thermalfoundation:material:290>,
        <thermalfoundation:material:291>,
        <thermalfoundation:material:292>,
        <thermalfoundation:material:293>,
        <thermalfoundation:material:294>,
        <thermalfoundation:material:295>,
        <thermalfoundation:material:320>,
        <thermalfoundation:material:321>,
        <thermalfoundation:material:322>,
        <thermalfoundation:material:323>,
        <thermalfoundation:material:324>,
        <thermalfoundation:material:325>,
        <thermalfoundation:material:326>,
        <thermalfoundation:material:327>,
        //<thermalfoundation:material:328>,
        <thermalfoundation:material:352>,
        <thermalfoundation:material:353>,
        <thermalfoundation:material:354>,
        <thermalfoundation:material:355>,
        <thermalfoundation:material:356>,
        <thermalfoundation:material:357>,
        <thermalfoundation:material:358>,
        <thermalfoundation:material:359>,
        <thermalfoundation:material:768>,
        <thermalfoundation:material:769>,
        <thermalfoundation:material:770>,
        <thermalfoundation:material:771>,
        <thermalfoundation:material:772>,
        <thermalfoundation:material:800>,
        <thermalfoundation:material:802>,
    ];
    for i in removeFromJEI {
        HiiragiUtils.removeFromJEI(i);
        HiiragiUtils.removeOreDict(i);
    }

//作業台レシピの編集
    //削除
        val removeCrafting as IItemStack[] = [];
        for i in removeCrafting {
            HiiragiUtils.removeCrafting(i);
        }
    //上書き
        HiiragiUtils.addCrafting(false, true, <thermalfoundation:wrench>, RecipePattern.init(["A", "B", "B"]).map({A:<gregtech:meta_tool:8>.withTag({"GT.ToolStats": {Material: "iron"}}), B:<metaitem:stickCobalt>}).ingredients);
        HiiragiUtils.addCrafting(false, true, <thermalfoundation:security>, RecipePattern.init(["ABC", "B B", "DED"]).map({A:<ore:GT.tool.hammer.hard>, B:<metaitem:stickSignalum>, C:<ore:GT.tool.file>, D:<metaitem:plateSignalum>, E:<metaitem:plateDoubleSignalum>}).ingredients);
        HiiragiUtils.addCrafting(false, true, <thermalfoundation:material:512>*2, RecipePattern.init(["ABA", " C ", "ABA"]).map({A:<metaitem:wireFineRedAlloy>, B:<metaitem:stickIron>, C:<metaitem:plateIron>}).ingredients);
        HiiragiUtils.addCrafting(false, true, <thermalfoundation:material:513>*2, RecipePattern.init([" AB", "ABA", "BA "]).map({A:<metaitem:wireFineRedAlloy>, B:<metaitem:stickGold>}).ingredients);
        HiiragiUtils.addCrafting(false, true, <thermalfoundation:material:514>*2, RecipePattern.init([" AB", "ABA", "BA "]).map({A:<metaitem:wireFineRedAlloy>, B:<metaitem:stickSilver>}).ingredients);
        HiiragiUtils.addCrafting(false, true, <thermalfoundation:material:515>*2, RecipePattern.init(["BA ", "ABA", "AB "]).map({A:<metaitem:wireFineRedAlloy>, B:<metaitem:stickElectrum>}).ingredients);

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
        val glassHardened as IItemStack[][] = [
            [<thermalfoundation:glass:3>, <metaitem:dustCopper>],
            [<thermalfoundation:glass:3>, <metaitem:dustTin>],
            [<thermalfoundation:glass:3>, <metaitem:dustSilver>],
            [<gregtech:transparent_casing>, <metaitem:dustLead>],
            [<thermalfoundation:glass:3>, <metaitem:dustAluminum>],
            [<thermalfoundation:glass:3>, <metaitem:dustNickel>],
            [<thermalfoundation:glass:3>, <metaitem:dustPlatinum>],
            [<thermalfoundation:glass:3>, <metaitem:dustIridium>],
            [<thermalfoundation:glass:3>, <thermalfoundation:material:72>],
            [<thermalfoundation:glass:3>, <metaitem:dustSteel>],
            [<thermalfoundation:glass:3>, <metaitem:dustElectrum>],
            [<thermalfoundation:glass:3>, <metaitem:dustInvar>],
            [<thermalfoundation:glass:3>, <metaitem:dustBronze>],
            [<thermalfoundation:glass:3>, <metaitem:dustCupronickel>],
            [<thermalfoundation:glass:3>, <metaitem:dustSignalum>],
            [<thermalfoundation:glass:3>, <metaitem:dustLumium>],
            [<thermalfoundation:glass:3>, <metaitem:dustEnderium>],
        ];
        for i in 0 to 8 {
            <recipemap:alloy_smelter>.recipeBuilder()
                .inputs(glassHardened[i])
                .outputs(<thermalfoundation:glass>.definition.makeStack(i))
                .duration(10*20)
                .EUt(120)
                .buildAndRegister();
        }
        for i in 0 to 7 {
            <recipemap:alloy_smelter>.recipeBuilder()
                .inputs(glassHardened[i+9])
                .outputs(<thermalfoundation:glass_alloy>.definition.makeStack(i))
                .duration(10*20)
                .EUt(120)
                .buildAndRegister();
        }

        for i in 0 to 15 {
            <recipemap:mixer>.recipeBuilder()
                .inputs([<metaitem:dustAsbestos>*4])
                .fluidInputs(HiiragiUtils.dyeLiquid[i]*144)
                .outputs(<thermalfoundation:rockwool>.definition.makeStack(i))
                .duration(10*20)
                .EUt(30)
                .buildAndRegister();
        }

        <recipemap:mixer>.recipeBuilder()
            .inputs([<metaitem:dustCopper>*3, <metaitem:dustSilver>*1])
            .fluidInputs([<liquid:redstone>*1152])
            .outputs(<metaitem:dustSignalum>*4)
            .duration(10*20)
            .EUt(120)
            .buildAndRegister();
        <recipemap:mixer>.recipeBuilder()
            .inputs([<metaitem:dustTin>*3, <metaitem:dustGold>*1])
            .fluidInputs([<liquid:glowstone>*576])
            .outputs(<metaitem:dustLumium>*4)
            .duration(10*20)
            .EUt(480)
            .buildAndRegister();
        <recipemap:mixer>.recipeBuilder()
            .inputs([<metaitem:dustLead>*3, <metaitem:dustPlatinum>*1])
            .fluidInputs([<liquid:ender>*1000])
            .outputs(<metaitem:dustEnderium>*4)
            .duration(10*20)
            .EUt(1920)
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
print("thermal.zs loaded!");
