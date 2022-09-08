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
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;
import scripts.jei;

//このscriptの読み込みの開始をログに出力
print("Start loading unification.zs ...");

//作業台レシピの編集
	//削除
	val removeCrafting as IItemStack[] = [
		<advancedrocketry:concrete>,
		<advancedrocketry:ic:*>,
		<advancedrocketry:productgear:*>,
		<appliedenergistics2:material:9>,
		<compactmachines3:psd>,
		<dcs_climate:dcs_magic_card_m3:*>,
		<dcs_climate:dcs_ore_gemblock:4>,
		<dcs_climate:dcs_device_shaft_l>,
		<dcs_climate:dcs_device_shaft_ta>,
		<dcs_climate:dcs_device_shaft_tb>,
		<dcs_climate:dcs_device_shaft_x>,
		<dcs_climate:dcs_device_shaft_switch>,
		<dcs_climate:dcs_device_shaft_l_steel>,
		<dcs_climate:dcs_device_shaft_ta_steel>,
		<dcs_climate:dcs_device_shaft_tb_steel>,
		<dcs_climate:dcs_device_shaft_x_steel>,
		<dcs_climate:dcs_device_shaft_switch_steel>,
		<dcs_climate:dcs_device_shaft_l_sus>,
		<dcs_climate:dcs_device_shaft_ta_sus>,
		<dcs_climate:dcs_device_shaft_tb_sus>,
		<dcs_climate:dcs_device_shaft_x_sus>,
		<hap:shaft_l_shaped_steel>,
		<hap:shaft_bifurcated_steel>,
		<hap:shaft_perpendicular_steel>,
		<hap:shaft_t_shaped_steel>,
		<hap:shaft_x_shaped_steel>,
		<hap:shaft_l_shaped_sus>,
		<hap:shaft_bifurcated_sus>,
		<hap:shaft_perpendicular_sus>,
		<hap:shaft_t_shaped_sus>,
		<hap:shaft_x_shaped_sus>,
		<enderio:item_basic_capacitor:*>,
		<enderio:item_material:11>,
		<enderio:item_material:12>,
		<enderio:item_material:13>,
		<enderio:item_material:14>,
		<enderio:item_material:15>,
		<enderio:item_material:60>,
		<enderio:item_material:65>,
		<enderio:item_material:71>,
		<enderio:item_material:73>,
		<enderio:item_conduit_probe>,
		<enderio:item_magnet>,
		<enderio:item_inventory_charger_simple>,
		<enderio:item_inventory_charger_basic>,
		<enderio:item_inventory_charger>,
		<enderio:item_inventory_charger_vibrant>,
		<enderio:item_extract_speed_upgrade>,
		<enderio:item_extract_speed_downgrade>,
		<enderio:block_reservoir>,
		<enderio:block_omni_reservoir>,
		<enderio:block_solar_panel:*>,
		<mekanism:controlcircuit:*>,
		<mekanism:basicblock:8>,
		<mekanism:speedupgrade>,
		<mekanism:energyupgrade>,
		<mekanism:filterupgrade>,
		<mekanism:mufflingupgrade>,
		<mekanism:gasupgrade>,
		<mekanism:anchorupgrade>,
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
		HiiragiUtils.removeCrafting(i);
	}
	val removeCraftingName as string[] = [
		"minecraft:torch",
		"buildinggadgets:buildingtool",
		"buildinggadgets:destructiontool",
		"dcs_climate:machine_advanced/dcs_torch_0",
		"dcs_climate:machine_advanced/dcs_torch_0_2",
		"dcs_climate:main/dcs_planks_0",
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
		"dcs_climate:magic/dcs_glowstone_dust_0",
		"dcs_climate:main_yagen/dcs_gem_layer_1",
		"dcs_climate:main_yagen/dcs_gem_layer_4",
		"enderio:s_a_g_mill_upgrade",
		"enderio:stirling_generator_upgrade",
		"enderio:wired_charger_upgrade",
		"enderio:alloy_smelter_upgrade",
		"enderio:crafter_upgrade",
		"extrautils2:unstable_nugget",
		"mekanism:machineblock_5",
		"mekanism:machineblock_5_alt",
		"mekanism:machineblock_5_alt_alt",
		"mekanism:machineblock_5_alt_alt_alt",
		"mekanism:machineblock_5_alt_alt_alt_alt",
		"mekanism:machineblock_5_alt_alt_alt_alt_alt",
		"mekanism:machineblock_5_alt_alt_alt_alt_alt_alt",
		"mekanism:machineblock_5_alt_alt_alt_alt_alt_alt_alt",
		"mekanism:machineblock_5_alt_alt_alt_alt_alt_alt_alt_alt",
		"mekanism:machineblock_6",
		"mekanism:machineblock_6_alt",
		"mekanism:machineblock_6_alt_alt",
		"mekanism:machineblock_6_alt_alt_alt",
		"mekanism:machineblock_6_alt_alt_alt_alt",
		"mekanism:machineblock_6_alt_alt_alt_alt_alt",
		"mekanism:machineblock_6_alt_alt_alt_alt_alt_alt",
		"mekanism:machineblock_6_alt_alt_alt_alt_alt_alt_alt",
		"mekanism:machineblock_6_alt_alt_alt_alt_alt_alt_alt_alt",
		"mekanism:machineblock_7",
		"mekanism:machineblock_7_alt",
		"mekanism:machineblock_7_alt_alt",
		"mekanism:machineblock_7_alt_alt_alt",
		"mekanism:machineblock_7_alt_alt_alt_alt",
		"mekanism:machineblock_7_alt_alt_alt_alt_alt",
		"mekanism:machineblock_7_alt_alt_alt_alt_alt_alt",
		"mekanism:machineblock_7_alt_alt_alt_alt_alt_alt_alt",
		"mekanism:machineblock_7_alt_alt_alt_alt_alt_alt_alt_alt",
		"railcraft:block_creosote",
		"railcraft:minecraft_torch$1",
		"railcraft:minecraft_torch$2",
		"railcraft:coke_oven$2",
		"railcraft:coke_oven_red$2",
		"railcraft:locomotive_steam_solid#0$1",
		"thermalexpansion:dynamo",
		"thermalexpansion:dynamo_1",
		"thermalexpansion:dynamo_2",
		"thermalexpansion:dynamo_3",
		"thermalexpansion:dynamo_4",
		"thermalexpansion:dynamo_5",
		"thermalfoundation:gunpowder",
		"thermalfoundation:gunpowder_1",
		"thermalfoundation:torch",
		"thermalfoundation:torch_1",
	];
	for i in removeCraftingName {
		recipes.removeByRecipeName(i);
	}
	for i in 0 to 15 {
		recipes.removeByRecipeName("mekanism:balloon_" ~ i);
		recipes.removeByRecipeName("dcs_lib:balloon_" ~ i ~ "_dcs");
	}
	//追加
		//HaCの色のしずく/エッセンスによる粉末の変換
		HiiragiUtils.addCraftingShapeless(false, <minecraft:slime_ball>, [<ore:dropGreen>, <ore:dustGunpowder>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <ore:dustBlizz>.firstItem, [<ore:dropBlue>, <ore:dustGunpowder>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <ore:dustBlitz>.firstItem, [<ore:dropWhite>, <ore:dustGunpowder>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <ore:dustBasalz>.firstItem, [<ore:dropBlack>, <ore:dustGunpowder>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <ore:dustPyrotheum>.firstItem, [<ore:extractRed>, <ore:dustBlaze>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <enderio:item_material:62>, [<ore:extractGreen>, <ore:slimeball>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <ore:dustCryotheum>.firstItem, [<ore:extractBlue>, <ore:dustBlizz>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <ore:dustAerotheum>.firstItem, [<ore:extractWhite>, <ore:dustBlitz>], null, null);
		HiiragiUtils.addCraftingShapeless(false, <ore:dustPetrotheum>.firstItem, [<ore:extractBlack>, <ore:dustBasalz>], null, null);
		//松明のレシピの調整
		val mapTinder as IOreDictEntry[] = [
			<ore:coal>,
			<ore:charcoal>,
			<ore:dropGlycerin>,
			<ore:dropCoaltar>,
			<ore:dropRosin>,
			<ore:fuelCoke>,
			<ore:coalPowered>,
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
		//Ragi Ticketの分解レシピ
			HiiragiUtils.addCraftingShapeless(false, <contenttweaker:ticket_common>*4, [<contenttweaker:ticket_uncommon>], null, null);
			HiiragiUtils.addCraftingShapeless(false, <contenttweaker:ticket_uncommon>*4, [<contenttweaker:ticket_rare>], null, null);
			HiiragiUtils.addCraftingShapeless(false, <contenttweaker:ticket_rare>*4, [<contenttweaker:ticket_epic>], null, null);
			HiiragiUtils.addCraftingShapeless(false, <contenttweaker:ticket_epic>*4, [<contenttweaker:ticket_legendary>], null, null);
		//解釈違いの新たなキューブ
		HiiragiUtils.addCraftingShapeless(false, <contenttweaker:cube_cyan>, [<ore:blockElestial>, <ore:gemManaDiamond>, <ore:itemPulsatingPowder>], HiiragiUtils.rainCheck(<contenttweaker:cube_cyan_inactive>), null);
		HiiragiUtils.addCraftingShaped(false, <contenttweaker:cube_cyan>, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<minecraft:ghast_tear>, B:<contenttweaker:cube_cyan_inactive>}).ingredients, null, null);
		HiiragiUtils.addCraftingShapeless(false, <contenttweaker:cube_magenta>, [<ore:blockElestial>, <ore:gemDragonStone>, <ore:dustRefinedObsidian>], HiiragiUtils.nightCheck(<contenttweaker:cube_magenta_inactive>), null);
		HiiragiUtils.addCraftingShaped(false, <contenttweaker:cube_magenta>, RecipePattern.init(["ABA", "ACA", "ABA"]).map({A:<dcs_climate:dcs_gem_blue:2>, B:<extrautils2:ingredients:5>, C:<contenttweaker:cube_magenta_inactive>}).ingredients, null, null);
		HiiragiUtils.addCraftingShapeless(false, <contenttweaker:cube_yellow>, [<ore:blockElestial>, <extrautils2:suncrystal:0>, <ore:dustLumium>],HiiragiUtils.dimCheck(7, <contenttweaker:cube_yellow_inactive>),null);
		HiiragiUtils.addCraftingShaped(false, <contenttweaker:cube_yellow>, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<twilightforest:torchberries>, B:<contenttweaker:cube_yellow_inactive>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(false, <contenttweaker:cube_iridescent>, [
			[<ore:cubeMagenta>, <ore:cubeWhite>, <ore:cubeRed>],
			[<ore:cubeBlue>, <minecraft:nether_star>, <ore:cubeYellow>],
			[<ore:cubeCyan>, <ore:cubeBlack>, <ore:cubeGreen>],
		], null, null);
		//青の金のリングの置き換え
		HiiragiUtils.addCraftingShaped(false, <contenttweaker:dcs_color_ring2>, [[<ore:dustCrystal>], [<ore:dropBlue>], [<ore:ingotGold>]], null, null);
		//Loot Crate
		//HiiragiUtils.addCraftingShaped(false, <ftbquests:lootcrate>.withTag({type: "gohd_reward_loot_magic_spell_title"}), RecipePattern.init(["AA", "AB"]).map({A:<ore:paper>, B:<contenttweaker:ticket_uncommon>}).ingredients, null, null);
		//HiiragiUtils.addCraftingShaped(false, <ftbquests:lootcrate>.withTag({type: "gohd_reward_loot_botania_rod_title"}), RecipePattern.init(["  A", " B ", "B  "]).map({A:<contenttweaker:ticket_rare>, B:<ore:livingwoodTwig>}).ingredients, null, null);
		//Custom Tools
		HiiragiUtils.addCraftingShaped(false, jei.axeGaia, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:dropofevil>, B:<contenttweaker:ticket_legendary>, C:<botania:elementiumaxe>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(false, jei.gunDevil, RecipePattern.init(["ABC", "BAB", "CBD"]).map({A:<ore:barrelMortar>, B:<contenttweaker:ticket_legendary>, C:<dcs_climate:dcs_cont_fuel:2>, D:<dcs_climate:dcs_musket>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(false, jei.rodSea, RecipePattern.init(["ABC", "BDB", "CBA"]).map({A:<ore:gemPrismarine>, B:<contenttweaker:ticket_legendary>, C:<ore:dustPrismarine>, D:<thermalfoundation:tool.fishing_rod_diamond>}).ingredients, null, null);

	HiiragiUtils.addCraftingShaped(true, <disenchanter:disenchantmenttable:0>, RecipePattern.init(["ABA", "CDC", "EEE"]).map({A:<botania:spellcloth>, B:<ore:book>, C:<ore:gemEmerald>, D:<ore:woolYellow>, E:<ore:obsidian>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <storagedrawers:framingtable>, RecipePattern.init(["ABA", "C C"]).map({A:<ore:drawerTrim>, B:<minecraft:crafting_table>, C:<dcs_climate:dcs_squaretable_wood>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <contenttweaker:ingot_bedrockium>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:compressed3xCobblestone>, B:<ore:compressed4xCobblestone>, C:<ore:blockDiamond>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <inspirations:mulch:0>, RecipePattern.init([" A ", "ABA", " A "]).map({A:<ore:stickWood>, B:<ore:dustPlant>}).ingredients, null, null);
	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:feather_black>, [<minecraft:feather>, <botania:dye:15>, <botania:dye:15>, <botania:dye:15>], null, null);
	HiiragiUtils.addCraftingShaped(false, <buildinggadgets:buildingtool>, RecipePattern.init(["ABA", "ACA", "ADA"]).map({A:<ore:plateIron>, B:<extrautils2:itemcreativebuilderswand>, C:<thermalfoundation:material:640>, D:<thermalfoundation:material:512>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <buildinggadgets:destructiontool>, RecipePattern.init(["ABA", "ACA", "ADA"]).map({A:<ore:plateSteel>, B:<extrautils2:itemcreativedestructionwand>, C:<thermalfoundation:material:640>, D:<thermalfoundation:material:512>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <contenttweaker:pumpkin_melon>, RecipePattern.init(["AAA", "BAC", "AAA"]).map({A:<ore:listAllseeds>, B:<minecraft:pumpkin>, C:<minecraft:melon_block>}).ingredients, null, null);

//かまどレシピの編集
	//削除
	val removeFurnace as IItemStack[] = [
		<appliedenergistics2:material:5>,
		<dcs_climate:dcs_cont_fuel>,
		<dcs_climate:dcs_gem_red>,
		<dcs_climate:dcs_ingot:11>,
		<dcs_climate:dcs_reagent:3>,
		<threng:material:0>,
		<libvulpes:productingot:4>,
		<libvulpes:productingot:5>,
		<libvulpes:productingot:6>,
		<libvulpes:productingot:7>,
		<libvulpes:productingot:9>,
		<libvulpes:productingot:10>,
		<mekanism:ingot:1>,
		<minecraft:clay_ball>,
		<minecraft:gold_ingot>,
		<minecraft:iron_ingot>,
		<thermalfoundation:material:128>,
		<thermalfoundation:material:129>,
		<thermalfoundation:material:130>,
		<thermalfoundation:material:131>,
		<thermalfoundation:material:132>,
		<thermalfoundation:material:133>,
		<thermalfoundation:material:134>,
		<thermalfoundation:material:135>,
		<thermalfoundation:material:136>,
		<thermalfoundation:material:160>,
		<thermalfoundation:material:161>,
		<thermalfoundation:material:162>,
		<thermalfoundation:material:163>,
		<thermalfoundation:material:164>,
		<tconstruct:ingots:0>,
		<tconstruct:ingots:1>,
	];
	for i in removeFurnace {
		furnace.remove(i);
	}
	//新規
	val addFurnace as IIngredient[IItemStack] = {
		<tconstruct:channel>: <contenttweaker:unfired_casting_channel>,
		<tconstruct:casting>: <contenttweaker:unfired_casting_table>,
		<tconstruct:casting:1>: <contenttweaker:unfired_casting_basin>,
		<thermalfoundation:rockwool:7>: <ore:dustAsbest>,
		<appliedenergistics2:material:23>: <appliedenergistics2:material:16>,
		<appliedenergistics2:material:24>: <appliedenergistics2:material:17>,
		<appliedenergistics2:material:22>: <appliedenergistics2:material:18>,
		<contenttweaker:ingot_bedrockium>*9: <ore:compressed8xCobblestone>,
		<dcs_climate:dcs_tinder:1>: <dcs_climate:dcs_tinder:0>,
		<threng:material:6>: <contenttweaker:assembly_parallel>,
		<threng:material:14>: <contenttweaker:assembly_speculative>,
		<tconstruct:metal:5>: <contenttweaker:dustblock_alubrass>,
		<thermalfoundation:storage:3>: <contenttweaker:dustblock_lead>,
		<extrautils2:ingredients:5>: <ore:turfMoon>
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
	//<contenttweaker:glyph_activated>: "gohd.tooltip.sigil_activated.name",
	//<contenttweaker:glyph_divide>: "gohd.tooltip.sigil_glyph.name",
	<contenttweaker:ingot_rainbow>: "gohd.tooltip.ingot_rainbow.name",
	<contenttweaker:quantum_entangler>: "gohd.tooltip.quantum_entangler.name",
	<contenttweaker:unfired_casting_basin>: "gohd.tooltip.grout_forming.name",
	<contenttweaker:unfired_casting_channel>: "gohd.tooltip.grout_forming.name",
	<contenttweaker:unfired_casting_table>: "gohd.tooltip.grout_forming.name",
	<dcs_climate:dcs_food_unidentified:*>: "gohd.tooltip.identify_microbe.name",
	<dcs_climate:dcs_magic_card:11>: "gohd.tooltip.cube_spell_green.name",
	<dcs_climate:dcs_magic_card_m3:*>: "gohd.tooltip.only_crate.name",
	<dcs_climate:dcs_tinder:1>: "gohd.tooltip.burning_stick.name",
	<ezstorage:output_port>: "gohd.tooltip.ezstorage_ejection.name",
	<ezstorage:access_terminal>: "gohd.tooltip.ezstorage_terminal.name",
	<ezstorage:security_box>: "gohd.tooltip.ezstorage_security.name",
	<ezstorage:dolly>: "gohd.tooltip.ezstorage_dolly.name",
	<ezstorage:dolly_super>: "gohd.tooltip.ezstorage_dolly.name",
	<minecraft:bedrock>: "gohd.tooltip.bedrock.name",
	<tconstruct:toolforge:0>: "gohd.tooltip.tool_forge.name",
};
for i, j in mapTooltip {
	i.addTooltip(I18n.format(j));
}
	//EZ StorageへのTooltipの追加
	val mapStorage as string[IItemStack] = {
		<ezstorage:storage_box>: "400",
		<ezstorage:condensed_storage_box>: "4,000",
		<ezstorage:super_storage_box>: "20,000",
		<ezstorage:ultra_storage_box>: "80,000",
		<ezstorage:hyper_storage_box>: "400,000",
	};
	for i, j in mapStorage {
		i.addTooltip(I18n.format("gohd.tooltip.ezstorage_box.name", j));
	}
	//粉末ブロックへのTooltipの追加
	val mapDustblock as IItemStack[] = itemUtils.getItemsByRegexRegistryName(".*dustblock_.*");
	for i in mapDustblock {
		i.addTooltip(I18n.format("gohd.tooltip.dustblock.name"));
	}

//耐久値の調整
	<mekanismtools:osmiumpickaxe>.maxDamage = <thermalfoundation:tool.pickaxe_platinum>.maxDamage;
	<mekanismtools:osmiumaxe>.maxDamage = <thermalfoundation:tool.axe_platinum>.maxDamage;
	<mekanismtools:osmiumshovel>.maxDamage = <thermalfoundation:tool.shovel_platinum>.maxDamage;
	<mekanismtools:osmiumhoe>.maxDamage = <thermalfoundation:tool.hoe_platinum>.maxDamage;
	<mekanismtools:osmiumsword>.maxDamage = <thermalfoundation:tool.sword_platinum>.maxDamage;
	<mekanismtools:osmiumpaxel>.maxDamage = <thermalfoundation:tool.pickaxe_platinum>.maxDamage * 1.5;
	<mekanismtools:osmiumhelmet>.maxDamage = <thermalfoundation:armor.helmet_platinum>.maxDamage;
	<mekanismtools:osmiumchestplate>.maxDamage = <thermalfoundation:armor.plate_platinum>.maxDamage;
	<mekanismtools:osmiumleggings>.maxDamage = <thermalfoundation:armor.legs_platinum>.maxDamage;
	<mekanismtools:osmiumboots>.maxDamage = <thermalfoundation:armor.boots_platinum>.maxDamage;

//スタック数の調整
	<minecraft:cake>.maxStackSize = 16;
	<forge:bucketfilled>.maxStackSize = 16;
	<biomesoplenty:jar_filled:*>.maxStackSize = 64;

//採掘レベルの調整
	//<botania:platform:2>.definition.setHarvestLevel("axe", 4);

//このscriptの読み込みの完了をログに出力
print("unification.zs loaded!");
