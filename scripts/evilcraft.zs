#======================================================================
# name : evilcraft.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Scripts for Evilcraft
#======================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.bloodmagic.AlchemyArray;
import mods.bloodmagic.BloodAltar;
import mods.ctintegration.util.RecipePattern;
import mods.evilcraft.BloodInfuser;
import mods.gregtech.recipe.RecipeMap;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading evilcraft.zs ...");

//変数の定義

//作業台レシピの編集
    //削除
        val removeCrafting as IItemStack[] = [
            <evilcraft:purifier>,
            <evilcraft:dark_brick>,
            <evilcraft:eternal_water_block>,
            <evilcraft:dark_stick>,
            <evilcraft:blood_pearl_of_teleportation>,
            <evilcraft:inverted_potentia>,
            <evilcraft:exalted_crafter:0>,
            <evilcraft:exalted_crafter:1>,
            <evilcraft:darkened_apple>,
            <evilcraft:golden_string>,
            <evilcraft:biome_extract>,
            <evilcraft:spectral_glasses>,
        ];
        for i in removeCrafting {
            HiiragiUtils.removeCrafting(i);
        }
    //上書き
        HiiragiUtils.addCrafting(false, true, <evilcraft:spirit_furnace>, RecipePattern.init(["ABA", "ACA", "ADA"]).map({A:<evilcraft:dark_blood_brick>, B:<evilcraft:blood_infusion_core>, C:<enderio:item_material:53>, D:<botania:manaresource:5>}).ingredients);
        HiiragiUtils.addCrafting(false, true, <evilcraft:sanguinary_pedestal:0>, RecipePattern.init(["AAA", " B ", "AAA"]).map({A:<metaitem:plateDark>, B:<evilcraft:dark_block>}).ingredients);
        HiiragiUtils.addCrafting(false, true, <evilcraft:sanguinary_pedestal:1>, RecipePattern.init([" A ", "ABA", " A "]).map({A:<metaitem:plateDarkPower>, B:<evilcraft:sanguinary_pedestal:0>}).ingredients);
        HiiragiUtils.addCrafting(false, true, <evilcraft:spirit_reanimator>, RecipePattern.init(["ABA", "ACA", "ADA"]).map({A:<evilcraft:bloody_cobblestone>, B:<evilcraft:blood_infusion_core>, C:<enderio:item_material:53>, D:<botania:manaresource:5>}).ingredients);
        HiiragiUtils.addCrafting(false, true, <evilcraft:colossal_blood_chest>, RecipePattern.init(["ABA", "ACA", "ADA"]).map({A:<evilcraft:reinforced_undead_plank>, B:<evilcraft:blood_infusion_core>, C:<evilcraft:blood_chest>, D:<botania:manaresource:5>}).ingredients);
        HiiragiUtils.addCrafting(false, true, <evilcraft:sanguinary_environmental_accumulator>, RecipePattern.init(["ABA", "ACA", "ADA"]).map({A:<evilcraft:bloody_cobblestone>, B:<evilcraft:environmental_accumulation_core>, C:<enderio:item_material:53>, D:<botania:manaresource:5>}).ingredients);
        HiiragiUtils.addCrafting(false, true, <evilcraft:vengeance_focus>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<metaitem:dustDark>, B:<enderio:item_alloy_ingot:6>, C:<thaumcraft:focus_2>}).ingredients);
        HiiragiUtils.addCrafting(true, true, <evilcraft:dull_dust>*3, [[<ore:dustSugar>, <ore:dustSalt>, <ore:dustWheat>]]);
        HiiragiUtils.addCrafting(true, true, <evilcraft:blood_orb:0>, [[<ore:blockGlass>, HiiragiUtils.toolInput(<extrautils2:glasscutter>,1)]]);

        HiiragiUtils.addCrafting(false, true, <evilcraft:piercing_vengeance_focus>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<evilcraft:blood_orb:1>, B:<botanicadds:gaiasteel_ingot>, C:<thaumcraft:focus_3>}).ingredients);

        recipes.replaceAllOccurences(<minecraft:cobblestone>, <evilcraft:bloody_cobblestone>, <evilcraft:blood_infuser>);
        recipes.replaceAllOccurences(<minecraft:iron_ingot>, <metaitem:screwWroughtIron>, <evilcraft:dark_spike>);
        recipes.replaceAllOccurences(<evilcraft:dark_gem_crushed>, <metaitem:dustDark>);
        recipes.replaceAllOccurences(<evilcraft:dark_stick>, <metaitem:stickDark>);
    //新規
        HiiragiUtils.addCrafting(false, true, <evilcraft:sanguinary_pedestal:1>, RecipePattern.init(["AAA", " B ", "AAA"]).map({A:<metaitem:plateDarkPower>, B:<evilcraft:dark_power_gem_block>}).ingredients);
        HiiragiUtils.addCrafting(true, false, <metaitem:dustDark>, [[<evilcraft:dark_gem_crushed>]]);

        HiiragiUtils.addCraftingConv(<evilcraft:dark_block>, <metaitem:blockDark>);
        HiiragiUtils.addCraftingConv(<evilcraft:dark_power_gem_block>, <metaitem:blockDarkPower>);
        HiiragiUtils.addCraftingConv(<evilcraft:blood_waxed_coal>, <metaitem:gemCoalBlood>);
        HiiragiUtils.addCraftingConv(<evilcraft:blood_waxed_coal_block>, <metaitem:blockCoalBlood>);
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

    /*
    <recipemap:name>.recipeBuilder()
        .inputs([])
        .outputs()
        .duration()
        .EUt()
        .buildAndRegister();
    */

