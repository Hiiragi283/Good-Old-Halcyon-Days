#======================================================================
# name : armor.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Edit armor recipes
#        Some scripts are partially referred to Nomifactory
#        -> https://github.com/Nomifactory/Nomifactory/
#======================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.recipes.IRecipeFunction;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import mods.gregtech.recipe.RecipeMap;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading armor.zs ...");

//変数の定義

val toRemove as IItemStack[] = [
    <minecraft:chainmail_helmet>,
    <minecraft:chainmail_chestplate>,
    <minecraft:chainmail_leggings>,
    <minecraft:chainmail_boots>,
    <minecraft:iron_helmet>,
    <minecraft:iron_chestplate>,
    <minecraft:iron_leggings>,
    <minecraft:iron_boots>,
    <minecraft:diamond_helmet>,
    <minecraft:diamond_chestplate>,
    <minecraft:diamond_leggings>,
    <minecraft:diamond_boots>,
    <minecraft:golden_helmet>,
    <minecraft:golden_chestplate>,
    <minecraft:golden_leggings>,
    <minecraft:golden_boots>,
    <botania:manasteelhelm>,
    <botania:manasteelchest>,
    <botania:manasteellegs>,
    <botania:manasteelboots>,
    <botania:terrasteelhelm>,
    <botania:terrasteelchest>,
    <botania:terrasteellegs>,
    <botania:terrasteelboots>,
    <botania:elementiumhelm>,
    <botania:elementiumchest>,
    <botania:elementiumlegs>,
    <botania:elementiumboots>
];
for i in toRemove {
    HiiragiUtils.removeCrafting(i);
}

