#======================================================================
# name : armor.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Edit armor recipes
#        Some scripts are partially referred to Nomifactory
#        -> https://github.com/Nomifactory/Nomifactory/
#======================================================================

#priority 90

//crafttweakerからclassをimport
import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.recipes.IRecipeFunction;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading armor.zs ...");

//変数の定義

val toRemove as IItemStack[] = [
	<minecraft:leather_helmet>,
    <minecraft:leather_chestplate>,
    <minecraft:leather_leggings>,
    <minecraft:leather_boots>,
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
    <botania:elementiumboots>,
	<dcs_climate:dcs_met_brass>,
	<dcs_climate:dcs_plate_brass>,
	<dcs_climate:dcs_leggins_brass>,
	<dcs_climate:dcs_boots_brass>,
	<dcs_climate:dcs_met_chalcedony>,
	<dcs_climate:dcs_plate_chalcedony>,
	<dcs_climate:dcs_leggins_chalcedony>,
	<dcs_climate:dcs_boots_chalcedony>,
	<dcs_climate:dcs_met_sapphire>,
	<dcs_climate:dcs_met_steel>,
	<dcs_climate:dcs_plate_steel>,
	<dcs_climate:dcs_leggins_steel>,
	<dcs_climate:dcs_boots_steel>,
	<dcs_climate:dcs_plate_sapphire>,
	<dcs_climate:dcs_leggins_sapphire>,
	<dcs_climate:dcs_boots_sapphire>,
	<dcs_climate:dcs_met_titanium>,
	<dcs_climate:dcs_plate_titanium>,
	<dcs_climate:dcs_leggins_titanium>,
	<dcs_climate:dcs_boots_titanium>,
	<dcs_climate:dcs_met_silver>,
	<dcs_climate:dcs_plate_silver>,
	<dcs_climate:dcs_leggins_silver>,
	<dcs_climate:dcs_boots_silver>,
	<twilightforest:naga_chestplate>.withTag({ench: [{lvl: 3 as short, id: 1 as short}]}),
    <twilightforest:naga_leggings>.withTag({ench: [{lvl: 3 as short, id: 0 as short}]}),
	<twilightforest:ironwood_helmet>.withTag({ench: [{lvl: 1 as short, id: 6 as short}]}),
	<twilightforest:ironwood_chestplate>.withTag({ench: [{lvl: 1 as short, id: 0 as short}]}),
	<twilightforest:ironwood_leggings>.withTag({ench: [{lvl: 1 as short, id: 0 as short}]}),
	<twilightforest:ironwood_boots>.withTag({ench: [{lvl: 1 as short, id: 2 as short}]}),
	<twilightforest:steeleaf_helmet>,
    <twilightforest:steeleaf_chestplate>,
    <twilightforest:steeleaf_leggings>,
    <twilightforest:steeleaf_boots>,
	<twilightforest:fiery_helmet>,
    <twilightforest:fiery_chestplate>,
    <twilightforest:fiery_leggings>,
    <twilightforest:fiery_boots>,
	<twilightforest:steeleaf_helmet>,
	<twilightforest:steeleaf_chestplate>,
	<twilightforest:steeleaf_leggings>,
	<twilightforest:steeleaf_boots>,
	<twilightforest:knightmetal_helmet>,
    <twilightforest:knightmetal_chestplate>,
    <twilightforest:knightmetal_leggings>,
    <twilightforest:knightmetal_boots>,
	<twilightforest:yeti_helmet>.withTag({ench: [{lvl: 2 as short, id: 0 as short}]}),
	<twilightforest:yeti_chestplate>.withTag({ench: [{lvl: 2 as short, id: 0 as short}]}),
	<twilightforest:yeti_leggings>.withTag({ench: [{lvl: 2 as short, id: 0 as short}]}),
	<twilightforest:yeti_boots>.withTag({ench: [{lvl: 2 as short, id: 0 as short}, {lvl: 4 as short, id: 2 as short}]}),
	<twilightforest:arctic_helmet>,
	<twilightforest:arctic_chestplate>,
	<twilightforest:arctic_leggings>,
	<twilightforest:arctic_boots>,
	<thermalfoundation:armor.helmet_bronze>,
	<thermalfoundation:armor.plate_bronze>,
	<thermalfoundation:armor.legs_bronze>,
	<thermalfoundation:armor.boots_bronze>,
	<thermalfoundation:armor.helmet_invar>,
	<thermalfoundation:armor.plate_invar>,
	<thermalfoundation:armor.legs_invar>,
	<thermalfoundation:armor.boots_invar>,
	<thermalfoundation:armor.helmet_lead>,
	<thermalfoundation:armor.plate_lead>,
	<thermalfoundation:armor.legs_lead>,
	<thermalfoundation:armor.boots_lead>,
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
		<railcraft:armor_overalls>,
        <twilightforest:arctic_helmet>,
        <twilightforest:arctic_chestplate>,
        <twilightforest:arctic_leggings>,
        <twilightforest:arctic_boots>
    ],
    "gohd.tooltip.armor.uncommon.name": [
		<dcs_climate:dcs_met_brass>,
		<dcs_climate:dcs_plate_brass>,
		<dcs_climate:dcs_leggins_brass>,
		<dcs_climate:dcs_boots_brass>,
		<dcs_climate:dcs_met_sapphire>,
		<dcs_climate:dcs_plate_sapphire>,
		<dcs_climate:dcs_leggins_sapphire>,
		<dcs_climate:dcs_boots_sapphire>,
		<dcs_climate:dcs_met_silver>,
		<dcs_climate:dcs_plate_silver>,
		<dcs_climate:dcs_leggins_silver>,
		<dcs_climate:dcs_boots_silver>,
        <minecraft:iron_helmet>,
        <minecraft:iron_chestplate>,
        <minecraft:iron_leggings>,
        <minecraft:iron_boots>,
		<tcomplement:knightslime_helmet>,
		<tcomplement:knightslime_chestplate>,
		<tcomplement:knightslime_leggings>,
		<tcomplement:knightslime_boots>,
		<thermalfoundation:armor.helmet_lead>,
		<thermalfoundation:armor.plate_lead>,
		<thermalfoundation:armor.legs_lead>,
		<thermalfoundation:armor.boots_lead>,
		<thermalfoundation:armor.helmet_invar>,
		<thermalfoundation:armor.plate_invar>,
		<thermalfoundation:armor.legs_invar>,
		<thermalfoundation:armor.boots_invar>,
		<thermalfoundation:armor.helmet_bronze>,
		<thermalfoundation:armor.plate_bronze>,
		<thermalfoundation:armor.legs_bronze>,
		<thermalfoundation:armor.boots_bronze>,
        <twilightforest:ironwood_helmet>,
        <twilightforest:ironwood_chestplate>,
        <twilightforest:ironwood_leggings>,
        <twilightforest:ironwood_boots>,
    ],
    "gohd.tooltip.armor.rare.name": [
		<dcs_climate:dcs_met_steel>,
		<dcs_climate:dcs_plate_steel>,
		<dcs_climate:dcs_leggins_steel>,
		<dcs_climate:dcs_boots_steel>,
		<dcs_climate:dcs_met_titanium>,
		<dcs_climate:dcs_plate_titanium>,
		<dcs_climate:dcs_leggins_titanium>,
		<dcs_climate:dcs_boots_titanium>,
        <minecraft:diamond_helmet>,
        <minecraft:diamond_chestplate>,
        <minecraft:diamond_leggings>,
        <minecraft:diamond_boots>,
        <botania:manasteelhelm>,
        <botania:manasteelhelmreveal>,
        <botania:manasteelchest>,
        <botania:manasteellegs>,
        <botania:manasteelboots>,
        <botania:manaweavehelm>,
        <botania:manaweavechest>,
        <botania:manaweavelegs>,
        <botania:manaweaveboots>,
		<tcomplement:manyullyn_helmet>,
		<tcomplement:manyullyn_chestplate>,
		<tcomplement:manyullyn_leggings>,
		<tcomplement:manyullyn_boots>,
		<techreborn:lithiumbatpack>,
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
		<dcs_climate:dcs_met_chalcedony>,
		<dcs_climate:dcs_plate_chalcedony>,
		<dcs_climate:dcs_leggins_chalcedony>,
		<dcs_climate:dcs_boots_chalcedony>,
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
		<railcraft:armor_goggles>,
		<techreborn:lapotronpack>,
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
		<dcs_climate:dcs_gemboots_blue>,
		<dcs_climate:dcs_gemboots_green>,
        <enderio:item_end_steel_helmet>,
        <enderio:item_end_steel_chestplate>,
        <enderio:item_end_steel_leggings>,
        <enderio:item_end_steel_boots>,
        //<projecte:item.pe_dm_armor_3>,
        //<projecte:item.pe_dm_armor_2>,
        //<projecte:item.pe_dm_armor_1>,
        //<projecte:item.pe_dm_armor_0>,
        //<projecte:item.pe_rm_armor_3>,
        //<projecte:item.pe_rm_armor_2>,
        //<projecte:item.pe_rm_armor_1>,
        //<projecte:item.pe_rm_armor_0>,
		<techreborn:cloakingdevice>,
        <twilightforest:phantom_helmet>,
        <twilightforest:phantom_chestplate>
    ],
    "gohd.tooltip.armor.mythic.name": [
        //<projecte:item.pe_gem_armor_3>,
        //<projecte:item.pe_gem_armor_2>,
        //<projecte:item.pe_gem_armor_1>,
        //<projecte:item.pe_gem_armor_0>,
    ]
};

