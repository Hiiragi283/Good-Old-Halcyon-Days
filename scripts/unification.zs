#====================================================================
# ファイル名 : unification.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for unifing some conflicts and internal data
#====================================================================

#priority 90

//crafttweakerからclassをimport
import crafttweaker.block.IBlockDefinition;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.player.IPlayer;
import crafttweaker.recipes.ICraftingInfo;
import crafttweaker.util.Position3f;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;

//各種modからclassをimport
import mods.ctintegration.util.RecipePattern;
import mods.quarryplus.WorkbenchPlus;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;
import scripts.jei;

//このscriptの読み込みの開始をログに出力
print("Start loading unification.zs ...");

//作業台レシピの編集
	//削除
	val removeCrafting as IItemStack[] = [
		<appliedenergistics2:material:9>,
		<compactmachines3:psd>,
		<dcs_climate:dcs_device_shaft_l_steel>,
		<dcs_climate:dcs_device_shaft_l_sus>,
		<dcs_climate:dcs_device_shaft_l>,
		<dcs_climate:dcs_device_shaft_switch_steel>,
		<dcs_climate:dcs_device_shaft_switch>,
		<dcs_climate:dcs_device_shaft_ta_steel>,
		<dcs_climate:dcs_device_shaft_ta_sus>,
		<dcs_climate:dcs_device_shaft_ta>,
		<dcs_climate:dcs_device_shaft_tb_steel>,
		<dcs_climate:dcs_device_shaft_tb_sus>,
		<dcs_climate:dcs_device_shaft_tb>,
		<dcs_climate:dcs_device_shaft_x_steel>,
		<dcs_climate:dcs_device_shaft_x_sus>,
		<dcs_climate:dcs_device_shaft_x>,
		<dcs_climate:dcs_magic_card_m3:*>,
		<dcs_climate:dcs_ore_gemblock:4>,
		<enderio:block_omni_reservoir>,
		<enderio:block_reservoir>,
		<enderio:block_solar_panel:*>,
		<enderio:item_basic_capacitor:*>,
		<enderio:item_conduit_probe>,
		<enderio:item_extract_speed_downgrade>,
		<enderio:item_extract_speed_upgrade>,
		<enderio:item_inventory_charger_basic>,
		<enderio:item_inventory_charger_simple>,
		<enderio:item_inventory_charger_vibrant>,
		<enderio:item_inventory_charger>,
		<enderio:item_magnet>,
		<enderio:item_material:11>,
		<enderio:item_material:12>,
		<enderio:item_material:13>,
		<enderio:item_material:14>,
		<enderio:item_material:15>,
		<enderio:item_material:60>,
		<enderio:item_material:65>,
		<enderio:item_material:71>,
		<enderio:item_material:73>,
		<hap:shaft_bifurcated_steel>,
		<hap:shaft_bifurcated_sus>,
		<hap:shaft_l_shaped_steel>,
		<hap:shaft_l_shaped_sus>,
		<hap:shaft_perpendicular_steel>,
		<hap:shaft_perpendicular_sus>,
		<hap:shaft_t_shaped_steel>,
		<hap:shaft_t_shaped_sus>,
		<hap:shaft_x_shaped_steel>,
		<hap:shaft_x_shaped_sus>,
		<mechanics:heavy_mesh>,
		<mekanism:anchorupgrade>,
		<mekanism:basicblock:8>,
		<mekanism:controlcircuit:*>,
		<mekanism:energyupgrade>,
		<mekanism:filterupgrade>,
		<mekanism:gasupgrade>,
		<mekanism:mufflingupgrade>,
		<mekanism:speedupgrade>,
		<tconstruct:casting:*>,
		<tconstruct:channel>,
		<tconstruct:faucet>,
		<thermalexpansion:augment:*>,
		<thermalfoundation:material:512>,
		<thermalfoundation:material:513>,
		<thermalfoundation:material:514>,
		<thermalfoundation:material:515>,
		<thermalfoundation:material:640>,
	];
	for i in removeCrafting {
		//HiiragiUtils.removeCrafting(i);
	}
	val removeCraftingName as string[] = [
		"appliedenergistics2:misc/fluixpearl",
		"buildinggadgets:buildingtool",
		"buildinggadgets:destructiontool",
		"compactmachine3:psd",
		"dcs_climate:machine_advanced/dcs_torch_0_2",
		"dcs_climate:machine_advanced/dcs_torch_0",
		"dcs_climate:machine/dcs_device_shaft_l_0",
		"dcs_climate:machine/dcs_device_shaft_l_steel_0",
		"dcs_climate:machine/dcs_device_shaft_l_sus_0",
		"dcs_climate:machine/dcs_device_shaft_switch_0",
		"dcs_climate:machine/dcs_device_shaft_switch_steel_0",
		"dcs_climate:machine/dcs_device_shaft_switch_sus_0",
		"dcs_climate:machine/dcs_device_shaft_ta_0",
		"dcs_climate:machine/dcs_device_shaft_ta_steel_0",
		"dcs_climate:machine/dcs_device_shaft_ta_sus_0",
		"dcs_climate:machine/dcs_device_shaft_tb_0",
		"dcs_climate:machine/dcs_device_shaft_tb_steel_0",
		"dcs_climate:machine/dcs_device_shaft_tb_sus_0",
		"dcs_climate:machine/dcs_device_shaft_x_0",
		"dcs_climate:machine/dcs_device_shaft_x_steel_0",
		"dcs_climate:machine/dcs_device_shaft_x_sus_0",
		"dcs_climate:main_build/dcs_desktop_accessories_0_2",
		"dcs_climate:main_build/dcs_desktop_accessories_1",
		"dcs_climate:main_build/dcs_desktop_accessories_2",
		"dcs_climate:main_build/dcs_desktop_accessories_3",
		"dcs_climate:main_build/dcs_desktop_accessories_4",
		"dcs_climate:main_build/dcs_desktop_accessories_5",
		"dcs_climate:main_build/dcs_desktop_accessories_6",
		"dcs_climate:main_build/dcs_desktop_accessories_7",
		"dcs_climate:main_build/dcs_desktop_accessories_8",
		"dcs_climate:main_container/dcs_gem_blue_1",
		"dcs_climate:main_container/dcs_ore_metal_alloy_2",
		"dcs_climate:main_yagen/dcs_blaze_powder_0_2",
		"dcs_climate:main_yagen/dcs_blaze_powder_0",
		"dcs_climate:main_yagen/dcs_dye_15",
		"dcs_climate:main_yagen/dcs_flint_0",
		"dcs_climate:main_yagen/dcs_food_drop_oil_0",
		"dcs_climate:main_yagen/dcs_food_materials_1_2",
		"dcs_climate:main_yagen/dcs_food_materials_1",
		"dcs_climate:main_yagen/dcs_food_materials_2",
		"dcs_climate:main_yagen/dcs_gem_green_3",
		"dcs_climate:main_yagen/dcs_gem_layer_0",
		"dcs_climate:main_yagen/dcs_gem_layer_1",
		"dcs_climate:main_yagen/dcs_gem_layer_2",
		"dcs_climate:main_yagen/dcs_gem_layer_3",
		"dcs_climate:main_yagen/dcs_gem_layer_4",
		"dcs_climate:main_yagen/dcs_miscdust_1_2",
		"dcs_climate:main_yagen/dcs_miscdust_1",
		"dcs_climate:main_yagen/dcs_miscdust_11",
		"dcs_climate:main_yagen/dcs_miscdust_12",
		"dcs_climate:main_yagen/dcs_miscdust_2",
		"dcs_climate:main_yagen/dcs_miscdust_6",
		"dcs_climate:main_yagen/dcs_miscdust_8",
		"dcs_climate:main_yagen/dcs_miscdust_9_2",
		"dcs_climate:main_yagen/dcs_miscdust_9",
		"dcs_climate:main_yagen/dcs_oredust_12_2",
		"dcs_climate:main_yagen/dcs_oredust_12",
		"dcs_climate:main_yagen/dcs_oredust_15",
		"dcs_climate:main_yagen/dcs_oredust_7",
		"dcs_climate:main_yagen/dcs_oredust_9",
		"dcs_climate:main_yagen/dcs_oreitem_4",
		"dcs_climate:main_yagen/dcs_string_0",
		"dcs_climate:main/dcs_planks_0",
		"enderio:alloy_smelter_upgrade",
		"enderio:crafter_upgrade",
		"enderio:s_a_g_mill_upgrade",
		"enderio:stirling_generator_upgrade",
		"enderio:wired_charger_upgrade",
		"extendedcrafting:black_iron_ingot_to",
		"extendedcrafting:black_iron_ingot",
		"extendedcrafting:black_iron_slate",
		//"extendedcrafting:compressor",
		//"extendedcrafting:crafting_core",
		"extrautils2:unstable_nugget",
		"hap:shaft_bifurcated_steel",
		"hap:shaft_bifurcated_sus",
		"hap:shaft_l_shaped_steel",
		"hap:shaft_l_shaped_sus",
		"hap:shaft_perpendicular_steel",
		"hap:shaft_perpendicular_sus",
		"hap:shaft_t_shaped_steel",
		"hap:shaft_t_shaped_sus",
		"hap:shaft_x_shaped_steel",
		"hap:shaft_x_shaped_sus",
		"mekanism:machineblock_5_alt_alt_alt_alt_alt_alt_alt_alt",
		"mekanism:machineblock_5_alt_alt_alt_alt_alt_alt_alt",
		"mekanism:machineblock_5_alt_alt_alt_alt_alt_alt",
		"mekanism:machineblock_5_alt_alt_alt_alt_alt",
		"mekanism:machineblock_5_alt_alt_alt_alt",
		"mekanism:machineblock_5_alt_alt_alt",
		"mekanism:machineblock_5_alt_alt",
		"mekanism:machineblock_5_alt",
		"mekanism:machineblock_5",
		"mekanism:machineblock_6_alt_alt_alt_alt_alt_alt_alt_alt",
		"mekanism:machineblock_6_alt_alt_alt_alt_alt_alt_alt",
		"mekanism:machineblock_6_alt_alt_alt_alt_alt_alt",
		"mekanism:machineblock_6_alt_alt_alt_alt_alt",
		"mekanism:machineblock_6_alt_alt_alt_alt",
		"mekanism:machineblock_6_alt_alt_alt",
		"mekanism:machineblock_6_alt_alt",
		"mekanism:machineblock_6_alt",
		"mekanism:machineblock_6",
		"mekanism:machineblock_7_alt_alt_alt_alt_alt_alt_alt_alt",
		"mekanism:machineblock_7_alt_alt_alt_alt_alt_alt_alt",
		"mekanism:machineblock_7_alt_alt_alt_alt_alt_alt",
		"mekanism:machineblock_7_alt_alt_alt_alt_alt",
		"mekanism:machineblock_7_alt_alt_alt_alt",
		"mekanism:machineblock_7_alt_alt_alt",
		"mekanism:machineblock_7_alt_alt",
		"mekanism:machineblock_7_alt",
		"mekanism:machineblock_7",
		"minecraft:torch",
		"projecte:conversions/diamond_to_emerald",
		"projecte:conversions/diamond_to_gold",
		"projecte:conversions/emerald_to_diamond",
		"projecte:conversions/gold_to_diamond",
		"projecte:conversions/gold_to_iron",
		"projecte:conversions/iron_to_ender_pearl",
		"projecte:conversions/iron_to_gold",
		"projecte:item.pe_matter_1_alt",
		"projecte:item.pe_matter_1",
		"railcraft:block_creosote",
		"railcraft:coke_oven_red$2",
		"railcraft:coke_oven$2",
		"railcraft:locomotive_steam_solid#0$1",
		"railcraft:minecraft_torch$1",
		"railcraft:minecraft_torch$2",
		"thermalexpansion:dynamo_1",
		"thermalexpansion:dynamo_2",
		"thermalexpansion:dynamo_3",
		"thermalexpansion:dynamo_4",
		"thermalexpansion:dynamo_5",
		"thermalexpansion:dynamo",
		"thermalfoundation:gunpowder_1",
		"thermalfoundation:gunpowder",
		"thermalfoundation:torch_1",
		"thermalfoundation:torch",
	];
	for i in removeCraftingName {
		recipes.removeByRecipeName(i);
	}
	for i in 0 to 15 {
		recipes.removeByRecipeName("mekanism:balloon_" ~ i);
		recipes.removeByRecipeName("dcs_lib:balloon_" ~ i ~ "_dcs");
	}
	//追加
		//HaCの色のしずくによる素材の変換
		HiiragiUtils.addCraftingShapeless(false, <minecraft:slime_ball>, [<ore:dropGreen>, <ore:dustGunpowder>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <ore:dustBorax>.firstItem, [<ore:dropBlue>, <ore:dustGunpowder>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <ore:dustCoal>.firstItem, [<ore:dropBlack>, <ore:dustGunpowder>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <ore:dustRedstone>.firstItem, [<ore:dropRed>, <ore:dustGunpowder>], null, null);
		//HaCの色のエッセンスによる素材の変換
		HiiragiUtils.addCraftingShapeless(false, <enderio:item_material:62>, [<ore:extractGreen>, <ore:slimeball>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <ore:dustBasalz>.firstItem, [<ore:extractBlack>, <ore:dustGunpowder>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <ore:dustBlaze>.firstItem, [<ore:extractRed>, <ore:dustGunpowder>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <ore:dustBlitz>.firstItem, [<ore:extractWhite>, <ore:dustGunpowder>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <ore:dustBlizz>.firstItem, [<ore:extractBlue>, <ore:dustGunpowder>], null, null);
		//松明のレシピの調整
		val mapTinder as IOreDictEntry[] = [
			<ore:charcoal>,
			<ore:coal>,
			<ore:coalPowered>,
			<ore:dropCoaltar>,
			<ore:dropGlycerin>,
			<ore:dropRosin>,
			<ore:fuelCoke>,
			];
		for i in mapTinder {
			HiiragiUtils.addCraftingShapeless(false, <dcs_climate:dcs_tinder:0>*4, [<ore:stickWood>, i], null, null);
		}
		HiiragiUtils.addCraftingShapeless(false, <dcs_climate:dcs_tinder:0>*4, [<ore:stickWood>, <ore:blockWool>, <liquid:creosote>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <minecraft:torch>, [<dcs_climate:dcs_tinder:1>], null, null);
		//Coke周りのレシピの調整
		HiiragiUtils.addCraftingShaped(true, <dcs_climate:dcs_cont_fuel>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<dcs_climate:dcs_reagent:13>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <railcraft:coke_block>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<railcraft:fuel_coke>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <thermalfoundation:storage_resource:1>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<thermalfoundation:material:802>}).ingredients, null, null);
		//解釈違いの新たなキューブ
		HiiragiUtils.addCraftingShaped(false, <contenttweaker:cube_cyan>, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<minecraft:ghast_tear>, B:<contenttweaker:cube_cyan_inactive>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(false, <contenttweaker:cube_magenta>, RecipePattern.init(["ABA", "ACA", "ABA"]).map({A:<dcs_climate:dcs_gem_blue:2>, B:<extrautils2:ingredients:5>, C:<contenttweaker:cube_magenta_inactive>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(false, <contenttweaker:cube_yellow>, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<twilightforest:torchberries>, B:<contenttweaker:cube_yellow_inactive>}).ingredients, null, null);
		HiiragiUtils.addCraftingShapeless(false, <contenttweaker:cube_cyan>, [<ore:blockElestial>, <ore:gemManaDiamond>, <ore:itemPulsatingPowder>], HiiragiUtils.rainCheck(<contenttweaker:cube_cyan_inactive>), null);
		HiiragiUtils.addCraftingShapeless(false, <contenttweaker:cube_magenta>, [<ore:blockElestial>, <ore:gemDragonStone>, <ore:dustRefinedObsidian>], HiiragiUtils.nightCheck(<contenttweaker:cube_magenta_inactive>), null);
		HiiragiUtils.addCraftingShapeless(false, <contenttweaker:cube_yellow>, [<ore:blockElestial>, <extrautils2:suncrystal:0>, <ore:dustLumium>],HiiragiUtils.dimCheck(7, <contenttweaker:cube_yellow_inactive>),null);
		HiiragiUtils.addCraftingShaped(false, <contenttweaker:cube_iridescent>, [
			[<ore:cubeMagenta>, <ore:cubeWhite>, <ore:cubeRed>],
			[<ore:cubeBlue>, <minecraft:nether_star>, <ore:cubeYellow>],
			[<ore:cubeCyan>, <ore:cubeBlack>, <ore:cubeGreen>],
		], null, null);
		//青の金のリングの置き換え
		HiiragiUtils.addCraftingShaped(false, <contenttweaker:dcs_color_ring2>, [[<ore:dustCrystal>], [<ore:dropBlue>], [<ore:ingotGold>]], null, null);
		///クモ糸の置換
		val replaceString as IItemStack[] = [
			<extrautils2:goldenlasso>,
			<minecraft:book>,
			<tconstruct:materials:15>,
			<tconstruct:slimesling:0>,
			<tconstruct:slimesling:1>,
			<tconstruct:slimesling:2>,
			<tconstruct:slimesling:3>,
			<tconstruct:slimesling:4>,
			<tconstruct:slimesling:5>,
		];
		for i in replaceString {
			HiiragiUtils.recipeReplace(<minecraft:string>, <ore:string>, i);
		}

	HiiragiUtils.addCraftingShaped(false, <buildinggadgets:buildingtool>, RecipePattern.init(["ABA", "ACA", "ADA"]).map({A:<ore:plateIron>, B:<extrautils2:itemcreativebuilderswand>, C:<thermalfoundation:material:640>, D:<thermalfoundation:material:512>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <buildinggadgets:destructiontool>, RecipePattern.init(["ABA", "ACA", "ADA"]).map({A:<ore:plateSteel>, B:<extrautils2:itemcreativedestructionwand>, C:<thermalfoundation:material:640>, D:<thermalfoundation:material:512>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <contenttweaker:ingot_bedrockium>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:compressed3xCobblestone>, B:<ore:compressed4xCobblestone>, C:<ore:blockDiamond>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <contenttweaker:pumpkin_melon>, RecipePattern.init(["AAA", "BAC", "AAA"]).map({A:<ore:listAllseeds>, B:<minecraft:pumpkin>, C:<minecraft:melon_block>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <disenchanter:disenchantmenttable:0>, RecipePattern.init(["ABA", "CDC", "EEE"]).map({A:<botania:spellcloth>, B:<ore:book>, C:<ore:gemEmerald>, D:<ore:woolYellow>, E:<ore:obsidian>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <inspirations:mulch:0>, RecipePattern.init([" A ", "ABA", " A "]).map({A:<ore:stickWood>, B:<ore:dustPlant>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <storagedrawers:framingtable>, RecipePattern.init(["ABA", "C C"]).map({A:<ore:drawerTrim>, B:<minecraft:crafting_table>, C:<dcs_climate:dcs_squaretable_wood>}).ingredients, null, null);
	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:feather_black>, [<minecraft:feather>, <botania:dye:15>, <botania:dye:15>, <botania:dye:15>], null, null);
	HiiragiUtils.addCraftingShapeless(false, <storagedrawers:upgrade_creative>, [<storagedrawers:upgrade_storage:4>, <extendedcrafting:singularity_ultimate>.reuse()], null, null);

//かまどレシピの編集
	//削除
	val removeFurnace as IItemStack[] = [
		<appliedenergistics2:material:5>,
		<dcs_climate:dcs_cont_fuel>,
		<dcs_climate:dcs_gem_red>,
		<dcs_climate:dcs_ingot:11>,
		<dcs_climate:dcs_reagent:3>,
		<minecraft:clay_ball>,
		<threng:material:0>,
	];
	for i in removeFurnace {
		furnace.remove(i);
	}
	//新規
	val addFurnace as IIngredient[IItemStack] = {
		<appliedenergistics2:material:22>: <appliedenergistics2:material:18>,
		<appliedenergistics2:material:23>: <appliedenergistics2:material:16>,
		<appliedenergistics2:material:24>: <appliedenergistics2:material:17>,
		<contenttweaker:ingot_bedrockium>*9: <ore:compressed8xCobblestone>,
		<dcs_climate:dcs_tinder:1>: <dcs_climate:dcs_tinder:0>,
		<mechanics:heavy_block>: <extrautils2:compressedcobblestone:1>,
		<tconstruct:casting:1>: <contenttweaker:unfired_casting_basin>,
		<tconstruct:casting>: <contenttweaker:unfired_casting_table>,
		<tconstruct:channel>: <contenttweaker:unfired_casting_channel>,
		<thermalfoundation:rockwool:7>: <ore:dustAsbest>,
		<thermalfoundation:storage:3>: <contenttweaker:dustblock_lead>,
		<threng:material:14>: <contenttweaker:assembly_speculative>,
		<threng:material:6>: <contenttweaker:assembly_parallel>,
	};
	for output, input in addFurnace {
		furnace.addRecipe(output, input);
	}

//Tooltipの追加
val mapTooltip as string[IItemStack] = {
	<ae2wtlib:infinity_booster_card>: "gohd.tooltip.infinity_booster_card.name",
	<contenttweaker:cube_cyan>: "gohd.tooltip.cube_cyan.name",
	<contenttweaker:cube_magenta>: "gohd.tooltip.cube_magenta.name",
	<contenttweaker:cube_yellow>: "gohd.tooltip.cube_yellow.name",
	<contenttweaker:dcs_color_ring2>: "gohd.tooltip.dcs_color_ring2.name",
	<contenttweaker:quantum_entangler>: "gohd.tooltip.quantum_entangler.name",
	<dcs_climate:dcs_food_unidentified:*>: "gohd.tooltip.identify_microbe.name",
	<dcs_climate:dcs_magic_card_m3:*>: "gohd.tooltip.only_crate.name",
	<dcs_climate:dcs_magic_card:11>: "gohd.tooltip.cube_spell_green.name",
	<extendedcrafting:material:32>: "gohd.tooltip.ingot_rainbow.name",
	<minecraft:bedrock>: "gohd.tooltip.bedrock.name",
	<tconstruct:rack:*>: "gohd.tooltip.tcon_appear.name",
	<tconstruct:toolforge:0>: "gohd.tooltip.tcon_appear.name",
	<tconstruct:tooltables:1>: "gohd.tooltip.tcon_appear.name",
	<tconstruct:tooltables:2>: "gohd.tooltip.tcon_appear.name",
};
for i, j in mapTooltip {
	i.addTooltip(I18n.format(j));
}
	//粉末ブロックへのTooltipの追加
	val mapDustblock as IItemStack[] = itemUtils.getItemsByRegexRegistryName(".*dustblock_.*");
	for i in mapDustblock {
		i.addTooltip(I18n.format("gohd.tooltip.dustblock.name"));
	}

//耐久値の調整
	<mekanismtools:osmiumaxe>.maxDamage = <thermalfoundation:tool.axe_platinum>.maxDamage;
	<mekanismtools:osmiumboots>.maxDamage = <thermalfoundation:armor.boots_platinum>.maxDamage;
	<mekanismtools:osmiumchestplate>.maxDamage = <thermalfoundation:armor.plate_platinum>.maxDamage;
	<mekanismtools:osmiumhelmet>.maxDamage = <thermalfoundation:armor.helmet_platinum>.maxDamage;
	<mekanismtools:osmiumhoe>.maxDamage = <thermalfoundation:tool.hoe_platinum>.maxDamage;
	<mekanismtools:osmiumleggings>.maxDamage = <thermalfoundation:armor.legs_platinum>.maxDamage;
	<mekanismtools:osmiumpaxel>.maxDamage = <thermalfoundation:tool.pickaxe_platinum>.maxDamage * 1.5;
	<mekanismtools:osmiumpickaxe>.maxDamage = <thermalfoundation:tool.pickaxe_platinum>.maxDamage;
	<mekanismtools:osmiumshovel>.maxDamage = <thermalfoundation:tool.shovel_platinum>.maxDamage;
	<mekanismtools:osmiumsword>.maxDamage = <thermalfoundation:tool.sword_platinum>.maxDamage;

//スタック数の調整
	<biomesoplenty:jar_filled:*>.maxStackSize = 64;
	<biomesoplenty:terrestrial_artifact>.maxStackSize = 64;
	<forge:bucketfilled>.maxStackSize = 16;
	<minecraft:cake>.maxStackSize = 16;
	<minecraft:knowledge_book>.maxStackSize = 64;
	<minecraft:saddle>.maxStackSize = 16;

//採掘レベルの調整
	//<botania:platform:2>.definition.setHarvestLevel("axe", 4);

//Workbench Plusレシピの編集
WorkbenchPlus.addRecipe([
	<minecraft:knowledge_book>*8,
	<ae2wtlib:infinity_booster_card>*8,
	<biomesoplenty:terrestrial_artifact>*128,
	<botania:gaiahead>*3,
	<extendedcrafting:singularity_ultimate>,
	<extrautils2:lawsword>,
	<contenttweaker:cube_iridescent>*128,
	<mekanism:basicblock2:4>.withTag({tier: 3})*8,
	<openblocks:trophy>.withTag({entity_id: "minecraft:pig"}),
	<openblocks:trophy>.withTag({entity_id: "minecraft:creeper"}),
	<projecte:item.pe_philosophers_stone>,
	<projecte:item.pe_klein_star:5>.withTag({StoredEMC: 51200000 as long}),
	<railcraft:firestone_refined>,
	<twilightforest:miniature_structure:0>,
	<thermalfoundation:material:1028>,
	<tconstruct:materials:50>*3,
	], <biomesoplenty:earth>, 20111118.0);

//このscriptの読み込みの完了をログに出力
print("unification.zs loaded!");
