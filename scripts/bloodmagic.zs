#======================================================================
# name : bloodmagic.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Scripts for Bloodmagic
#======================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.bloodmagic.AlchemyArray;
import mods.bloodmagic.BloodAltar;
import mods.bloodmagic.TartaricForge;
import mods.chisel.Carving as chisel;
import mods.ctintegration.util.RecipePattern;
import mods.gregtech.recipe.RecipeMap;
import mods.thaumcraft.Crucible;
import thaumcraft.aspect.CTAspectStack;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading bloodmagic.zs ...");

//変数の定義

//作業台レシピの編集
    //削除
        val removeCrafting as IItemStack[] = [
            <bloodmagic:ritual_stone>,
            <bloodmagic:alchemy_table>,
            <bloodmagic:decorative_brick:0>,
            <bloodmagic:lava_crystal>,
        ];
        for i in removeCrafting {
            HiiragiUtils.removeCrafting(i);
        }
    //上書き
        for i in 0 to 3 {
            recipes.addShaped("bloodmagic_ritual_stone_0" ~ i, <bloodmagic:ritual_stone>*(4+i*4), RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<thaumcraft:stone_arcane>, B:<bloodmagic:slate>.definition.makeStack(i+1), C:HiiragiUtils.orbBlood(i+2)}).ingredients);
        }
        HiiragiUtils.addCrafting(false, true, <bloodmagic:soul_forge>, RecipePattern.init(["ABA", "CCC", "D D"]).map({A:<minecraft:iron_bars>, B:<bloodmagic:monster_soul>, C:<thaumcraft:stone_arcane>, D:<thaumcraft:slab_arcane_stone>}).ingredients);
        HiiragiUtils.addCrafting(false, true, <bloodmagic:incense_altar>, RecipePattern.init(["ABA", "ACA", "DAD"]).map({A:<metaitem:plateGold>, B:HiiragiUtils.orbBlood(1), C:<minecraft:coal:1>, D:<minecraft:gold_ingot>}).ingredients);
        HiiragiUtils.addCrafting(false, false, <bloodmagic:item_routing_node>*4, RecipePattern.init([" A ", "BCB", "BDB"]).map({A:<minecraft:glass>, B:<metaitem:stickSteel>, C:<minecraft:quartz>, D:<bloodmagic:slate:0>}).ingredients);
        HiiragiUtils.addCrafting(true, false, <bloodmagic:component:10>, [[<bloodmagic:slate:0>, HiiragiUtils.toolInput(<extrautils2:glasscutter>, 1)]]);
        HiiragiUtils.addCrafting(true, true, <bloodmagic:base_item_filter:0>, [[<bloodmagic:component:10>, <minecraft:paper>]]);
        HiiragiUtils.addCrafting(true, true, <bloodmagic:base_item_filter:1>, [[<bloodmagic:base_item_filter:0>, <ore:dyeOrange>]]);
        HiiragiUtils.addCrafting(true, true, <bloodmagic:base_item_filter:2>, [[<bloodmagic:base_item_filter:0>, <ore:dyeYellow>]]);
        HiiragiUtils.addCrafting(true, true, <bloodmagic:base_item_filter:3>, [[<bloodmagic:base_item_filter:0>, <ore:dyeLime>]]);
        HiiragiUtils.addCrafting(true, true, <bloodmagic:base_fluid_filter:0>, [[<bloodmagic:component:10>, <minecraft:bucket>]]);

        recipes.replaceAllOccurences(<minecraft:obsidian>, <thaumcraft:stone_arcane>, <bloodmagic:ritual_stone>);
        recipes.replaceAllOccurences(<bloodmagic:ritual_stone>, <bloodmagic:slate:2>, <bloodmagic:ritual_controller>);
        recipes.replaceAllOccurences(<minecraft:obsidian>, <bloodmagic:ritual_stone>, <bloodmagic:ritual_controller>);
    //新規
        for i in 0 to 3 {
            recipes.addShaped("bloodmagic_blood_rune_0" ~ i, <bloodmagic:blood_rune>*(i+2), RecipePattern.init(["AAA", "BCB", "AAA"]).map({A:<minecraft:stone>, B:<bloodmagic:slate>.definition.makeStack(i+1), C:HiiragiUtils.orbBlood(i+2)}).ingredients);
        }
        HiiragiUtils.addCraftingConv(<bloodmagic:inversion_pillar_end:0>, <bloodmagic:inversion_pillar_end:1>);
        HiiragiUtils.addCraftingConv(<bloodmagic:inversion_pillar_end:2>, <bloodmagic:inversion_pillar_end:3>);
        HiiragiUtils.addCraftingConv(<bloodmagic:inversion_pillar_end:4>, <bloodmagic:inversion_pillar_end:5>);
        HiiragiUtils.addCraftingConv(<bloodmagic:inversion_pillar_end:6>, <bloodmagic:inversion_pillar_end:7>);
        HiiragiUtils.addCraftingConv(<bloodmagic:inversion_pillar_end:8>, <bloodmagic:inversion_pillar_end:9>);
        recipes.addShaped("bloodmagic_inversion_pillar_end_0_8", <bloodmagic:inversion_pillar_end:0>, RecipePattern.init(["ABA", "CDC"])
            .map({
                A:<bloodmagic:demon_stairs_1:0>,
                B:<bloodmagic:item_demon_crystal:0>,
                C:<bloodmagic:demon_pillar_2:0>,
                D:<bloodmagic:demon_light:0>
            }).ingredients);
        recipes.addShaped("bloodmagic_inversion_pillar_end_2_8", <bloodmagic:inversion_pillar_end:2>,RecipePattern.init(["ABA", "CDC"])
            .map({
                A:<bloodmagic:demon_stairs_1:1>,
                B:<bloodmagic:item_demon_crystal:1>,
                C:<bloodmagic:demon_pillar_2:1>,
                D:<bloodmagic:demon_light:1>
            }).ingredients);
        recipes.addShaped("bloodmagic_inversion_pillar_end_4_8", <bloodmagic:inversion_pillar_end:4>,RecipePattern.init(["ABA", "CDC"])
            .map({
                A:<bloodmagic:demon_stairs_2:0>,
                B:<bloodmagic:item_demon_crystal:2>,
                C:<bloodmagic:demon_pillar_2:2>,
                D:<bloodmagic:demon_light:2>
            }).ingredients);
        recipes.addShaped("bloodmagic_inversion_pillar_end_6_8", <bloodmagic:inversion_pillar_end:6>,RecipePattern.init(["ABA", "CDC"])
            .map({
                A:<bloodmagic:demon_stairs_2:1>,
                B:<bloodmagic:item_demon_crystal:3>,
                C:<bloodmagic:demon_pillar_2:3>,
                D:<bloodmagic:demon_light:3>
            }).ingredients);
        recipes.addShaped("bloodmagic_inversion_pillar_end_8_8", <bloodmagic:inversion_pillar_end:8>,RecipePattern.init(["ABA", "CDC"])
            .map({
                A:<bloodmagic:demon_stairs_3:0>,
                B:<bloodmagic:item_demon_crystal:4>,
                C:<bloodmagic:demon_pillar_2:4>,
                D:<bloodmagic:demon_light:4>
            }).ingredients);
        HiiragiUtils.addCrafting(false, false, <bloodmagic:sentient_shovel>, RecipePattern.init(["ABC", " D ", " D "]).map({A:<ore:GT.tool.file>, B:<tconevo:metal:33>, C:<ore:GT.tool.hammer.hard>, D:<ore:stickWood>}).ingredients);
        HiiragiUtils.addCrafting(false, false, <bloodmagic:sentient_pickaxe>, RecipePattern.init(["ABB", "CDE", " D "]).map({A:<tconevo:metal:33>, B:<tconevo:metal:33>, C:<ore:GT.tool.file>, D:<ore:stickWood>, E:<ore:GT.tool.hammer.hard>}).ingredients);
        HiiragiUtils.addCrafting(false, false, <bloodmagic:sentient_axe>, RecipePattern.init(["ABC", "AD ", "ED "]).map({A:<tconevo:metal:33>, B:<tconevo:metal:30>, C:<ore:GT.tool.hammer.hard>, D:<ore:stickWood>, E:<ore:GT.tool.file>}).ingredients);
        HiiragiUtils.addCrafting(false, false, <bloodmagic:sentient_sword>, RecipePattern.init([" A ", "BAC", " D "]).map({A:<tconevo:metal:33>, B:<ore:GT.tool.file>, C:<ore:GT.tool.hammer.hard>, D:<ore:stickWood>}).ingredients);