for i, j in armorTier {
    for k in j {
        k.addTooltip(I18n.format(i));
    }
}

//Leather Armor (vanilla)
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "ABA"]).map({A:<ore:itemLeather>, B:<ore:itemCloth>}).ingredients)
        .addTool(<ore:artisansHammer>, 10)
        .addTool(<ore:artisansCutters>, 10)
        .addOutput(<minecraft:leather_helmet>)
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["ABA", "AAA", "AAA"]).map({A:<ore:itemLeather>, B:<ore:itemCloth>}).ingredients)
        .addTool(<ore:artisansHammer>, 10)
        .addTool(<ore:artisansCutters>, 10)
        .addOutput(<minecraft:leather_chestplate>)
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "ABA", "A A"]).map({A:<ore:itemLeather>, B:<ore:itemCloth>}).ingredients)
        .addTool(<ore:artisansHammer>, 10)
        .addTool(<ore:artisansCutters>, 10)
        .addOutput(<minecraft:leather_leggings>)
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "ABA"]).map({A:<ore:itemLeather>, B:<ore:itemCloth>}).ingredients)
        .addTool(<ore:artisansHammer>, 10)
        .addTool(<ore:artisansCutters>, 10)
        .addOutput(<minecraft:leather_boots>)
        .create();

//Chain Armor (vanilla)
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A"]).map({A:<ore:ringIron>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_helmet>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 10)
        .addTool(<ore:artisansCutters>, 10)
        .addOutput(<minecraft:chainmail_helmet>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:chainmail_helmet>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "AAA", "AAA"]).map({A:<ore:ringIron>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_chestplate>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 10)
        .addTool(<ore:artisansCutters>, 10)
        .addOutput(<minecraft:chainmail_chestplate>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:chainmail_chestplate>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A", "A A"]).map({A:<ore:ringIron>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_leggings>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 10)
        .addTool(<ore:artisansCutters>, 10)
        .addOutput(<minecraft:chainmail_leggings>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:chainmail_leggings>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "A A"]).map({A:<ore:ringIron>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_boots>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 10)
        .addTool(<ore:artisansCutters>, 10)
        .addOutput(<minecraft:chainmail_boots>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:chainmail_boots>))
        .create();

//Iron Armor (vanilla)
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A"]).map({A:<ore:plateIron>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_helmet>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<minecraft:iron_helmet>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:iron_helmet>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "AAA", "AAA"]).map({A:<ore:plateIron>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_chestplate>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<minecraft:iron_chestplate>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:iron_chestplate>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A", "A A"]).map({A:<ore:plateIron>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_leggings>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<minecraft:iron_leggings>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:iron_leggings>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "A A"]).map({A:<ore:plateIron>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_boots>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<minecraft:iron_boots>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:iron_boots>))
        .create();