val armorTier as IItemStack[][string] = {
    "gohd.tooltip.armor.common.name": [
        <minecraft:chainmail_helmet>,
        <minecraft:chainmail_chestplate>,
        <minecraft:chainmail_leggings>,
        <minecraft:chainmail_boots>,
        <minecraft:golden_helmet>,
        <minecraft:golden_chestplate>,
        <minecraft:golden_leggings>,
        <minecraft:golden_boots>,
        <twilightforest:arctic_helmet>,
        <twilightforest:arctic_chestplate>,
        <twilightforest:arctic_leggings>,
        <twilightforest:arctic_boots>
    ],
    "gohd.tooltip.armor.uncommon.name": [
        <minecraft:iron_helmet>,
        <minecraft:iron_chestplate>,
        <minecraft:iron_leggings>,
        <minecraft:iron_boots>,
        <thaumcraft:goggles>,
        <thaumcraft:thaumium_helm>,
        <thaumcraft:thaumium_chest>,
        <thaumcraft:thaumium_legs>,
        <thaumcraft:thaumium_boots>,
        <thaumcraft:cloth_chest>,
        <thaumcraft:cloth_legs>,
        <thaumcraft:cloth_boots>,
        <thaumcraft:crimson_plate_helm>,
        <thaumcraft:crimson_plate_chest>,
        <thaumcraft:crimson_plate_legs>,
        <twilightforest:ironwood_helmet>,
        <twilightforest:ironwood_chestplate>,
        <twilightforest:ironwood_leggings>,
        <twilightforest:ironwood_boots>
    ],
    "gohd.tooltip.armor.rare.name": [
        <minecraft:diamond_helmet>,
        <minecraft:diamond_chestplate>,
        <minecraft:diamond_leggings>,
        <minecraft:diamond_boots>,
        <bloodmagic:sentient_armour_helmet>,
        <bloodmagic:sentient_armour_chest>,
        <bloodmagic:sentient_armour_leggings>,
        <bloodmagic:sentient_armour_boots>,
        <botania:manasteelhelm>,
        <botania:manasteelhelmreveal>,
        <botania:manasteelchest>,
        <botania:manasteellegs>,
        <botania:manasteelboots>,
        <botania:manaweavehelm>,
        <botania:manaweavechest>,
        <botania:manaweavelegs>,
        <botania:manaweaveboots>,
        <thaumcraft:void_helm>,
        <thaumcraft:void_chest>,
        <thaumcraft:void_legs>,
        <thaumcraft:void_boots>,
        <thaumcraft:crimson_boots>,
        <thaumcraft:crimson_robe_helm>,
        <thaumcraft:crimson_robe_chest>,
        <thaumcraft:crimson_robe_legs>,
        <thaumcraft:crimson_praetor_helm>,
        <thaumcraft:crimson_praetor_chest>,
        <thaumcraft:crimson_praetor_legs>,
        <thaumicaugmentation:thaumium_robes_hood>,
        <thaumicaugmentation:thaumium_robes_chestplate>,
        <thaumicaugmentation:thaumium_robes_leggings>,
        <twilightforest:naga_chestplate>,
        <twilightforest:naga_leggings>,
        <twilightforest:steeleaf_helmet>,
        <twilightforest:steeleaf_chestplate>,
        <twilightforest:steeleaf_leggings>,
        <twilightforest:steeleaf_boots>,
        <twilightforest:knightmetal_helmet>,
        <twilightforest:knightmetal_chestplate>,
        <twilightforest:knightmetal_leggings>,
        <twilightforest:knightmetal_boots>
    ],
    "gohd.tooltip.armor.epic.name": [
        <botania:terrasteelhelm>,
        <botania:terrasteelhelmreveal>,
        <botania:terrasteelchest>,
        <botania:terrasteellegs>,
        <botania:terrasteelboots>,
        <botania:elementiumhelm>,
        <botania:elementiumhelmreveal>,
        <botania:elementiumchest>,
        <botania:elementiumlegs>,
        <botania:elementiumboots>,
        <enderio:item_dark_steel_helmet>,
        <enderio:item_dark_steel_chestplate>,
        <enderio:item_dark_steel_leggings>,
        <enderio:item_dark_steel_boots>,
        <thaumcraft:traveller_boots>,
        <thaumcraft:fortress_helm>,
        <thaumcraft:fortress_chest>,
        <thaumcraft:fortress_legs>,
        <thaumcraft:void_robe_helm>,
        <thaumcraft:void_robe_chest>,
        <thaumcraft:void_robe_legs>,
        <twilightforest:fiery_helmet>,
        <twilightforest:fiery_chestplate>,
        <twilightforest:fiery_leggings>,
        <twilightforest:fiery_boots>,
        <twilightforest:yeti_helmet>,
        <twilightforest:yeti_chestplate>,
        <twilightforest:yeti_leggings>,
        <twilightforest:yeti_boots>
    ],
    "gohd.tooltip.armor.legendary.name": [
        <astralsorcery:itemcape>,
        <bloodmagic:living_armour_helmet>,
        <bloodmagic:living_armour_chest>,
        <bloodmagic:living_armour_leggings>,
        <bloodmagic:living_armour_boots>,
        <enderio:item_end_steel_helmet>,
        <enderio:item_end_steel_chestplate>,
        <enderio:item_end_steel_leggings>,
        <enderio:item_end_steel_boots>,
        <projecte:item.pe_dm_armor_3>,
        <projecte:item.pe_dm_armor_2>,
        <projecte:item.pe_dm_armor_1>,
        <projecte:item.pe_dm_armor_0>,
        <projecte:item.pe_rm_armor_3>,
        <projecte:item.pe_rm_armor_2>,
        <projecte:item.pe_rm_armor_1>,
        <projecte:item.pe_rm_armor_0>,
        <thaumadditions:adaminite_hood>,
        <thaumadditions:adaminite_robe>,
        <thaumadditions:adaminite_belt>,
        <thaumadditions:adaminite_boots>,
        <thaumicaugmentation:void_boots>,
        <twilightforest:phantom_helmet>,
        <twilightforest:phantom_chestplate>
    ],
    "gohd.tooltip.armor.mythic.name": [
        <projecte:item.pe_gem_armor_3>,
        <projecte:item.pe_gem_armor_2>,
        <projecte:item.pe_gem_armor_1>,
        <projecte:item.pe_gem_armor_0>,
        <thaumadditions:mithminite_hood>,
        <thaumadditions:mithminite_robe>,
        <thaumadditions:mithminite_belt>,
        <thaumadditions:mithminite_boots>
    ]
};

