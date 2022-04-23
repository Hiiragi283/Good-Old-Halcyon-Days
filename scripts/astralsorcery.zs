#======================================================================
# name : astralsorcery.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : scripts for Astral Sorcery
#======================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.astralsorcery.Altar;
import mods.bloodmagic.AlchemyArray;
import mods.chisel.Carving as chisel;
import mods.ctintegration.util.RecipePattern;
import mods.gregtech.recipe.RecipeMap;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading astralsorcery.zs ...");

//変数の定義

//作業台レシピの編集
    //削除
        val removeCrafting as IItemStack[] = [
            <astralsorcery:itemcraftingcomponent:5>,
            <astralsorcery:itemwand>,
            <astralsorcery:blockaltar:0>,
            <astralsorcery:itemwand>,
            <astralsorcery:blockmarble:*>,
            <astralsorcery:blockblackmarble:*>,
            <astralsorcery:blockinfusedwood:*>,
        ];
        for i in removeCrafting {
            HiiragiUtils.removeCrafting(i);
        }
    //上書き
        HiiragiUtils.addCrafting(false, true, <astralsorcery:itemjournal>, RecipePattern.init(["AAB", "ACD"]).map({A:<minecraft:paper>, B:<ore:dyeBrown>, C:<twilightforest:alpha_fur>, D:<botania:manaresource:12>}).ingredients);
    //新規

        //HiiragiUtils.addCraftingConv(<astralsorcery:itemcraftingcomponent>, <metaitem:gemAquamarine>);

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
            .setShaped(RecipePattern.init(["  AB", "  CA", " D  ", "C   "])
                .map({
                    A:<astralsorcery:itemcraftingcomponent:0>,
                    B:<botania:spark:0>,
                    C:<astralsorcery:blockmarble:6>,
                    D:<gregtech:planks:1>
                }).ingredients)
            .addOutput(<astralsorcery:itemwand>)
            .create();
        RecipeBuilder.get("basic")
            .setShaped(RecipePattern.init(["ABBBA", "ACCCA", "  D  ", " EDE "])
                .map({
                    A:<astralsorcery:blockmarble:3>,
                    B:<astralsorcery:blockblackmarble:4>,
                    C:<astralsorcery:blockblackmarble:0>,
                    D:<gregtech:planks:1>,
                    E:<metaitem:plateTreatedWood>
                }).ingredients)
            .addOutput(<astralsorcery:blockaltar>)
            .create();

//GTレシピの編集
    //削除
    //上書き
    //新規

    /*
    <recipemap:name>.recipeBuilder()
        .inputs([])
        .outputs()
        .duration()
        .EUt()
        .buildAndRegister();
    */

//Altarのレシピを改変
    val removeAltar as string[] = [
        //Luminous Crafting Table
            "shaped/internal/altar/grindstone",
            "shaped/cc_parchment",
            "shaped/internal/altar/illuminationpowder",
            "shaped/internal/altar/nocturnalpowder",
            "shaped/internal/altar/handtelescope",
            "shaped/internal/altar/attunementrelay",
            "shaped/internal/altar/lightwell",
            "shaped/internal/altar/illuminator",
            "shaped/internal/altar/tool_basicwand",
            "shaped/internal/altar/journal",
            "shapeless/infused_wood_planks",
            "shaped/infused_wood_arch",
            "shaped/infused_wood_column",
            "shaped/infused_wood_engraved",
            "shaped/internal/altar/marble_black_raw",
            "shaped/internal/altar/marble_runed",
            "shaped/marble_stairs",
            "shaped/marble_slab",
            "shaped/internal/altar/marble_engraved",
            "shaped/internal/altar/marble_chiseled",
            "shaped/internal/altar/marble_arch",
            "shaped/internal/altar/marble_pillar",
            "shaped/internal/altar/marble_bricks",
            "shaped/internal/altar/black_marble_arch",
            "shaped/internal/altar/black_marble_bricks",
            "shaped/internal/altar/black_marble_chiseled",
            "shaped/internal/altar/black_marble_engraved",
            "shaped/internal/altar/black_marble_runed",
            "shaped/internal/altar/black_marble_pillar",
        //Starlight Crafting Table
        //Celestial Altar
        //Iridescent Altar
    ];
    for i in removeAltar {
        mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:" ~ i);
    }

    //Luminous Crafting Table
        HiiragiUtils.addAltarAS1(<astralsorcery:blockmachine:1>, 150, 300, RecipePattern.init([" AABAACDC"]).map({A:<astralsorcery:blockmarble:*>, B:<tconevo:metal:28>, C:<metaitem:stickTreatedWood>, D:<metaitem:frameTreatedWood>}).ingredients);
        HiiragiUtils.addAltarAS1(<astralsorcery:itemhandtelescope>, 150, 300, RecipePattern.init(["AB BCD DB"]).map({A:<botania:lens>, B:<metaitem:plateBrass>, C:<metaitem:plateTreatedWood>, D:<metaitem:stickTreatedWood>}).ingredients);
        HiiragiUtils.addAltarAS1(<astralsorcery:blockattunementrelay>, 250, 300, RecipePattern.init(["ABABCBABA"]).map({A:<metaitem:stickTreatedWood>, B:<metaitem:nuggetBrass>, C:<astralsorcery:itemcraftingcomponent:3>}).ingredients);
        HiiragiUtils.addAltarAS1(<astralsorcery:blockwell>, 200, 300, RecipePattern.init(["A ABCBDED"]).map({A:<astralsorcery:blockmarble:3>, B:<astralsorcery:blockmarble:0>, C:<astralsorcery:itemcraftingcomponent:0>, D:<astralsorcery:blockmarblestairs>, E:<astralsorcery:blockblackmarble:*>}).ingredients);
        HiiragiUtils.addAltarAS1(<astralsorcery:blockworldilluminator>, 200, 300, RecipePattern.init(["ABABCBABA"]).map({A:<astralsorcery:itemusabledust:0>, B:<twilightforest:torchberries>, C:<twilightforest:firefly_jar>}).ingredients);

    //Starlight Crafting Table
        HiiragiUtils.addAltarAS2(<astralsorcery:blockmachine>, 1400, 300, RecipePattern.init(["ABC D  C     "]).map({A:<astralsorcery:itemcraftingcomponent>, B:<astralsorcery:itemhandtelescope>, C:<metaitem:plateBrass>, D:<astralsorcery:blockinfusedwood:2>}).ingredients);

    //Celestial Altar
    //Iridescent Altar

//Alchemy Arrayのレシピを追加
    AlchemyArray.addRecipe(<astralsorcery:itemcraftingcomponent:5>, <twilightforest:arctic_fur>, <minecraft:wool>);

//Chiselへの登録
chisel.addGroup("infused_wood");
for i in 1 to 5 {
    chisel.addVariation("infused_wood", <astralsorcery:blockinfusedwood>.definition.makeStack(i));
}

//このscriptの読み込みの完了をログに出力
print("astralsorcery.zs loaded!");