//Diamond Armor (vanilla)
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A"]).map({A:<ore:plateDiamond>}).ingredients)
        .setSecondaryIngredients([<minecraft:iron_helmet>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<minecraft:diamond_helmet>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:diamond_helmet>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "AAA", "AAA"]).map({A:<ore:plateDiamond>}).ingredients)
        .setSecondaryIngredients([<minecraft:iron_chestplate>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<minecraft:diamond_chestplate>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:diamond_chestplate>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A", "A A"]).map({A:<ore:plateDiamond>}).ingredients)
        .setSecondaryIngredients([<minecraft:iron_leggings>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<minecraft:diamond_leggings>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:diamond_leggings>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "A A"]).map({A:<ore:plateDiamond>}).ingredients)
        .setSecondaryIngredients([<minecraft:iron_boots>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<minecraft:diamond_boots>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:diamond_boots>))
        .create();

//Gold Armor (Vanilla)
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A"]).map({A:<ore:plateGold>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_helmet>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 10)
        .addTool(<ore:artisansCutters>, 10)
        .addOutput(<minecraft:golden_helmet>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:golden_helmet>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "AAA", "AAA"]).map({A:<ore:plateGold>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_chestplate>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 10)
        .addTool(<ore:artisansCutters>, 10)
        .addOutput(<minecraft:golden_chestplate>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:golden_chestplate>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A", "A A"]).map({A:<ore:plateGold>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_leggings>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 10)
        .addTool(<ore:artisansCutters>, 10)
        .addOutput(<minecraft:golden_leggings>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:golden_leggings>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "A A"]).map({A:<ore:plateGold>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_boots>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 10)
        .addTool(<ore:artisansCutters>, 10)
        .addOutput(<minecraft:golden_boots>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<minecraft:golden_boots>))
        .create();

//Manasteel Armor (Botania)
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A"]).map({A:<ore:plateManasteel>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_helmet>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<botania:manasteelhelm>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:manasteelhelm>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "AAA", "AAA"]).map({A:<ore:plateManasteel>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_chestplate>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<botania:manasteelchest>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:manasteelchest>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A", "A A"]).map({A:<ore:plateManasteel>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_leggings>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<botania:manasteellegs>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:manasteellegs>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "A A"]).map({A:<ore:plateManasteel>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_boots>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<botania:manasteelboots>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:manasteelboots>))
        .create();