//かまどレシピの編集
    //削除
        val removeFurnace as IItemStack[] = [];
        for i in removeFurnace {
            HiiragiUtils.removeFurnace(i);
        }
    //新規
        val addFurnace as IIngredient[IItemStack] = {
            <bloodmagic:arcane_ashes>: <thaumcraft:log_greatwood>
        };
        for output, input in addFurnace {
            HiiragiUtils.addFurnace(false, output, input);
        }

//AWレシピの編集
    //import
    //新規
        RecipeBuilder.get("basic")
            .setShaped(RecipePattern
                .init(["AB AC", "DDDDD", "EEEEE", " FGF ", "EEEEE"])
                .map({A:<minecraft:glass_bottle>,
                    B:<minecraft:book>,
                    C:<thaumcraft:alembic>,
                    D:<minecraft:carpet:14>,
                    E:<thaumcraft:slab_arcane_stone>,
                    F:<thaumcraft:metal_alchemical>,
                    G:<botania:alchemycatalyst>}).ingredients)
            .addOutput(<bloodmagic:alchemy_table>)
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

//Alchemy Arrayのレシピを編集
    AlchemyArray.addRecipe(<bloodmagic:decorative_brick:0>, <minecraft:stone>, <bloodmagic:blood_shard:0>);
    AlchemyArray.addRecipe(<bloodmagic:demon_will_gauge>, <thaumcraft:thaumometer>, <bloodmagic:item_demon_crystal:0>);


