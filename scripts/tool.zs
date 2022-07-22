#====================================================================
# ファイル名 : tool.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : このファイルについて書く
#====================================================================

#priority 90

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading tool.zs ...");

//変数の定義
	val toRemove as IItemStack[] = [];
	for i in toRemove {
		HiiragiUtils.removeCrafting(i);
	}

	val toolTier as IItemStack[][string] = {
    "gohd.tooltip.tool.common.name": [
		<minecraft:carrot_on_a_stick>,
		<minecraft:bow>,
		<minecraft:wooden_sword>,
		<minecraft:wooden_shovel>,
		<minecraft:wooden_pickaxe>,
		<minecraft:wooden_axe>,
		<minecraft:wooden_hoe>,
		<minecraft:golden_sword>,
		<minecraft:golden_shovel>,
		<minecraft:golden_pickaxe>,
		<minecraft:golden_axe>,
		<minecraft:golden_hoe>,
		<minecraft:compass>,
		<minecraft:fishing_rod>,
		<minecraft:clock>,
		<minecraft:lead>,
		<minecraft:shield>,
		<dcs_lib:dcs_checker>,
		<dcs_climate:dcs_tinder:*>,
		<dcs_climate:dcs_color_changer>,
		<dcs_climate:dcs_handnet>,
		<pickletweaks:wooden_paxel>,
		<pickletweaks:golden_paxel>,
		<pickletweaks:lead_paxel>,
		<railcraft:borehead_bronze>,
		<thermalfoundation:tool.sword_lead>,
		<thermalfoundation:tool.shovel_lead>,
		<thermalfoundation:tool.pickaxe_lead>,
		<thermalfoundation:tool.axe_lead>,
		<thermalfoundation:tool.hoe_lead>,
		<thermalfoundation:tool.bow_lead>,
		<thermalfoundation:tool.shears_lead>,
		<thermalfoundation:tool.sickle_lead>,
		<thermalfoundation:tool.hammer_lead>,
		<thermalfoundation:tool.excavator_lead>,
		<thermalfoundation:tool.shears_stone>,
		<thermalfoundation:tool.sickle_stone>,
		<thermalfoundation:tool.hammer_stone>,
		<thermalfoundation:tool.excavator_stone>,
		<thermalfoundation:tool.bow_gold>,
		<thermalfoundation:tool.shears_gold>,
		<thermalfoundation:tool.sickle_gold>,
		<thermalfoundation:tool.hammer_gold>,
		<thermalfoundation:tool.excavator_gold>,
	],
	"gohd.tooltip.tool.uncommon.name": [
		<minecraft:flint_and_steel>,
		<minecraft:stone_sword>,
		<minecraft:stone_shovel>,
		<minecraft:stone_pickaxe>,
		<minecraft:stone_axe>,
		<minecraft:stone_hoe>,
		<minecraft:iron_sword>,
		<minecraft:iron_shovel>,
		<minecraft:iron_pickaxe>,
		<minecraft:iron_axe>,
		<minecraft:iron_hoe>,
		<minecraft:filled_map>,
		<minecraft:shears>,
		<minecraft:writable_book>,
		<minecraft:map>,
		<minecraft:fireworks>,
		<minecraft:name_tag>,
		<aiotbotania:livingwoodsword>,
		<aiotbotania:livingwoodaxe>,
		<aiotbotania:livingwoodpickaxe>,
		<aiotbotania:livingwoodshovel>,
		<aiotbotania:livingwoodhoe>,
		<aiotbotania:livingrocksword>,
		<aiotbotania:livingrockaxe>,
		<aiotbotania:livingrockpickaxe>,
		<aiotbotania:livingrockshovel>,
		<aiotbotania:livingrockhoe>,
		<appliedenergistics2:certus_quartz_wrench>,
		<appliedenergistics2:certus_quartz_cutting_knife>,
		<bibliocraft:stockroomcatalog>,
		<bibliocraft:testeritem>,
		<bibliocraft:atlasbook>,
		<bibliocraft:bigbook>,
		<bibliocraft:recipebook>,
		<bibliocraft:slottedbook>,
		<botania:livingwoodbow>,
		<botania:flowerbag>,
		<botania:cacophonium>,
		<chisel:chisel_iron>,
		<enderio:item_inventory_charger_simple>,
		<extrautils2:glasscutter>,
		<extrautils2:trowel>,
		<dcs_climate:dcs_wrench>,
		<dcs_climate:dcs_axe_brass>,
		<dcs_climate:dcs_pickaxe_brass>,
		<dcs_climate:dcs_spade_brass>,
		<dcs_climate:dcs_sword_brass>,
		<dcs_climate:dcs_scythe_brass>,
		<dcs_climate:dcs_axe_silver>,
		<dcs_climate:dcs_pickaxe_silver>,
		<dcs_climate:dcs_spade_silver>,
		<dcs_climate:dcs_sword_silver>,
		<dcs_climate:dcs_axe_garnet>,
		<dcs_climate:dcs_pickaxe_garnet>,
		<dcs_climate:dcs_spade_garnet>,
		<dcs_climate:dcs_sword_garnet>,
		<dcs_climate:dcs_scythe_garnet>,
		<dcs_climate:dcs_torque_checker>,
		<inspirations:redstone_charger>,
		<inspirations:north_compass>,
		<inspirations:barometer>,
		<inspirations:photometer>,
		<inspirations:waypoint_compass>,
		<pickletweaks:flint_sword>,
		<pickletweaks:flint_pickaxe>,
		<pickletweaks:flint_shovel>,
		<pickletweaks:flint_axe>,
		<pickletweaks:flint_hoe>,
		<railcraft:tool_crowbar_iron>,
		<railcraft:tool_crowbar_steel>,
		<railcraft:borehead_iron>,
		<railcraft:tool_spike_maul_iron>,
		<railcraft:tool_spike_maul_steel>,
		<twilightforest:ironwood_sword>,
		<twilightforest:ironwood_shovel>,
		<twilightforest:ironwood_pickaxe>,
		<twilightforest:ironwood_axe>,
		<twilightforest:ironwood_hoe>,
		<thermalfoundation:tool.sword_invar>,
		<thermalfoundation:tool.shovel_invar>,
		<thermalfoundation:tool.pickaxe_invar>,
		<thermalfoundation:tool.axe_invar>,
		<thermalfoundation:tool.hoe_invar>,
		<thermalfoundation:tool.bow_invar>,
		<thermalfoundation:tool.shears_invar>,
		<thermalfoundation:tool.sickle_invar>,
		<thermalfoundation:tool.hammer_invar>,
		<thermalfoundation:tool.excavator_invar>,
		<thermalfoundation:tool.sword_bronze>,
		<thermalfoundation:tool.shovel_bronze>,
		<thermalfoundation:tool.pickaxe_bronze>,
		<thermalfoundation:tool.axe_bronze>,
		<thermalfoundation:tool.hoe_bronze>,
		<thermalfoundation:tool.bow_bronze>,
		<thermalfoundation:tool.shears_bronze>,
		<thermalfoundation:tool.sickle_bronze>,
		<thermalfoundation:tool.hammer_bronze>,
		<thermalfoundation:tool.excavator_bronze>,
		<thermalfoundation:tool.bow_iron>,
		<thermalfoundation:tool.sickle_iron>,
		<thermalfoundation:tool.hammer_iron>,
		<thermalfoundation:tool.excavator_iron>,
	],
	"gohd.tooltip.tool.rare.name": [
		<minecraft:diamond_sword>,
		<minecraft:diamond_shovel>,
		<minecraft:diamond_pickaxe>,
		<minecraft:diamond_axe>,
		<aiotbotania:livingwoodaiot>,
		<aiotbotania:livingrockaiot>,
		<aiotbotania:manasteelhoe>,
		<botania:manatablet>,
		<botania:managun>,
		<botania:dirtrod>,
		<botania:grasshorn:*>,
		<botania:manasteelpick>,
		<botania:manasteelshovel>,
		<botania:manasteelaxe>,
		<botania:manasteelsword>,
		<botania:manasteelpick>,
		<botania:waterrod>,
		<botania:tornadorod>,
		<botania:firerod>,
		<botania:slingshot>,
		<botania:glasspick>,
		<botania:craftinghalo>,
		<botania:crystalbow>,
		<botania:obediencestick>,
		<chisel:chisel_diamond>,
		<enderio:item_conduit_probe>,
		<enderio:item_yeta_wrench>,
		<enderio:item_cold_fire_igniter>,
		<enderio:item_coord_selector>,
		<enderio:item_magnet>,
		<enderio:item_inventory_charger_basic>,
		<enderio:item_inventory_remote>,
		<extrautils2:wateringcan>,
		<extrautils2:itembuilderswand>,
		<extrautils2:itemdestructionwand>,
		<dcs_climate:dcs_thermal_scope>,
		<dcs_climate:dcs_axe_steel>,
		<dcs_climate:dcs_pickaxe_steel>,
		<dcs_climate:dcs_spade_steel>,
		<dcs_climate:dcs_sword_steel>,
		<dcs_climate:dcs_scythe_steel>,
		<dcs_climate:dcs_axe_nickelsilver>,
		<dcs_climate:dcs_pickaxe_nickelsilver>,
		<dcs_climate:dcs_spade_nickelsilver>,
		<dcs_climate:dcs_sword_nickelsilver>,
		<dcs_climate:dcs_axe_sapphire>,
		<dcs_climate:dcs_pickaxe_sapphire>,
		<dcs_climate:dcs_spade_sapphire>,
		<dcs_climate:dcs_sword_sapphire>,
		<dcs_climate:dcs_crossbow>,
		<dcs_climate:dcs_dynamite:0>,
		<dcs_climate:dcs_dynamite:2>,
		<dcs_climate:dcs_magic_card:0>,
		<dcs_climate:dcs_magic_card:1>,
		<dcs_climate:dcs_magic_card:2>,
		<dcs_climate:dcs_magic_card:3>,
		<dcs_climate:dcs_magic_card:4>,
		<mekanism:flamethrower>,
		<mekanismtools:glowstonepickaxe>,
		<mekanismtools:glowstoneaxe>,
		<mekanismtools:glowstoneshovel>,
		<mekanismtools:glowstonehoe>,
		<mekanismtools:glowstonesword>,
		<pickletweaks:stone_paxel>,
		<pickletweaks:iron_paxel>,
		<pickletweaks:bronze_paxel>,
		<pickletweaks:invar_paxel>,
		<pickletweaks:steel_paxel>,
		<pickletweaks:flint_paxel>,
		<railcraft:borehead_steel>,
		<twilightforest:steeleaf_sword>,
		<twilightforest:steeleaf_shovel>,
		<twilightforest:steeleaf_pickaxe>,
		<twilightforest:steeleaf_axe>,
		<twilightforest:steeleaf_hoe>,
		<twilightforest:minotaur_axe_gold>,
		<twilightforest:knightmetal_sword>,
		<twilightforest:knightmetal_pickaxe>,
		<twilightforest:knightmetal_axe>,
		//<thermalfoundation:tool.sword_steel>,
		//<thermalfoundation:tool.shovel_steel>,
		//<thermalfoundation:tool.pickaxe_steel>,
		//<thermalfoundation:tool.axe_steel>,
		//<thermalfoundation:tool.hoe_steel>,
		<thermalfoundation:tool.bow_steel>,
		<thermalfoundation:tool.shears_steel>,
		<thermalfoundation:tool.sickle_steel>,
		<thermalfoundation:tool.hammer_steel>,
		<thermalfoundation:tool.excavator_steel>,
		<thermalfoundation:tool.bow_diamond>,
		<thermalfoundation:tool.shears_diamond>,
		<thermalfoundation:tool.sickle_diamond>,
		<thermalfoundation:tool.hammer_diamond>,
		<thermalfoundation:tool.excavator_diamond>,
	],
	"gohd.tooltip.tool.epic.name": [
		<aiotbotania:manasteelaiot>,
		<aiotbotania:elementiumhoe>,
		<appliedenergistics2:entropy_manipulator>,
		<appliedenergistics2:wireless_terminal>,
		<appliedenergistics2:charged_staff>,
		<appliedenergistics2:matter_cannon>,
		<appliedenergistics2:portable_cell>,
		<appliedenergistics2:color_applicator>,
		<botania:terraformrod>,
		<botania:manamirror>,
		<botania:terrasword>,
		<botania:enderdagger>,
		<botania:elementiumpick>,
		<botania:elementiumshovel>,
		<botania:elementiumaxe>,
		<botania:elementiumsword>,
		<botania:elementiumpick>,
		<botania:skydirtrod>,
		<botania:diviningrod>,
		<botania:gravityrod>,
		<botania:cobblerod>,
		<botania:smeltrod>,
		<botania:thornchakram:*>,
		<botania:terraaxe>,
		<botania:exchangerod>,
		<botania:autocraftinghalo>,
		<botania:baublebox>,
		<enderio:item_xp_transfer>,
		<enderio:item_travel_staff>,
		<enderio:item_dark_steel_shield>,
		<enderio:item_dark_steel_sword>,
		<enderio:item_dark_steel_pickaxe>,
		<enderio:item_dark_steel_axe>,
		<enderio:item_dark_steel_bow>,
		<enderio:item_dark_steel_shears>,
		<enderio:item_dark_steel_treetap>,
		<enderio:item_dark_steel_crook>,
		<enderio:item_dark_steel_hand>,
		<enderio:item_inventory_charger>,
		<enderio:item_staff_of_levity>,
		<enderio:item_soul_vial>,
		<enderio:item_inventory_remote:1>,
		<extrautils2:boomerang>,
		<dcs_climate:dcs_entity_scope>,
		<dcs_climate:dcs_axe_chalcedony>,
		<dcs_climate:dcs_pickaxe_chalcedony>,
		<dcs_climate:dcs_spade_chalcedony>,
		<dcs_climate:dcs_sword_chalcedony>,
		<dcs_climate:dcs_scythe_chalcedony>,
		<dcs_climate:dcs_axe_titanium>,
		<dcs_climate:dcs_pickaxe_titanium>,
		<dcs_climate:dcs_spade_titanium>,
		<dcs_climate:dcs_sword_titanium>,
		<dcs_climate:dcs_axe_mangalloy>,
		<dcs_climate:dcs_pickaxe_mangalloy>,
		<dcs_climate:dcs_spade_mangalloy>,
		<dcs_climate:dcs_musket>,
		<dcs_climate:dcs_dynamite:1>,
		<dcs_climate:dcs_magic_card:5>,
		<dcs_climate:dcs_magic_card:6>,
		<dcs_climate:dcs_magic_card:7>,
		<dcs_climate:dcs_magic_card:8>,
		<dcs_climate:dcs_magic_card:9>,
		<dcs_climate:dcs_magic_card_m2:0>,
		<dcs_climate:dcs_magic_card_m2:1>,
		<dcs_climate:dcs_magic_card_m2:2>,
		<dcs_climate:dcs_magic_card_m2:3>,
		<dcs_climate:dcs_magic_card_m2:4>,
		<dcs_climate:dcs_color_gauntlet:0>,
		<dcs_climate:dcs_color_gauntlet:1>,
		<dcs_climate:dcs_color_gauntlet:2>,
		<dcs_climate:dcs_color_gauntlet:3>,
		<dcs_climate:dcs_color_gauntlet:4>,
		<hap:wrench>,
		<mekanism:electricbow>,
		<mekanismtools:glowstonepaxel>,
		<mekanismtools:osmiumpickaxe>,
		<mekanismtools:osmiumaxe>,
		<mekanismtools:osmiumshovel>,
		<mekanismtools:osmiumhoe>,
		<mekanismtools:osmiumsword>,
		<pickletweaks:diamond_paxel>,
		<railcraft:borehead_diamond>,
		<twilightforest:fiery_sword>,
		<twilightforest:fiery_pickaxe>,
		<twilightforest:giant_pickaxe>,
		<twilightforest:giant_sword>,
		<twilightforest:triple_bow>,
		<twilightforest:seeker_bow>,
		<twilightforest:ice_bow>,
		<twilightforest:ender_bow>,
		<twilightforest:ice_sword>,
	],
	"gohd.tooltip.tool.legendary.name": [
		<aiotbotania:elementiumaiot>,
		<minecraft:diamond_hoe>,
		<minecraft:totem_of_undying>,
		<advancedrocketry:jackhammer>,
		<botania:missilerod>,
		<botania:pinkinator>,
		<botania:starsword>,
		<botania:thundersword>,
		<chisel:chisel_hitech>,
		<enderio:item_rod_of_return>,
		<enderio:item_inventory_charger_vibrant>,
		<enderio:item_end_steel_sword>,
		<enderio:item_end_steel_pickaxe>,
		<enderio:item_end_steel_axe>,
		<enderio:item_end_steel_bow>,
		<enderio:item_end_steel_shield>,
		<enderio:item_inventory_remote:2>,
		<endertanks:ender_bucket>,
		<extrautils2:compoundbow>,
		<extrautils2:fireaxe>,
		<extrautils2:luxsaber:*>,
		<dcs_climate:dcs_axe_toolsteel>,
		<dcs_climate:dcs_pickaxe_toolsteel>,
		<dcs_climate:dcs_spade_toolsteel>,
		<dcs_climate:dcs_sword_toolsteel>,
		<dcs_climate:dcs_scythe_toolsteel>,
		<dcs_climate:dcs_spade_earth>,
		<dcs_climate:dcs_rake_earth>,
		<dcs_climate:dcs_rake_toolsteel>,
		<dcs_climate:dcs_magic_card:10>,
		<dcs_climate:dcs_magic_card:11>,
		<dcs_climate:dcs_magic_card:12>,
		<dcs_climate:dcs_magic_card:13>,
		<dcs_climate:dcs_magic_card:14>,
		<dcs_climate:dcs_magic_card_m:0>,
		<dcs_climate:dcs_magic_card_m:1>,
		<dcs_climate:dcs_magic_card_m:2>,
		<dcs_climate:dcs_magic_card_m:3>,
		<dcs_climate:dcs_magic_card_m:4>,
		<dcs_climate:dcs_color_gauntlet2:0>,
		<dcs_climate:dcs_color_gauntlet2:1>,
		<dcs_climate:dcs_color_gauntlet2:2>,
		<dcs_climate:dcs_color_gauntlet2:3>,
		<dcs_climate:dcs_color_gauntlet2:4>,
		<mekanismtools:osmiumpaxel>,
		<mekanismtools:obsidianpickaxe>,
		<mekanismtools:obsidianaxe>,
		<mekanismtools:obsidianshovel>,
		<mekanismtools:obsidianhoe>,
		<mekanismtools:obsidiansword>,
		<twilightforest:minotaur_axe>,
		<twilightforest:mazebreaker_pickaxe>,
		<twilightforest:glass_sword>,
		<twilightforest:block_and_chain>,
	],
	"gohd.tooltip.tool.mythic.name": [
		<botania:terrapick>,
		<botania:infinitefruit>,
		<botania:kingkey>,
		<botania:flugeleye>,
		<botanicadds:mana_stealer_sword>,
		<dcs_climate:dcs_magic_card_m3:0>,
		<dcs_climate:dcs_magic_card_m3:1>,
		<dcs_climate:dcs_magic_card_m3:2>,
		<dcs_climate:dcs_magic_card_m3:3>,
		<dcs_climate:dcs_magic_card_m3:4>,
		<extrautils2:lawsword>,
		<mekanism:atomicdisassembler>,
		<mekanismtools:obsidianpaxel>,
	],
	};
	for i, j in toolTier {
		for k in j {
			k.addTooltip(I18n.format(i));
		}
	}