//Terrasteel Armor (Botania)
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "BCB", "BDB"]).map({A:<botania:manaresource:3>, B:<ore:plateTerrasteel>, C:<ore:ingotTerrasteel>, D:<ore:runeSpringB>}).ingredients)
        .setSecondaryIngredients([<botania:manasteelhelm>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 80)
        .addTool(<ore:artisansCutters>, 80)
        .addOutput(<botania:terrasteelhelm>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:terrasteelhelm>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AA AA", "BBCBB", "ABBBA", "D   D"]).map({A:<botania:manaresource:3>, B:<ore:ingotTerrasteel>, C:<ore:runeSummerB>, D:<ore:plateTerrasteel>}).ingredients)
        .setSecondaryIngredients([<botania:manasteelchest>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 80)
        .addTool(<ore:artisansCutters>, 80)
        .addOutput(<botania:terrasteelchest>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:terrasteelchest>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["ABA", "CDC"]).map({A:<ore:ingotTerrasteel>, B:<ore:runeAutumnB>, C:<ore:plateTerrasteel>, D:<botania:livingwood:0>}).ingredients)
        .setSecondaryIngredients([<botania:manasteellegs>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 80)
        .addTool(<ore:artisansCutters>, 80)
        .addOutput(<botania:terrasteellegs>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:terrasteellegs>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AB BA", "AC CA"]).map({A:<botania:manaresource:3>, B:<ore:woolGreen>, C:<ore:ingotTerrasteel>}).ingredients)
        .setSecondaryIngredients([<botania:manasteelboots>.marked("inherit"), <ore:runeWinterB>])
        .addTool(<ore:artisansHammer>, 80)
        .addTool(<ore:artisansCutters>, 80)
        .addOutput(<botania:terrasteelboots>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:terrasteelboots>))
        .create();

//Elementium Armor (Botania)
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "BCB", "B B"]).map({A:<botania:manaresource:8>, B:<ore:plateElementium>, C:<ore:ingotElementium>}).ingredients)
        .setSecondaryIngredients([<botania:manasteelhelm>.marked("inherit"), <ore:dustCryotheum>*4])
        .addTool(<ore:artisansHammer>, 80)
        .addTool(<ore:artisansCutters>, 80)
        .addOutput(<botania:elementiumhelm>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:elementiumhelm>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A   A", "BB BB", "CBBBC", "C   C"]).map({A:<botania:manaresource:8>, B:<ore:ingotElementium>, C:<ore:plateElementium>}).ingredients)
        .setSecondaryIngredients([<botania:manasteelchest>.marked("inherit"), <ore:dustPyrotheum>*4])
        .addTool(<ore:artisansHammer>, 80)
        .addTool(<ore:artisansCutters>, 80)
        .addOutput(<botania:elementiumchest>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:elementiumchest>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["ABA", "CBC"]).map({A:<ore:ingotElementium>, B:<ore:plateSilver>, C:<ore:plateElementium>, D:<botania:livingwood:0>}).ingredients)
        .setSecondaryIngredients([<botania:manasteellegs>.marked("inherit"), <ore:dustPetrotheum>*4])
        .addTool(<ore:artisansHammer>, 80)
        .addTool(<ore:artisansCutters>, 80)
        .addOutput(<botania:elementiumlegs>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:elementiumlegs>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "B B"]).map({A:<botania:manaresource:8>, B:<ore:plateElementium>}).ingredients)
        .setSecondaryIngredients([<botania:manasteelboots>.marked("inherit"), <ore:dustAerotheum>*4])
        .addTool(<ore:artisansHammer>, 80)
        .addTool(<ore:artisansCutters>, 80)
        .addOutput(<botania:elementiumboots>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<botania:elementiumboots>))
        .create();