for tier, items in armorTier {
    for item in items {
        item.addTooltip(I18n.format(tier));
    }
}

//Chain Armor (vanilla)
    
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A"]).map({A:<ore:ringWroughtIron>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_helmet>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 10)
        .addTool(<ore:GT.tool.wirecutter>, 10)
        .addOutput(<minecraft:chainmail_helmet>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:chainmail_helmet>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "AAA", "AAA"]).map({A:<ore:ringWroughtIron>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_chestplate>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 10)
        .addTool(<ore:GT.tool.wirecutter>, 10)
        .addOutput(<minecraft:chainmail_chestplate>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:chainmail_chestplate>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A", "A A"]).map({A:<ore:ringWroughtIron>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_leggings>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 10)
        .addTool(<ore:GT.tool.wirecutter>, 10)
        .addOutput(<minecraft:chainmail_leggings>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:chainmail_leggings>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "A A"]).map({A:<ore:ringWroughtIron>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_boots>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 10)
        .addTool(<ore:GT.tool.wirecutter>, 10)
        .addOutput(<minecraft:chainmail_boots>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:chainmail_boots>))
        .create();


//Iron Armor (vanilla)
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A"]).map({A:<ore:plateWroughtIron>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_helmet>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 20)
        .addTool(<ore:GT.tool.wirecutter>, 20)
        .addOutput(<minecraft:iron_helmet>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:iron_helmet>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "AAA", "AAA"]).map({A:<ore:plateWroughtIron>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_chestplate>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 20)
        .addTool(<ore:GT.tool.wirecutter>, 20)
        .addOutput(<minecraft:iron_chestplate>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:iron_chestplate>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A", "A A"]).map({A:<ore:plateWroughtIron>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_leggings>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 20)
        .addTool(<ore:GT.tool.wirecutter>, 20)
        .addOutput(<minecraft:iron_leggings>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:iron_leggings>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "A A"]).map({A:<ore:plateWroughtIron>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_boots>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 20)
        .addTool(<ore:GT.tool.wirecutter>, 20)
        .addOutput(<minecraft:iron_boots>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:iron_boots>))
        .create();

//Diamond Armor (vanilla)
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A"]).map({A:<ore:plateDiamond>}).ingredients)
        .setSecondaryIngredients([<minecraft:iron_helmet>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 40)
        .addTool(<ore:GT.tool.wirecutter>, 40)
        .addOutput(<minecraft:diamond_helmet>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:diamond_helmet>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "AAA", "AAA"]).map({A:<ore:plateDiamond>}).ingredients)
        .setSecondaryIngredients([<minecraft:iron_chestplate>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 40)
        .addTool(<ore:GT.tool.wirecutter>, 40)
        .addOutput(<minecraft:diamond_chestplate>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:diamond_chestplate>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A", "A A"]).map({A:<ore:plateDiamond>}).ingredients)
        .setSecondaryIngredients([<minecraft:iron_leggings>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 40)
        .addTool(<ore:GT.tool.wirecutter>, 40)
        .addOutput(<minecraft:diamond_leggings>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:diamond_leggings>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "A A"]).map({A:<ore:plateDiamond>}).ingredients)
        .setSecondaryIngredients([<minecraft:iron_boots>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 40)
        .addTool(<ore:GT.tool.wirecutter>, 40)
        .addOutput(<minecraft:diamond_boots>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:diamond_boots>))
        .create();

//Gold Armor (Vanilla)
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A"]).map({A:<ore:plateGold>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_helmet>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 10)
        .addTool(<ore:GT.tool.wirecutter>, 10)
        .addOutput(<minecraft:golden_helmet>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:golden_helmet>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "AAA", "AAA"]).map({A:<ore:plateGold>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_chestplate>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 10)
        .addTool(<ore:GT.tool.wirecutter>, 10)
        .addOutput(<minecraft:golden_chestplate>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:golden_chestplate>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A", "A A"]).map({A:<ore:plateGold>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_leggings>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 10)
        .addTool(<ore:GT.tool.wirecutter>, 10)
        .addOutput(<minecraft:golden_leggings>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:golden_leggings>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "A A"]).map({A:<ore:plateGold>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_boots>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 10)
        .addTool(<ore:GT.tool.wirecutter>, 10)
        .addOutput(<minecraft:golden_boots>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:golden_boots>))
        .create();

//Manasteel Armor (Botania)
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "ABA"]).map({A:<ore:plateManasteel>, B:<botania:manaresource:22>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_helmet>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 40)
        .addTool(<ore:GT.tool.wirecutter>, 40)
        .addOutput(<botania:manasteelhelm>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:manasteelhelm>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["ABA", "AAA", "AAA"]).map({A:<ore:plateManasteel>, B:<botania:manaresource:22>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_chestplate>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 40)
        .addTool(<ore:GT.tool.wirecutter>, 40)
        .addOutput(<botania:manasteelchest>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:manasteelchest>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "ABA", "A A"]).map({A:<ore:plateManasteel>, B:<botania:manaresource:22>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_leggings>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 40)
        .addTool(<ore:GT.tool.wirecutter>, 40)
        .addOutput(<botania:manasteellegs>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:manasteellegs>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["ABA", "A A"]).map({A:<ore:plateManasteel>, B:<botania:manaresource:22>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_boots>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 40)
        .addTool(<ore:GT.tool.wirecutter>, 40)
        .addOutput(<botania:manasteelboots>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:manasteelboots>))
        .create();

//Terrasteel Armor (Botania)
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "BCB", "BDB"]).map({A:<botania:manaresource:3>, B:<ore:plateTerrasteel>, C:<ore:plateDoubleTerrasteel>, D:<ore:runeSpringB>}).ingredients)
        .setSecondaryIngredients([<botania:manasteelhelm>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 80)
        .addTool(<ore:GT.tool.wirecutter>, 80)
        .addOutput(<botania:terrasteelhelm>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:terrasteelhelm>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "BCB", "BDB"]).map({A:<botania:manaresource:3>, B:<ore:plateTerrasteel>, C:<ore:plateDoubleTerrasteel>, D:<ore:runeSpringB>}).ingredients)
        .setSecondaryIngredients([<botania:manasteelhelmreveal>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 80)
        .addTool(<ore:GT.tool.wirecutter>, 80)
        .addOutput(<botania:terrasteelhelmreveal>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:terrasteelhelmreveal>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AA AA", "BBCBB", "ABBBA", "D   D"]).map({A:<botania:manaresource:3>, B:<ore:plateDoubleTerrasteel>, C:<ore:runeSummerB>, D:<ore:plateTerrasteel>}).ingredients)
        .setSecondaryIngredients([<botania:manasteelchest>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 80)
        .addTool(<ore:GT.tool.wirecutter>, 80)
        .addOutput(<botania:terrasteelchest>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:terrasteelchest>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["ABA", "CDC"]).map({A:<ore:plateDoubleTerrasteel>, B:<ore:runeAutumnB>, C:<ore:plateTerrasteel>, D:<contenttweaker:plate_livingwood>}).ingredients)
        .setSecondaryIngredients([<botania:manasteellegs>.marked("armor")])
        .addTool(<ore:GT.tool.hammer.hard>, 80)
        .addTool(<ore:GT.tool.wirecutter>, 80)
        .addOutput(<botania:terrasteellegs>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:terrasteellegs>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AB BA", "AC CA"]).map({A:<botania:manaresource:3>, B:<ore:woolGreen>, C:<ore:plateDoubleTerrasteel>}).ingredients)
        .setSecondaryIngredients([<botania:manasteelboots>.marked("armor"), <ore:runeWinterB>])
        .addTool(<ore:GT.tool.hammer.hard>, 80)
        .addTool(<ore:GT.tool.wirecutter>, 80)
        .addOutput(<botania:terrasteelboots>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:terrasteelboots>))
        .create();

//Elementium Armor (Botania)
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "BCB", "B B"]).map({A:<botania:manaresource:8>, B:<ore:plateElvenElementium>, C:<ore:plateDoubleElvenElementium>}).ingredients)
        .setSecondaryIngredients([<botania:manasteelhelm>.marked("armor"), <ore:dustCryotheum>*4])
        .addTool(<ore:GT.tool.hammer.hard>, 80)
        .addTool(<ore:GT.tool.wirecutter>, 80)
        .addOutput(<botania:elementiumhelm>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:elementiumhelm>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "BCB", "B B"]).map({A:<botania:manaresource:8>, B:<ore:plateElvenElementium>, C:<ore:plateDoubleElvenElementium>}).ingredients)
        .setSecondaryIngredients([<botania:manasteelhelmreveal>.marked("armor"), <ore:dustCryotheum>*4])
        .addTool(<ore:GT.tool.hammer.hard>, 80)
        .addTool(<ore:GT.tool.wirecutter>, 80)
        .addOutput(<botania:elementiumhelmreveal>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:elementiumhelmreveal>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A   A", "BB BB", "CBBBC", "C   C"]).map({A:<botania:manaresource:8>, B:<ore:plateDoubleElvenElementium>, C:<ore:plateElvenElementium>}).ingredients)
        .setSecondaryIngredients([<botania:manasteelchest>.marked("armor"), <ore:dustPyrotheum>*4])
        .addTool(<ore:GT.tool.hammer.hard>, 80)
        .addTool(<ore:GT.tool.wirecutter>, 80)
        .addOutput(<botania:elementiumchest>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:elementiumchest>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["ABA", "CBC"]).map({A:<ore:plateDoubleElvenElementium>, B:<ore:plateSilver>, C:<ore:plateElvenElementium>, D:<contenttweaker:plate_livingwood>}).ingredients)
        .setSecondaryIngredients([<botania:manasteellegs>.marked("armor"), <ore:dustPetrotheum>*4])
        .addTool(<ore:GT.tool.hammer.hard>, 80)
        .addTool(<ore:GT.tool.wirecutter>, 80)
        .addOutput(<botania:elementiumlegs>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:elementiumlegs>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "B B"]).map({A:<botania:manaresource:8>, B:<ore:plateElvenElementium>}).ingredients)
        .setSecondaryIngredients([<botania:manasteelboots>.marked("armor"), <ore:dustAerotheum>*4])
        .addTool(<ore:GT.tool.hammer.hard>, 80)
        .addTool(<ore:GT.tool.wirecutter>, 80)
        .addOutput(<botania:elementiumboots>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:elementiumboots>))
        .create();

//Darksteel Armor (EnderIO)

//Endsteel Armor (EnderIO)

//NanoMuscle Suite (gregTech)

//QuarkTech Suite (GregTech)

//Dark Matter Armor (ProjectE)

//Red Matter Armor (ProjectE)

//gem Armor (ProjectE)

//Thaumium Armor (Thaumcraft6)

//Thaumaturge Armor (thaumcraft6)

//Thaumium Fortress Armor (Thaumcraft6)

//Void Armor (thaumcraft6)

//Crimson Cult Armor (thaumcraft6)

//Crimson Praetor Armor (thaumcraft6)

//Naga Scale Armor (Twilightforest)

//Ironwood Armor (Twilightforest)

//Fiery Armor (Twilightforest)

//Steeleaf Armor (Twilightforest)

//Knightly Armor (Twilightforest)

//Yeti Armor (Twilightforest)

//Arctic Armor (Twilightforest)


    /*
    <recipemap:name>.recipeBuilder()
        .inputs([])
        .outputs()
        .duration()
        .EUt()
        .buildAndRegister();
    */

//このscriptの読み込みの完了をログに出力
print("armor.zs loaded!");