/*
val toolHead as IItemStack[IItemStack] = {
	//Iron (Minecraft)
		<minecraft:iron_shovel>: <tconstruct:shovel_head>.withTag({Material: "iron"}),
		<minecraft:iron_pickaxe>: <tconstruct:pick_head>.withTag({Material: "iron"}),
		<minecraft:iron_axe>: <tconstruct:axe_head>.withTag({Material: "iron"}),
		<minecraft:iron_sword>: <tconstruct:sword_blade>.withTag({Material: "iron"}),
		<minecraft:iron_hoe>: <tconstruct:kama_head>.withTag({Material: "iron"}),
		<thermalfoundation:tool.sickle_iron>: <tconstruct:scythe_head>.withTag({Material: "iron"}),
		<thermalfoundation:tool.hammer_iron>: <tconstruct:hammer_head>.withTag({Material: "iron"}),
		<thermalfoundation:tool.excavator_iron>: <tconstruct:excavator_head>.withTag({Material: "iron"}),
	//Wooden (Minecraft)
		<minecraft:wooden_shovel>: <tconstruct:shovel_head>.withTag({Material: "wood"}),
		<minecraft:wooden_pickaxe>: <tconstruct:pick_head>.withTag({Material: "wood"}),
		<minecraft:wooden_axe>: <tconstruct:axe_head>.withTag({Material: "wood"}),
		<minecraft:wooden_sword>: <tconstruct:sword_blade>.withTag({Material: "wood"}),
		<minecraft:wooden_hoe>: <tconstruct:kama_head>.withTag({Material: "wood"}),
		<thermalfoundation:tool.sickle_wood>: <tconstruct:scythe_head>.withTag({Material: "wood"}),
		<thermalfoundation:tool.hammer_wood>: <tconstruct:hammer_head>.withTag({Material: "wood"}),
		<thermalfoundation:tool.excavator_wood>: <tconstruct:excavator_head>.withTag({Material: "wood"}),
	//Stone (Minecraft)
		<minecraft:stone_shovel>: <tconstruct:shovel_head>.withTag({Material: "stone"}),
		<minecraft:stone_pickaxe>: <tconstruct:pick_head>.withTag({Material: "stone"}),
		<minecraft:stone_axe>: <tconstruct:axe_head>.withTag({Material: "stone"}),
		<minecraft:stone_sword>: <tconstruct:sword_blade>.withTag({Material: "stone"}),
		<minecraft:stone_hoe>: <tconstruct:kama_head>.withTag({Material: "stone"}),
		<dcs_climate:dcs_scythe_stone>: <tconstruct:scythe_head>.withTag({Material: "stone"}),
		<thermalfoundation:tool.hammer_stone>: <tconstruct:hammer_head>.withTag({Material: "stone"}),
		<thermalfoundation:tool.excavator_stone>: <tconstruct:excavator_head>.withTag({Material: "stone"}),
	//Certus Quartz (Applied Energistics 2)
		<appliedenergistics2:certus_quartz_spade>: <tconstruct:shovel_head>.withTag({Material: "certus_quartz"}),
		<appliedenergistics2:certus_quartz_pickaxe>: <tconstruct:pick_head>.withTag({Material: "certus_quartz"}),
		<appliedenergistics2:certus_quartz_axe>: <tconstruct:axe_head>.withTag({Material: "certus_quartz"}),
		<appliedenergistics2:certus_quartz_sword>: <tconstruct:sword_blade>.withTag({Material: "certus_quartz"}),
		<appliedenergistics2:certus_quartz_hoe>: <tconstruct:kama_head>.withTag({Material: "certus_quartz"}),
	//Steel (Heat And climate)
		<dcs_climate:dcs_spade_steel>: <tconstruct:shovel_head>.withTag({Material: "steel"}),
		<dcs_climate:dcs_pickaxe_steel>: <tconstruct:pick_head>.withTag({Material: "steel"}),
		<dcs_climate:dcs_axe_steel>: <tconstruct:axe_head>.withTag({Material: "steel"}),
		<dcs_climate:dcs_sword_steel>: <tconstruct:sword_blade>.withTag({Material: "steel"}),
		<dcs_climate:dcs_scythe_steel>: <tconstruct:scythe_head>.withTag({Material: "steel"}),
	//Silver (Heat And Climate)
		<dcs_climate:dcs_spade_silver>: <tconstruct:shovel_head>.withTag({Material: "silver"}),
		<dcs_climate:dcs_pickaxe_silver>: <tconstruct:pick_head>.withTag({Material: "silver"}),
		<dcs_climate:dcs_axe_silver>: <tconstruct:axe_head>.withTag({Material: "silver"}),
		<dcs_climate:dcs_sword_silver>: <tconstruct:sword_blade>.withTag({Material: "silver"}),
	//Nickelsilver (Heat And Climate)
		<dcs_climate:dcs_spade_nickelsilver>: <tconstruct:shovel_head>.withTag({Material: "nickelsilver"}),
		<dcs_climate:dcs_pickaxe_nickelsilver>: <tconstruct:pick_head>.withTag({Material: "nickelsilver"}),
		<dcs_climate:dcs_axe_nickelsilver>: <tconstruct:axe_head>.withTag({Material: "nickelsilver"}),
		<dcs_climate:dcs_sword_nickelsilver>: <tconstruct:sword_blade>.withTag({Material: "nickelsilver"}),
	//Chalcedony (Heat And Climate)
		<dcs_climate:dcs_spade_chalcedony>: <tconstruct:shovel_head>.withTag({Material: "chalcedony"}),
		<dcs_climate:dcs_pickaxe_chalcedony>: <tconstruct:pick_head>.withTag({Material: "chalcedony"}),
		<dcs_climate:dcs_axe_chalcedony>: <tconstruct:axe_head>.withTag({Material: "chalcedony"}),
		<dcs_climate:dcs_sword_chalcedony>: <tconstruct:sword_blade>.withTag({Material: "chalcedony"}),
		<dcs_climate:dcs_scythe_chalcedony>: <tconstruct:scythe_head>.withTag({Material: "chalcedony"}),
	//Titanium (Heat And Climate)
		<dcs_climate:dcs_spade_titanium>: <tconstruct:shovel_head>.withTag({Material: "titanium_alloy"}),
		<dcs_climate:dcs_pickaxe_titanium>: <tconstruct:pick_head>.withTag({Material: "titanium_alloy"}),
		<dcs_climate:dcs_axe_titanium>: <tconstruct:axe_head>.withTag({Material: "titanium_alloy"}),
		<dcs_climate:dcs_sword_titanium>: <tconstruct:sword_blade>.withTag({Material: "titanium_alloy"}),
	//Refined Glowstone (Mekanism)
		<mekanismtools:glowstonepickaxe>: <tconstruct:pick_head>.withTag({Material: "refined_glowstone"}),
		<mekanismtools:glowstoneaxe>: <tconstruct:axe_head>.withTag({Material: "refined_glowstone"}),
		<mekanismtools:glowstoneshovel>: <tconstruct:shovel_head>.withTag({Material: "refined_glowstone"}),
		<mekanismtools:glowstonehoe>: <tconstruct:kama_head>.withTag({Material: "refined_glowstone"}),
		<mekanismtools:glowstonesword>: <tconstruct:sword_blade>.withTag({Material: "refined_glowstone"}),
	//Osmium (Mekanism)
		<mekanismtools:osmiumpickaxe>: <tconstruct:pick_head>.withTag({Material: "osmium"}),
		<mekanismtools:osmiumaxe>: <tconstruct:axe_head>.withTag({Material: "osmium"}),
		<mekanismtools:osmiumshovel>: <tconstruct:shovel_head>.withTag({Material: "osmium"}),
		<mekanismtools:osmiumhoe>: <tconstruct:kama_head>.withTag({Material: "osmium"}),
		<mekanismtools:osmiumsword>: <tconstruct:sword_blade>.withTag({Material: "osmium"}),
	//Refined Obsidian (Mekanism)
		<mekanismtools:obsidianpickaxe>: <tconstruct:pick_head>.withTag({Material: "refined_obsidian"}),
		<mekanismtools:obsidianaxe>: <tconstruct:axe_head>.withTag({Material: "refined_obsidian"}),
		<mekanismtools:obsidianshovel>: <tconstruct:shovel_head>.withTag({Material: "refined_obsidian"}),
		<mekanismtools:obsidianhoe>: <tconstruct:kama_head>.withTag({Material: "refined_obsidian"}),
		<mekanismtools:obsidiansword>: <tconstruct:sword_blade>.withTag({Material: "refined_obsidian"}),
	//Flint (Pickle Tweaks)
		<pickletweaks:flint_sword>: <tconstruct:sword_blade>.withTag({Material: "flint"}),
		<pickletweaks:flint_pickaxe>: <tconstruct:pick_head>.withTag({Material: "flint"}),
		<pickletweaks:flint_shovel>: <tconstruct:shovel_head>.withTag({Material: "flint"}),
		<pickletweaks:flint_axe>: <tconstruct:axe_head>.withTag({Material: "flint"}),
		<pickletweaks:flint_hoe>: <tconstruct:kama_head>.withTag({Material: "flint"}),
	//Fiery (Twilight Forest)
		<twilightforest:fiery_pickaxe>: <tconstruct:pick_head>.withTag({Material: "fierymetal"}),
		<twilightforest:fiery_sword>.withTag({ench: [{lvl: 2 as short, id: 20 as short}]}): <tconstruct:sword_blade>.withTag({Material: "fierymetal"}),
	//Steeleaf (Twilight Forest)
		<twilightforest:steeleaf_shovel>.withTag({ench: [{lvl: 2 as short, id: 32 as short}]}): <tconstruct:shovel_head>.withTag({Material: "steeleaf"}),
		<twilightforest:steeleaf_pickaxe>.withTag({ench: [{lvl: 2 as short, id: 35 as short}]}): <tconstruct:pick_head>.withTag({Material: "steeleaf"}),
		<twilightforest:steeleaf_axe>.withTag({ench: [{lvl: 2 as short, id: 32 as short}]}): <tconstruct:axe_head>.withTag({Material: "steeleaf"}),
		<twilightforest:steeleaf_sword>.withTag({ench: [{lvl: 2 as short, id: 21 as short}]}): <tconstruct:sword_blade>.withTag({Material: "steeleaf"}),
	//Knightmetal (Twilight Forest)
		<twilightforest:knightmetal_pickaxe>: <tconstruct:pick_head>.withTag({Material: "knightmetal"}),
		<twilightforest:knightmetal_axe>: <tconstruct:axe_head>.withTag({Material: "knightmetal"}),
		<twilightforest:knightmetal_sword>: <tconstruct:sword_blade>.withTag({Material: "knightmetal"}),
	//Lead (Thermal Foundation)
		<thermalfoundation:tool.shovel_lead>: <tconstruct:shovel_head>.withTag({Material: "lead"}),
		<thermalfoundation:tool.pickaxe_lead>: <tconstruct:pick_head>.withTag({Material: "lead"}),
		<thermalfoundation:tool.axe_lead>: <tconstruct:axe_head>.withTag({Material: "lead"}),
		<thermalfoundation:tool.sword_lead>: <tconstruct:sword_blade>.withTag({Material: "lead"}),
		<thermalfoundation:tool.hoe_lead>: <tconstruct:kama_head>.withTag({Material: "lead"}),
		<thermalfoundation:tool.sickle_lead>: <tconstruct:scythe_head>.withTag({Material: "lead"}),
		<thermalfoundation:tool.hammer_lead>: <tconstruct:hammer_head>.withTag({Material: "lead"}),
		<thermalfoundation:tool.excavator_lead>: <tconstruct:excavator_head>.withTag({Material: "lead"}),
	//Steel (Thermal Foundation)
		<thermalfoundation:tool.hoe_steel>: <tconstruct:kama_head>.withTag({Material: "steel"}),
		<thermalfoundation:tool.sickle_steel>: <tconstruct:scythe_head>.withTag({Material: "steel"}),
		<thermalfoundation:tool.hammer_steel>: <tconstruct:hammer_head>.withTag({Material: "steel"}),
		<thermalfoundation:tool.excavator_steel>: <tconstruct:excavator_head>.withTag({Material: "steel"}),
	//Bronze (Thermal Foundation)
		<thermalfoundation:tool.shovel_bronze>: <tconstruct:shovel_head>.withTag({Material: "bronze"}),
		<thermalfoundation:tool.pickaxe_bronze>: <tconstruct:pick_head>.withTag({Material: "bronze"}),
		<thermalfoundation:tool.axe_bronze>: <tconstruct:axe_head>.withTag({Material: "bronze"}),
		<thermalfoundation:tool.sword_bronze>: <tconstruct:sword_blade>.withTag({Material: "bronze"}),
		<thermalfoundation:tool.hoe_bronze>: <tconstruct:kama_head>.withTag({Material: "bronze"}),
		<thermalfoundation:tool.sickle_bronze>: <tconstruct:scythe_head>.withTag({Material: "bronze"}),
		<thermalfoundation:tool.hammer_bronze>: <tconstruct:hammer_head>.withTag({Material: "bronze"}),
		<thermalfoundation:tool.excavator_bronze>: <tconstruct:excavator_head>.withTag({Material: "bronze"}),
};
for tool, toolHead in toolHead {
	HiiragiUtils.addCraftingShapeless(true, tool, [toolHead, <ore:stickWood>], null, null);
}

//Diamond (Minecraft)
	val toolDiamond as IItemStack[IItemStack] = {
		<minecraft:diamond_shovel>: <minecraft:iron_shovel>,
		<minecraft:diamond_pickaxe>: <minecraft:iron_pickaxe>,
		<minecraft:diamond_axe>: <minecraft:iron_axe>,
		<minecraft:diamond_sword>: <minecraft:iron_sword>,
		<minecraft:diamond_hoe>: <minecraft:iron_hoe>,
		<thermalfoundation:tool.sickle_diamond>: <thermalfoundation:tool.sickle_iron>,
		<thermalfoundation:tool.hammer_diamond>: <thermalfoundation:tool.hammer_iron>,
		<thermalfoundation:tool.excavator_diamond>: <thermalfoundation:tool.hammer_iron>,
	};
	for tool, toolBase in toolDiamond {
		HiiragiUtils.addCraftingShapeless(true, tool, [toolBase.marked("inherit"), <ore:gemDiamond>, <contenttweaker:ticket_rare>], HiiragiUtils.inheritStatus(tool), null);
	}

//Golden (Minecraft)
	val toolGold as IItemStack[IItemStack] = {
		<minecraft:golden_shovel>: <minecraft:wooden_shovel>,
		<minecraft:golden_pickaxe>: <minecraft:wooden_pickaxe>,
		<minecraft:golden_axe>: <minecraft:wooden_axe>,
		<minecraft:golden_sword>: <minecraft:wooden_sword>,
		<minecraft:golden_hoe>: <minecraft:wooden_hoe>,
		<thermalfoundation:tool.sickle_gold>: <thermalfoundation:tool.sickle_wood>,
		<thermalfoundation:tool.hammer_gold>: <thermalfoundation:tool.hammer_wood>,
		<thermalfoundation:tool.excavator_gold>: <thermalfoundation:tool.hammer_wood>,
	};
	for tool, toolBase in toolGold {
		HiiragiUtils.addCraftingShapeless(true, tool, [toolBase.marked("inherit"), <ore:ingotGold>], HiiragiUtils.inheritStatus(tool), null);
	}

	val toolMana as IItemStack[IItemStack] = {
		//Living Wood (Botania AIOT)
			<aiotbotania:livingwoodsword>: <tconstruct:sword_blade>.withTag({Material: "livingwood"}),
			<aiotbotania:livingwoodaxe>: <tconstruct:axe_head>.withTag({Material: "livingwood"}),
			<aiotbotania:livingwoodpickaxe>: <tconstruct:pick_head>.withTag({Material: "livingwood"}),
			<aiotbotania:livingwoodshovel>: <tconstruct:shovel_head>.withTag({Material: "livingwood"}),
			<aiotbotania:livingwoodhoe>:<tconstruct:kama_head>.withTag({Material: "livingwood"}),
		//Living Rock (Botania AIOT)
			<aiotbotania:livingrocksword>: <tconstruct:sword_blade>.withTag({Material: "livingrock"}),
			<aiotbotania:livingrockaxe>: <tconstruct:axe_head>.withTag({Material: "livingrock"}),
			<aiotbotania:livingrockpickaxe>: <tconstruct:pick_head>.withTag({Material: "livingrock"}),
			<aiotbotania:livingrockshovel>: <tconstruct:shovel_head>.withTag({Material: "livingrock"}),
			<aiotbotania:livingrockhoe>:<tconstruct:kama_head>.withTag({Material: "livingrock"}),
		//Manasteel (Botania)
			<botania:manasteelpick>: <tconstruct:pick_head>.withTag({Material: "manasteel"}),
			<botania:manasteelshovel>: <tconstruct:shovel_head>.withTag({Material: "manasteel"}),
			<botania:manasteelaxe>: <tconstruct:axe_head>.withTag({Material: "manasteel"}),
			<botania:manasteelsword>: <tconstruct:sword_blade>.withTag({Material: "manasteel"}),
	};
	for tool, toolHead in toolMana {
		HiiragiUtils.addCraftingShapeless(true, tool, [toolHead, <botania:manaresource:3>], null, null);
	}

//Terrasteel (Botania)
	HiiragiUtils.addCraftingShaped(false, <botania:terrapick>, RecipePattern.init(["ABA", " C ", " D "]).map({
		A: <tconstruct:large_plate>.withTag({Material: "terrasteel"}),
		B: <botania:manatablet>.marked("inherit"),
		C: <botania:manaresource:3>,
		D:<tconstruct:tough_tool_rod>.withTag({Material: "terrasteel"}),
	}).ingredients, HiiragiUtils.inheritStatus(<botania:terrapick>), null);
	HiiragiUtils.addCraftingShaped(false, <botania:terraaxe>, RecipePattern.init(["AAB", "AC ", " D "]).map({
		A: <tconstruct:large_plate>.withTag({Material: "terrasteel"}),
		B: <botania:manatablet>.marked("inherit"),
		C: <botania:manaresource:3>,
		D:<tconstruct:tough_tool_rod>.withTag({Material: "terrasteel"}),
	}).ingredients, HiiragiUtils.inheritStatus(<botania:terraaxe>), null);

//Elementium (Botania)
	val toolElementium as IItemStack[IItemStack] = {
		<botania:elementiumpick>: <tconstruct:pick_head>,
		<botania:elementiumshovel>: <tconstruct:shovel_head>,
		<botania:elementiumaxe>: <tconstruct:axe_head>,
		<botania:elementiumsword>: <tconstruct:sword_blade>,
	};
	for tool, toolHead in toolElementium {
		HiiragiUtils.addCraftingShapeless(true, tool, [toolHead.withTag({Material: "elementium"}), <botania:manaresource:13>], null, null);
	}

//Dark Steel (Ender IO)
	val toolDarksteel as IItemStack[IItemStack] = {
		<enderio:item_dark_steel_pickaxe>: <tconstruct:pick_head>,
		<enderio:item_dark_steel_axe>: <tconstruct:axe_head>,
		<enderio:item_dark_steel_sword>: <tconstruct:sword_blade>,
		<enderio:item_dark_steel_crook>: <tconstruct:scythe_head>,
	};
	for tool, toolHead in toolDarksteel {
		HiiragiUtils.addCraftingShapeless(true, tool, [toolHead.withTag({Material: "dark_steel"}), <ore:itemNutritiousStick>], null, null);
	}

//End Steel (Ender IO)
	val toolEndsteel as IItemStack[IItemStack] = {
		<enderio:item_end_steel_pickaxe>: <tconstruct:pick_head>,
		<enderio:item_end_steel_axe>: <tconstruct:axe_head>,
		<enderio:item_end_steel_sword>: <tconstruct:sword_blade>,
	};
	for tool, toolHead in toolEndsteel {
		HiiragiUtils.addCraftingShapeless(true, tool, [toolHead.withTag({Material: "end_steel"}), <ore:itemInfinityRod>], null, null);
	}

//Brass (HaC)

//Sapphire (Heat And Climate)
	val toolSapphire as IItemStack[IItemStack] = {
		<dcs_climate:dcs_spade_sapphire>: <minecraft:iron_shovel>,
		<dcs_climate:dcs_pickaxe_sapphire>: <minecraft:iron_pickaxe>,
		<dcs_climate:dcs_axe_sapphire>: <minecraft:iron_axe>,
		<dcs_climate:dcs_sword_sapphire>: <minecraft:iron_sword>,
	};
	for tool, toolBase in toolSapphire {
		HiiragiUtils.addCraftingShapeless(true, tool, [toolBase.marked("inherit"), <ore:gemSapphire>|<ore:gemRuby>], HiiragiUtils.inheritStatus(tool), null);
	}

//Garnet (Heat And Climate)
	val toolGarnet as IItemStack[IItemStack] = {
		<dcs_climate:dcs_spade_garnet>: <minecraft:stone_shovel>,
		<dcs_climate:dcs_pickaxe_garnet>: <minecraft:stone_pickaxe>,
		<dcs_climate:dcs_axe_garnet>: <minecraft:stone_axe>,
		<dcs_climate:dcs_sword_garnet>: <minecraft:stone_sword>,
		<dcs_climate:dcs_scythe_garnet>: <dcs_climate:dcs_scythe_stone>,
	};
	for tool, toolBase in toolGarnet {
		HiiragiUtils.addCraftingShapeless(true, tool, [toolBase.marked("inherit"), <ore:gemGarnet>|<ore:gemTsavorite>], HiiragiUtils.inheritStatus(tool), null);
	}

//Tool Steel (Heat And Climate)

//Mangalloy (Heat And Climate)
*/
//このscriptの読み込みの完了をログに出力
print("tool.zs loaded!");