//Brass Armor (Heat and Climate)
	RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A"]).map({A:<ore:plateBrass>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_helmet>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<dcs_climate:dcs_met_brass>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_met_brass>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "AAA", "AAA"]).map({A:<ore:plateBrass>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_chestplate>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<dcs_climate:dcs_met_brass>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_met_brass>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A", "A A"]).map({A:<ore:plateBrass>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_leggings>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<dcs_climate:dcs_leggins_brass>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_leggins_brass>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "A A"]).map({A:<ore:plateBrass>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_boots>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<dcs_climate:dcs_boots_brass>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_boots_brass>))
        .create();

//Steel Armor (Heat and Climate)
	RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A"]).map({A:<ore:plateSteel>}).ingredients)
        .setSecondaryIngredients([<dcs_climate:dcs_met_brass>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<dcs_climate:dcs_met_steel>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_met_steel>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "AAA", "AAA"]).map({A:<ore:plateSteel>}).ingredients)
        .setSecondaryIngredients([<dcs_climate:dcs_plate_brass>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<dcs_climate:dcs_plate_steel>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_plate_steel>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A", "A A"]).map({A:<ore:plateSteel>}).ingredients)
        .setSecondaryIngredients([<dcs_climate:dcs_leggins_brass>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<dcs_climate:dcs_leggins_steel>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_leggins_steel>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "A A"]).map({A:<ore:plateSteel>}).ingredients)
        .setSecondaryIngredients([<dcs_climate:dcs_boots_brass>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<dcs_climate:dcs_boots_steel>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_boots_steel>))
        .create();

//Chalcedony Armor (Heat and Climate)
	RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A"]).map({A:<tconstruct:large_plate>.withTag({Material: "chalcedony"})}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_helmet>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<dcs_climate:dcs_met_chalcedony>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_met_chalcedony>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "AAA", "AAA"]).map({A:<tconstruct:large_plate>.withTag({Material: "chalcedony"})}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_chestplate>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<dcs_climate:dcs_met_chalcedony>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_met_chalcedony>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A", "A A"]).map({A:<tconstruct:large_plate>.withTag({Material: "chalcedony"})}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_leggings>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<dcs_climate:dcs_leggins_chalcedony>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_leggins_chalcedony>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "A A"]).map({A:<tconstruct:large_plate>.withTag({Material: "chalcedony"})}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_boots>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<dcs_climate:dcs_boots_chalcedony>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_boots_chalcedony>))
        .create();

//Sapphire Armor (Heat and Climate)
	RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A"]).map({A:<ore:plateSapphire>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_helmet>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<dcs_climate:dcs_met_sapphire>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_met_sapphire>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "AAA", "AAA"]).map({A:<ore:plateSapphire>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_chestplate>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<dcs_climate:dcs_met_sapphire>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_met_sapphire>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A", "A A"]).map({A:<ore:plateSapphire>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_leggings>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<dcs_climate:dcs_leggins_sapphire>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_leggins_sapphire>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "A A"]).map({A:<ore:plateSapphire>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_boots>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<dcs_climate:dcs_boots_sapphire>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_boots_sapphire>))
        .create();