//Blood Altarのレシピを調整
    val removeAltar as IItemStack[] = [
        <minecraft:diamond>, //Weak Blood Orb
        <minecraft:redstone_block>, //Apprentice Blood Orb
        <minecraft:gold_block>, //Magician Blood Orb
        <minecraft:nether_star>, // Archmage Blood Orb
        <minecraft:lapis_block>, //Inscription Tool: Water
        <minecraft:magma_cream>, //Inscription Tool: Fire
        <minecraft:obsidian>, //Inscription Tool: Earth
        <minecraft:ghast_tear>, //Inscription Tool: Air
        <minecraft:coal_block>, //Inscription Tool: Dusk
        <minecraft:iron_sword>, //Daggar of Sacrifice
    ];
    for i in removeAltar {
        mods.bloodmagic.BloodAltar.removeRecipe(i);
    }

    mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:slate>*3, <thaumcraft:stone_arcane>, 2, 1000, 5, 5);
    mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:slate>*4, <thaumcraft:stone_ancient>, 3, 1000, 5, 5);
    mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:slate>*5, <thaumcraft:stone_eldritch_tile>, 4, 1000, 5, 5);
    mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:weak"}), <twilightforest:fiery_blood>, 0, 2000, 2, 1);
    mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:apprentice"}), <evilcraft:blood_infusion_core>, 1, 5000, 5, 5);
    mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:magician"}), <twilightforest:fiery_tears>, 2, 25000, 20, 20);
    mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"}), <evilcraft:garmonbozia>, 4, 80000, 50, 100);
    mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:inscription_tool:1>.withTag({uses: 10}), <botania:rune:0>, 2, 1000, 5, 5);
    mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:inscription_tool:2>.withTag({uses: 10}), <botania:rune:1>, 2, 1000, 5, 5);
    mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:inscription_tool:3>.withTag({uses: 10}), <botania:rune:2>, 2, 1000, 5, 5);
    mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:inscription_tool:4>.withTag({uses: 10}), <botania:rune:3>, 2, 1000, 5, 5);
    mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:inscription_tool:5>.withTag({uses: 10}), <botania:rune:8>, 3, 2000, 20, 10);
    mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:dagger_of_sacrifice>, <twilightforest:knightmetal_sword>, 1, 3000, 5, 5);