//Blood Infuserのレシピを調整
    val removeInfuser as IItemStack[] = [
        <minecraft:spider_eye>,
        <minecraft:grass>,
        <minecraft:blaze_rod>,
        <minecraft:ghast_tear>,
        <tconstruct:materials:17>
    ];
    for i in removeInfuser {
        mods.evilcraft.BloodInfuser.removeRecipesWithOutput(i);
    }

    mods.evilcraft.BloodInfuser.addRecipe(<thaumcraft:crucible>, <liquid:evilcraftblood> * 5000, 0, <evilcraft:purifier>, 50, 10);

//Alchemy Arrayのレシピを追加
    AlchemyArray.addRecipe(<evilcraft:dark_brick>*2, <tconstruct:seared:3>, <evilcraft:dark_gem>);
    AlchemyArray.addRecipe(<evilcraft:dark_brick>*4, <thaumcraft:stone_arcane>, <evilcraft:dark_gem>);
    AlchemyArray.addRecipe(<evilcraft:eternal_water_block>, <evilcraft:dark_block>, <evilcraft:weather_container:2>);
    AlchemyArray.addRecipe(<evilcraft:blood_pearl_of_teleportation>, <minecraft:ender_pearl>, <evilcraft:dark_power_gem_block>);
    AlchemyArray.addRecipe(<evilcraft:blood_pearl_of_teleportation>, <minecraft:ender_pearl>, <evilcraft:dark_power_gem_block>);
    //AlchemyArray.addRecipe(<evilcraft:vengeance_ring>, <metaitem:ringDarkSteel>, <evilcraft:dark_gem_crushed>);
    AlchemyArray.addRecipe(<evilcraft:inverted_potentia>, <evilcraft:potentia_sphere>, <metaitem:dustDark>);
    AlchemyArray.addRecipe(<evilcraft:exalted_crafter:0>, <tconstruct:tooltables:0>, <minecraft:ender_chest>);
    AlchemyArray.addRecipe(<evilcraft:exalted_crafter:1>, <tconstruct:tooltables:0>, <minecraft:chest>);
    AlchemyArray.addRecipe(<evilcraft:bucket_eternal_water>, <evilcraft:dark_block>, <minecraft:bucket>);
    AlchemyArray.addRecipe(<evilcraft:darkened_apple>, <minecraft:apple>, <evilcraft:dark_gem>);
    AlchemyArray.addRecipe(<evilcraft:golden_string>, <minecraft:string>, <minecraft:gold_ingot>);
    AlchemyArray.addRecipe(<evilcraft:biome_extract>, <extrautils2:decorativeglass:3>, <evilcraft:dark_gem>);
    AlchemyArray.addRecipe(<evilcraft:spectral_glasses>, <thaumcraft:goggles>, <evilcraft:vengeance_ring>);

//Blood Altarのレシピを追加
    mods.bloodmagic.BloodAltar.addRecipe(<evilcraft:dark_power_gem>, <evilcraft:dark_gem>, 0, 1000, 5, 5);

//このscriptの読み込みの完了をログに出力
print("evilcraft.zs loaded!");