//Titanium Alloy Armor (Heat and Climate)
	RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A"]).map({A:<ore:plateTitaniumAlloy>}).ingredients)
        .setSecondaryIngredients([<dcs_climate:dcs_met_steel>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<dcs_climate:dcs_met_titanium>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_met_titanium>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "AAA", "AAA"]).map({A:<ore:plateTitaniumAlloy>}).ingredients)
        .setSecondaryIngredients([<dcs_climate:dcs_plate_steel>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<dcs_climate:dcs_plate_titanium>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_plate_titanium>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A", "A A"]).map({A:<ore:plateTitaniumAlloy>}).ingredients)
        .setSecondaryIngredients([<dcs_climate:dcs_leggins_steel>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<dcs_climate:dcs_leggins_titanium>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_leggins_titanium>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "A A"]).map({A:<ore:plateTitaniumAlloy>}).ingredients)
        .setSecondaryIngredients([<dcs_climate:dcs_boots_steel>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<dcs_climate:dcs_boots_titanium>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_boots_titanium>))
        .create();

//Silver Armor (Heat and Climate)
	RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A"]).map({A:<ore:plateSilver>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_helmet>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<dcs_climate:dcs_met_silver>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_met_silver>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "AAA", "AAA"]).map({A:<ore:plateSilver>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_chestplate>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<dcs_climate:dcs_met_silver>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_met_silver>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A", "A A"]).map({A:<ore:plateSilver>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_leggings>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<dcs_climate:dcs_leggins_silver>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_leggins_silver>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "A A"]).map({A:<ore:plateSilver>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_boots>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<dcs_climate:dcs_boots_silver>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<dcs_climate:dcs_boots_silver>))
        .create();

//Darksteel Armor (EnderIO)

//Endsteel Armor (EnderIO)

//Dark Matter Armor (ProjectE)

//Red Matter Armor (ProjectE)

//gem Armor (ProjectE)

//Bronze Armor (Thermal Foundation)
	RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A"]).map({A:<ore:plateBronze>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_helmet>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<thermalfoundation:armor.helmet_bronze>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<thermalfoundation:armor.helmet_bronze>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "AAA", "AAA"]).map({A:<ore:plateBronze>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_chestplate>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<thermalfoundation:armor.plate_bronze>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<thermalfoundation:armor.plate_bronze>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A", "A A"]).map({A:<ore:plateBronze>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_leggings>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<thermalfoundation:armor.legs_bronze>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<thermalfoundation:armor.legs_bronze>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "A A"]).map({A:<ore:plateBronze>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_boots>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<thermalfoundation:armor.boots_bronze>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<thermalfoundation:armor.boots_bronze>))
        .create();

//Invar Armor (Thermal Foundation)
	RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A"]).map({A:<ore:plateInvar>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_helmet>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<thermalfoundation:armor.helmet_invar>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<thermalfoundation:armor.helmet_invar>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "AAA", "AAA"]).map({A:<ore:plateInvar>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_chestplate>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<thermalfoundation:armor.plate_invar>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<thermalfoundation:armor.plate_invar>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A", "A A"]).map({A:<ore:plateInvar>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_leggings>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<thermalfoundation:armor.legs_invar>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<thermalfoundation:armor.legs_invar>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "A A"]).map({A:<ore:plateInvar>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_boots>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<thermalfoundation:armor.boots_invar>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<thermalfoundation:armor.boots_invar>))
        .create();

//Lead Armor (Thermal Foundation)
	RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A"]).map({A:<ore:plateLead>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_helmet>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<thermalfoundation:armor.helmet_lead>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<thermalfoundation:armor.helmet_lead>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "AAA", "AAA"]).map({A:<ore:plateLead>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_chestplate>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<thermalfoundation:armor.plate_lead>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<thermalfoundation:armor.plate_lead>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A", "A A"]).map({A:<ore:plateLead>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_leggings>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<thermalfoundation:armor.legs_lead>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<thermalfoundation:armor.legs_lead>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "A A"]).map({A:<ore:plateLead>}).ingredients)
        .setSecondaryIngredients([<minecraft:leather_boots>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<thermalfoundation:armor.boots_lead>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<thermalfoundation:armor.boots_lead>))
        .create();