//Hellfire Forgeを用いるレシピを変更
    val removeForge as IItemStack[][] = [
        [<minecraft:cauldron>, <minecraft:stone>, <minecraft:dye:4>, <minecraft:diamond>], //Demon Crucible
        [<bloodmagic:soul_forge>, <minecraft:stone>, <minecraft:dye:4>, <minecraft:glass>], //Demon Crystallizer
        [<minecraft:glowstone_dust>, <minecraft:redstone>, <minecraft:glass>, <minecraft:stone>], //Routing Node
        [<minecraft:glowstone_dust>, <minecraft:redstone>, <minecraft:gold_ingot>, <bloodmagic:item_routing_node>], //Input Routing Node
        [<minecraft:glowstone_dust>, <minecraft:redstone>, <minecraft:iron_ingot>, <bloodmagic:item_routing_node>], //Output Routing Node
        [<minecraft:iron_block>, <minecraft:diamond>, <bloodmagic:slate:2>], //master Routing Node
        [<minecraft:diamond_chestplate>, <bloodmagic:soul_gem:1>, <minecraft:iron_block>, <minecraft:obsidian>], //Sentient Armour Gem
        [<minecraft:glass>, <minecraft:stone>, <bloodmagic:slate:0>], //Frame parts
        [<minecraft:redstone>, <minecraft:dye:15>, <minecraft:gunpowder>, <minecraft:coal>], //Arcane Ash
        [<minecraft:redstone>, <minecraft:gold_ingot>, <minecraft:glass>, <minecraft:dye:4>], //Petty Tartaric Gem
        [<bloodmagic:soul_gem>, <minecraft:diamond>, <minecraft:redstone_block>, <minecraft:lapis_block>], //Lesser Tartaric Gem
        [<bloodmagic:soul_gem:1>, <minecraft:diamond>, <minecraft:gold_block>, <bloodmagic:slate:2>], //Common Tartaric Gem
        [<bloodmagic:soul_gem:2>, <bloodmagic:slate:3>, <bloodmagic:blood_shard>, <bloodmagic:item_demon_crystal:0>], //Greater Tartaric Gem
        [<bloodmagic:soul_gem:3>, <minecraft:nether_star>], //Grand Tartaric Gem
        [<minecraft:gold_ingot>, <minecraft:redstone>, <minecraft:glass>, <bloodmagic:item_demon_crystal>], //Demon Will Aura Gauge
    ];
    for i in removeForge {
        mods.bloodmagic.TartaricForge.removeRecipe(i);
    }

    mods.bloodmagic.TartaricForge.addRecipe(<bloodmagic:demon_crucible>, [<thaumcraft:crucible>, <ore:nitor>, <bloodmagic:slate:2>, <metaitem:plateWroughtIron>], 400, 100);
    mods.bloodmagic.TartaricForge.addRecipe(<bloodmagic:demon_crystallizer>, [<bloodmagic:soul_forge>, <minecraft:packed_ice>, <bloodmagic:slate:2>, <metaitem:plateWroughtIron>], 500, 100);
    mods.bloodmagic.TartaricForge.addRecipe(<bloodmagic:input_routing_node>, [<bloodmagic:item_routing_node>, <metaitem:pipeSmallItemTin>, <metaitem:dustSilver>], 64, 2);
    mods.bloodmagic.TartaricForge.addRecipe(<bloodmagic:output_routing_node>, [<bloodmagic:item_routing_node>, <metaitem:pipeSmallItemTin>, <metaitem:dustGold>], 64, 2);
    mods.bloodmagic.TartaricForge.addRecipe(<bloodmagic:master_routing_node>, [<bloodmagic:item_routing_node>, <biomesoplenty:gem:2>, <bloodmagic:slate:2>, <metaitem:plateWroughtIron>], 64, 10);
    mods.bloodmagic.TartaricForge.addRecipe(<bloodmagic:sentient_armour_gem>, [<minecraft:iron_helmet>, <minecraft:iron_chestplate>, <minecraft:iron_leggings>, <minecraft:iron_boots>], 256, 256);
    mods.bloodmagic.TartaricForge.addRecipe(<bloodmagic:soul_gem:0>, [<bloodmagic:monster_soul>, <bloodmagic:slate:0>, <thaumcraft:amber>, <minecraft:iron_ingot>], 1, 1);
    mods.bloodmagic.TartaricForge.addRecipe(<bloodmagic:soul_gem:1>, [<bloodmagic:soul_gem:0>, <bloodmagic:slate:1>, <evilcraft:dark_gem>, <twilightforest:fiery_ingot>], 64, 48);
    mods.bloodmagic.TartaricForge.addRecipe(<bloodmagic:soul_gem:2>, [<bloodmagic:soul_gem:1>, <bloodmagic:slate:2>, <evilcraft:dark_power_gem>, <twilightforest:knightmetal_ingot>], 256, 192);
    mods.bloodmagic.TartaricForge.addRecipe(<bloodmagic:soul_gem:3>, [<bloodmagic:soul_gem:2>, <bloodmagic:slate:3>, <bloodmagic:blood_shard:0>, <enderio:item_alloy_ingot:6>], 1024, 768);
    mods.bloodmagic.TartaricForge.addRecipe(<bloodmagic:soul_gem:4>, [<bloodmagic:soul_gem:3>, <bloodmagic:slate:4>, <minecraft:nether_star>, <enderio:item_alloy_ingot:8>], 4096, 3072);


//Will Stoneをchiselで加工するように変更
    chisel.addGroup("will_default");
    chisel.addGroup("will_corrosive");
    chisel.addGroup("will_destructtive");
    chisel.addGroup("will_vengeful");
    chisel.addGroup("will_steadfast");

    val stoneRaw as IItemStack[] = [
        <bloodmagic:demon_brick_1:0>,
        <bloodmagic:demon_brick_2:0>,
        <bloodmagic:demon_brick_2:5>,
        <bloodmagic:demon_extras:0>,
        <bloodmagic:demon_extras:5>,
        <bloodmagic:demon_pillar_1:0>,
        <bloodmagic:demon_pillar_cap_1:0>
    ];
    for i in stoneRaw {
        HiiragiUtils.removeCrafting(i);
        chisel.addVariation("will_default", i);
    }

    val stoneCorr as IItemStack[] = [
        <bloodmagic:demon_brick_1:1>,
        <bloodmagic:demon_brick_2:1>,
        <bloodmagic:demon_brick_2:6>,
        <bloodmagic:demon_extras:1>,
        <bloodmagic:demon_extras:6>,
        <bloodmagic:demon_pillar_1:1>,
        <bloodmagic:demon_pillar_cap_1:1>
    ];
    for i in stoneCorr {
        HiiragiUtils.removeCrafting(i);
        chisel.addVariation("will_corrosive", i);
    }

    val stoneDest as IItemStack[] = [
        <bloodmagic:demon_brick_1:2>,
        <bloodmagic:demon_brick_2:2>,
        <bloodmagic:demon_brick_2:7>,
        <bloodmagic:demon_extras:2>,
        <bloodmagic:demon_extras:7>,
        <bloodmagic:demon_pillar_1:2>,
        <bloodmagic:demon_pillar_cap_2:0>
    ];
    for i in stoneDest {
        HiiragiUtils.removeCrafting(i);
        chisel.addVariation("will_destructive", i);
    }

    val stoneVeng as IItemStack[] = [
        <bloodmagic:demon_brick_1:3>,
        <bloodmagic:demon_brick_2:3>,
        <bloodmagic:demon_brick_2:8>,
        <bloodmagic:demon_extras:3>,
        <bloodmagic:demon_extras:8>,
        <bloodmagic:demon_pillar_1:3>,
        <bloodmagic:demon_pillar_cap_2:2>
    ];
    for i in stoneVeng {
        HiiragiUtils.removeCrafting(i);
        chisel.addVariation("will_vengeful", i);
    }

    val stoneStea as IItemStack[] = [
    <bloodmagic:demon_brick_1:4>,
    <bloodmagic:demon_brick_2:4>,
    <bloodmagic:demon_brick_2:9>,
    <bloodmagic:demon_extras:4>,
    <bloodmagic:demon_extras:9>,
    <bloodmagic:demon_pillar_1:4>,
    <bloodmagic:demon_pillar_cap_3:0>
    ];
    for i in stoneStea {
        HiiragiUtils.removeCrafting(i);
        chisel.addVariation("will_steadfast", i);
    }

    for i in 0 to 4 {
        HiiragiUtils.addCrafting(false, false, <bloodmagic:demon_extras>.definition.makeStack(i)*8,RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<ore:stone>, B:<bloodmagic:item_demon_crystal>.definition.makeStack(i)}).ingredients);
    }

//ThaumcraftのCrucibleレシピを編集
    HiiragiUtils.addCrucibleArcane("", <bloodmagic:lava_crystal>, <minecraft:lava_bucket>, [<aspect:vitreus>*16, <aspect:victus>*16]);

//このscriptの読み込みの完了をログに出力
print("bloodmagic.zs loaded!");