//Knightslime Armor (Tinkers Complement)

//Manyullyn Armor (Tinkers Complement)

//Naga Scale Armor (Twilightforest)
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["ABA", "AAA", "AAA"]).map({A:<twilightforest:naga_scale>, B:<ore:itemCloth>}).ingredients)
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<twilightforest:naga_chestplate>.withTag({ench: [{lvl: 3 as short, id: 1 as short}]}))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "ABA", "A A"]).map({A:<twilightforest:naga_scale>, B:<ore:itemCloth>}).ingredients)
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<twilightforest:naga_leggings>.withTag({ench: [{lvl: 3 as short, id: 0 as short}]}))
        .create();

//Ironwood Armor (Twilightforest)
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "ABA"]).map({A:<ore:plateIronwood>, B:<ore:itemCloth>}).ingredients)
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<twilightforest:ironwood_helmet>.withTag({ench: [{lvl: 1 as short, id: 6 as short}]}))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["ABA", "AAA", "AAA"]).map({A:<ore:plateIronwood>, B:<ore:itemCloth>}).ingredients)
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<twilightforest:ironwood_chestplate>.withTag({ench: [{lvl: 1 as short, id: 0 as short}]}))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "ABA", "A A"]).map({A:<ore:plateIronwood>, B:<ore:itemCloth>}).ingredients)
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<twilightforest:ironwood_leggings>.withTag({ench: [{lvl: 1 as short, id: 0 as short}]}))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "ABA"]).map({A:<ore:plateIronwood>, B:<ore:itemCloth>}).ingredients)
        .addTool(<ore:artisansHammer>, 20)
        .addTool(<ore:artisansCutters>, 20)
        .addOutput(<twilightforest:ironwood_boots>.withTag({ench: [{lvl: 1 as short, id: 2 as short}]}))
        .create();

//Fiery Armor (Twilightforest)
	RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A"]).map({A:<ore:plateFiery>}).ingredients)
        .setSecondaryIngredients([<minecraft:iron_helmet>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 80)
        .addTool(<ore:artisansCutters>, 80)
        .addOutput(<twilightforest:fiery_helmet>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<twilightforest:fiery_helmet>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "AAA", "AAA"]).map({A:<ore:plateFiery>}).ingredients)
        .setSecondaryIngredients([<minecraft:iron_chestplate>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 80)
        .addTool(<ore:artisansCutters>, 80)
        .addOutput(<twilightforest:fiery_chestplate>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<twilightforest:fiery_chestplate>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A", "A A"]).map({A:<ore:plateFiery>}).ingredients)
        .setSecondaryIngredients([<minecraft:iron_leggings>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 80)
        .addTool(<ore:artisansCutters>, 80)
        .addOutput(<twilightforest:fiery_leggings>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<twilightforest:fiery_leggings>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "A A"]).map({A:<ore:plateFiery>}).ingredients)
        .setSecondaryIngredients([<minecraft:iron_boots>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 80)
        .addTool(<ore:artisansCutters>, 80)
        .addOutput(<twilightforest:fiery_boots>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<twilightforest:fiery_boots>))
        .create();

//Steeleaf Armor (Twilightforest)
	RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "ABA"]).map({A:<twilightforest:steeleaf_ingot>, B:<ore:itemCloth>}).ingredients)
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<twilightforest:steeleaf_helmet>.withTag({ench: [{lvl: 2 as short, id: 4 as short}]}))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["ABA", "AAA", "AAA"]).map({A:<twilightforest:steeleaf_ingot>, B:<ore:itemCloth>}).ingredients)
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<twilightforest:steeleaf_chestplate>.withTag({ench: [{lvl: 2 as short, id: 3 as short}]}))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "ABA", "A A"]).map({A:<twilightforest:steeleaf_ingot>, B:<ore:itemCloth>}).ingredients)
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<twilightforest:steeleaf_leggings>.withTag({ench: [{lvl: 2 as short, id: 1 as short}]}))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "ABA"]).map({A:<twilightforest:steeleaf_ingot>, B:<ore:itemCloth>}).ingredients)
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<twilightforest:steeleaf_boots>.withTag({ench: [{lvl: 2 as short, id: 2 as short}]}))
        .create();

//Knightly Armor (Twilightforest)
	RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A"]).map({A:<ore:plateKnightmetal>}).ingredients)
        .setSecondaryIngredients([<minecraft:iron_helmet>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<twilightforest:knightmetal_helmet>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<twilightforest:knightmetal_helmet>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "AAA", "AAA"]).map({A:<ore:plateKnightmetal>}).ingredients)
        .setSecondaryIngredients([<minecraft:iron_chestplate>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<twilightforest:knightmetal_chestplate>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<twilightforest:knightmetal_chestplate>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "A A", "A A"]).map({A:<ore:plateKnightmetal>}).ingredients)
        .setSecondaryIngredients([<minecraft:iron_leggings>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<twilightforest:knightmetal_leggings>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<twilightforest:knightmetal_leggings>))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "A A"]).map({A:<ore:plateKnightmetal>}).ingredients)
        .setSecondaryIngredients([<minecraft:iron_boots>.marked("inherit")])
        .addTool(<ore:artisansHammer>, 40)
        .addTool(<ore:artisansCutters>, 40)
        .addOutput(<twilightforest:knightmetal_boots>)
        .setRecipeFunction(HiiragiUtils.inheritStatus(<twilightforest:knightmetal_boots>))
        .create();

//Yeti Armor (Twilightforest)
	RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "ABA"]).map({A:<twilightforest:alpha_fur>, B:<ore:itemCloth>}).ingredients)
        .addTool(<ore:artisansHammer>, 80)
        .addTool(<ore:artisansCutters>, 80)
        .addOutput(<twilightforest:yeti_helmet>.withTag({ench: [{lvl: 2 as short, id: 0 as short}]}))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["ABA", "AAA", "AAA"]).map({A:<twilightforest:alpha_fur>, B:<ore:itemCloth>}).ingredients)
        .addTool(<ore:artisansHammer>, 80)
        .addTool(<ore:artisansCutters>, 80)
        .addOutput(<twilightforest:yeti_chestplate>.withTag({ench: [{lvl: 2 as short, id: 0 as short}]}))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "ABA", "A A"]).map({A:<twilightforest:alpha_fur>, B:<ore:itemCloth>}).ingredients)
        .addTool(<ore:artisansHammer>, 80)
        .addTool(<ore:artisansCutters>, 80)
        .addOutput(<twilightforest:yeti_leggings>.withTag({ench: [{lvl: 2 as short, id: 0 as short}]}))
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "ABA"]).map({A:<twilightforest:alpha_fur>, B:<ore:itemCloth>}).ingredients)
        .addTool(<ore:artisansHammer>, 80)
        .addTool(<ore:artisansCutters>, 80)
        .addOutput(<twilightforest:yeti_boots>.withTag({ench: [{lvl: 2 as short, id: 0 as short}, {lvl: 4 as short, id: 2 as short}]}))
        .create();

//Arctic Armor (Twilightforest)
	RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "ABA"]).map({A:<twilightforest:arctic_fur>, B:<ore:itemCloth>}).ingredients)
        .addTool(<ore:artisansHammer>, 10)
        .addTool(<ore:artisansCutters>, 10)
        .addOutput(<twilightforest:arctic_helmet>)
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["ABA", "AAA", "AAA"]).map({A:<twilightforest:arctic_fur>, B:<ore:itemCloth>}).ingredients)
        .addTool(<ore:artisansHammer>, 10)
        .addTool(<ore:artisansCutters>, 10)
        .addOutput(<twilightforest:arctic_chestplate>)
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["AAA", "ABA", "A A"]).map({A:<twilightforest:arctic_fur>, B:<ore:itemCloth>}).ingredients)
        .addTool(<ore:artisansHammer>, 10)
        .addTool(<ore:artisansCutters>, 10)
        .addOutput(<twilightforest:arctic_leggings>)
        .create();
    RecipeBuilder.get("basic")
        .setShaped(RecipePattern.init(["A A", "ABA"]).map({A:<twilightforest:arctic_fur>, B:<ore:itemCloth>}).ingredients)
        .addTool(<ore:artisansHammer>, 10)
        .addTool(<ore:artisansCutters>, 10)
        .addOutput(<twilightforest:arctic_boots>)
        .create();

//このscriptの読み込みの完了をログに出力
print("armor.zs loaded!");
