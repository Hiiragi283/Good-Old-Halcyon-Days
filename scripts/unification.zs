#====================================================================
# ファイル名 : unification.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Script for unifing some conflicts and internal data
#====================================================================

#priority 90

//crafttweakerからclassをimport
import crafttweaker.block.IBlockDefinition;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.player.IPlayer;
import crafttweaker.recipes.ICraftingInfo;
import crafttweaker.util.Position3f;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading unification.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
	val removeCrafting as IItemStack[] = [
		<dcs_climate:dcs_magic_card_m3:*>,
		<dcs_climate:dcs_ore_gemblock:4>,
	];
	for i in removeCrafting {
		HiiragiUtils.removeCrafting(i);
	}
	val removeCraftingName as string[] = [
		"minecraft:torch",
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
		//"extrautils2:machine_base",
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
	//バニラ染料を最新版のような方式に統一する
	HiiragiUtils.addCraftingShapeless(false, <biomesoplenty:black_dye>, [<minecraft:dye:0>], null, null);
	HiiragiUtils.addCraftingShapeless(false, <biomesoplenty:brown_dye>, [<minecraft:dye:3>], null, null);
	HiiragiUtils.addCraftingShapeless(false, <biomesoplenty:blue_dye>, [<minecraft:dye:4>], null, null);
	HiiragiUtils.addCraftingShapeless(false, <biomesoplenty:white_dye>, [<minecraft:dye:15>], null, null);
	//Coke周りのレシピの調整
	HiiragiUtils.addCraftingShaped(true, <dcs_climate:dcs_cont_fuel>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<dcs_climate:dcs_reagent:13>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <railcraft:coke_block>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<railcraft:fuel_coke>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <thermalfoundation:storage_resource:1>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<thermalfoundation:material:802>}).ingredients, null, null);
	//Ragi Ticketの分解レシピ
	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:ticket_common>*4, [<contenttweaker:ticket_uncommon>], null, null);
	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:ticket_uncommon>*4, [<contenttweaker:ticket_rare>], null, null);
	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:ticket_rare>*4, [<contenttweaker:ticket_epic>], null, null);
	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:ticket_epic>*4, [<contenttweaker:ticket_legendary>], null, null);
	//BiblioCraftのレシピ調整
	HiiragiUtils.addCraftingShaped(false, <bibliocraft:lanterngold:0>, RecipePattern.init([" A ", "BCB", " A "]).map({A:<ore:ingotGold>, B:<ore:paneGlass>, C:<ore:torch>|<ore:dustGlowstone>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <bibliocraft:lanterniron:0>, RecipePattern.init([" A ", "BCB", " A "]).map({A:<ore:ingotIron>, B:<ore:paneGlass>, C:<ore:torch>|<ore:dustGlowstone>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <bibliocraft:lampgold:0>, RecipePattern.init(["ABA", " C ", "DCD"]).map({A:<ore:hardenedClay>, B:<dcs_climate:dcs_build_challamp:*>, C:<ore:ingotGold>, D:<ore:nuggetGold>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <bibliocraft:lampiron:0>, RecipePattern.init(["ABA", " C ", "DCD"]).map({A:<ore:hardenedClay>, B:<dcs_climate:dcs_build_challamp:*>, C:<ore:ingotIron>, D:<ore:nuggetIron>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <bibliocraft:typewriter:0>, RecipePattern.init(["ABA", "CDC", "EEE"]).map({A:<ore:gearBrass>, B:<ore:paper>, C:<ore:ingotIron>, D:<dcs_climate:dcs_desktop_accessories:5>, E:<minecraft:stained_hardened_clay:0>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <bibliocraft:swordpedestal:0>, RecipePattern.init([" A ", "ABA"]).map({A:<minecraft:stone_slab>, B:<minecraft:stained_hardened_clay:0>}).ingredients, null, null);
	//Castle Doorのレシピ
	HiiragiUtils.addCraftingShaped(false, <twilightforest:castle_door:0>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:dustVoid>, B:<appliedenergistics2:paint_ball:24>, C:<botania:quartztypedark:1>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <twilightforest:castle_door:1>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:dustVoid>, B:<appliedenergistics2:paint_ball:30>, C:<botania:quartztypedark:1>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <twilightforest:castle_door:2>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:dustVoid>, B:<appliedenergistics2:paint_ball:22>, C:<botania:quartztypedark:1>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <twilightforest:castle_door:3>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:dustVoid>, B:<appliedenergistics2:paint_ball:29>, C:<botania:quartztypedark:1>}).ingredients, null, null);
	//解釈違いの新たなキューブ
	//Only Crafted in Raining
		HiiragiUtils.addCraftingShapeless(false, <contenttweaker:cube_cyan>, [<ore:blockElestial>, <ore:gemManaDiamond>, <ore:itemPulsatingPowder>], HiiragiUtils.rainCheck(<contenttweaker:cube_cyan_inactive>), null);
		HiiragiUtils.addCraftingShaped(false, <contenttweaker:cube_cyan>, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<minecraft:ghast_tear>, B:<contenttweaker:cube_cyan_inactive>}).ingredients, null, null);
	//Only crafted in night
		HiiragiUtils.addCraftingShapeless(false, <contenttweaker:cube_magenta>, [<ore:blockElestial>, <ore:gemDragonStone>, <ore:dustRefinedObsidian>], HiiragiUtils.nightCheck(<contenttweaker:cube_magenta_inactive>), null);
		HiiragiUtils.addCraftingShaped(false, <contenttweaker:cube_magenta>, RecipePattern.init(["ABA", "ACA", "ABA"]).map({A:<dcs_climate:dcs_gem_blue:2>, B:<extrautils2:ingredients:5>, C:<contenttweaker:cube_magenta_inactive>}).ingredients, null, null);
	//Only Crafted in Twilight Forest
		HiiragiUtils.addCraftingShapeless(false, <contenttweaker:cube_yellow>, [<ore:blockElestial>, <extrautils2:suncrystal:0>, <ore:dustLumium>],HiiragiUtils.dimCheck(7, <contenttweaker:cube_yellow_inactive>),null);
		HiiragiUtils.addCraftingShaped(false, <contenttweaker:cube_yellow>, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<twilightforest:torchberries>, B:<contenttweaker:cube_yellow_inactive>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:cube_iridescent>, [
		[<ore:cubeMagenta>, <ore:cubeWhite>, <ore:cubeRed>],
		[<ore:cubeBlue>, <minecraft:nether_star>, <ore:cubeYellow>],
		[<ore:cubeCyan>, <ore:cubeBlack>, <ore:cubeGreen>],
	], null, null);
	//青の金のリングの置き換え
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:dcs_color_ring2>, [[<ore:dustCrystal>], [<ore:dropBlue>], [<ore:ingotGold>]], null, null);
	//Compact Machineのコピーレシピ
	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:quantum_entangler>, [<compactmachines3:psd>, <minecraft:nether_star>], null, null);
	for i in 0 to 6 {
		var machine = <compactmachines3:machine>.definition.makeStack(i);
		HiiragiUtils.addCraftingShapeless(false, machine*2, [machine.marked("inherit"), <contenttweaker:quantum_entangler>.reuse(), machine], HiiragiUtils.inheritStatus(machine), null);
	}

	HiiragiUtils.addCraftingShaped(false, <artisanworktables:workstation:5>, RecipePattern.init(["ABA", " C ", "DDD"]).map({A:<tconstruct:seared_tank:*>, B: <ore:chest>, C:<ore:workbench>, D:<tconstruct:seared:3>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:glyph_divide>, RecipePattern.init([" A ", "BCB", " A "]).map({A:<minecraft:skull:1>, B:<ore:boneWithered>, C:<openblocks:generic:10>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <disenchanter:disenchantmenttable:0>, RecipePattern.init(["ABA", "CDC", "EEE"]).map({A:<botania:spellcloth>, B:<ore:book>, C:<ore:gemEmerald>, D:<ore:woolYellow>, E:<ore:obsidian>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <storagedrawers:framingtable>, RecipePattern.init(["ABA", "C C"]).map({A:<ore:drawerTrim>, B:<minecraft:crafting_table>, C:<dcs_climate:dcs_squaretable_wood>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <contenttweaker:ingot_bedrockium>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:compressed3xCobblestone>, B:<ore:compressed4xCobblestone>, C:<ore:blockDiamond>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <twilightforest:trophy_pedestal>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:ingotSteeleaf>, B:<twilightforest:trophy:*>, C:<twilightforest:stone_twist_thin>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <inspirations:mulch:0>, RecipePattern.init([" A ", "ABA", " A "]).map({A:<ore:stickWood>, B:<ore:dustPlant>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <artisanworktables:toolbox>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<tconstruct:pattern:0>, B:<tconstruct:tough_tool_rod>.withTag({Material: "wood"}), C:<minecraft:chest>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <artisanworktables:mechanical_toolbox>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:plateBronze>, B:<ore:gearSteel>, C:<artisanworktables:toolbox>}).ingredients, null, null);
	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:feather_black>, [<minecraft:feather>, <botania:dye:15>, <botania:dye:15>, <botania:dye:15>], null, null);

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
		HiiragiUtils.removeFurnace(i);
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
		<minecraft:torch>: <ore:stickWood>,
		<threng:material:6>: <contenttweaker:assembly_parallel>,
		<threng:material:14>: <contenttweaker:assembly_speculative>,
		<tconstruct:metal:5>: <contenttweaker:dustblock_alubrass>,
		<thermalfoundation:storage:3>: <contenttweaker:dustblock_lead>,
	};
	for output, input in addFurnace {
		HiiragiUtils.addFurnace(false, output, input);
	}

//AWレシピの編集
	//import
	//新規

//JEIからエントリを完全に削除
	val removeFromJEI as IItemStack[] = [
		//Applied Energistics 2
		<appliedenergistics2:material:40>,
		<appliedenergistics2:inscriber>,
		<appliedenergistics2:charger>,
		//Botania
		<botania:specialflower>.withTag({type: "orechid"}),
		<botania:floatingspecialflower>.withTag({type: "orechid"}),
		//Heat And Climate
		<dcs_climate:dcs_color_ring2>,
		//<dcs_climate:dcs_gem:*>,
		<dcs_climate:dcs_door_marble>,
		<dcs_climate:dcs_door_greisen>,
		<dcs_climate:dcs_door_gypsum>,
		<dcs_climate:dcs_door_steel>,
		//Ender IO
		<enderio:block_simple_crafter>,
		<enderio:block_simple_alloy_smelter>,
		<enderio:block_simple_furnace>,
		<enderio:block_simple_stirling_generator>,
		<enderio:block_simple_sag_mill>,
		<enderio:block_simple_wired_charger>,
		//Extra Utilities 2
		<extrautils2:machine>.withTag({Type: "extrautils2:furnace"}),
		<extrautils2:machine>.withTag({Type: "extrautils2:crusher"}),
		<extrautils2:machine>.withTag({Type: "extrautils2:enchanter"}),
		//Inspirations
		<inspirations:materials:8>,
		//lazy AE2
		<threng:machine:0>,
		<threng:machine:1>,
		<threng:machine:2>,
		<threng:machine:5>,
		<threng:material:2>,
		//Mekanism
		<mekanismtools:woodpaxel>,
		<mekanismtools:stonepaxel>,
		<mekanismtools:ironpaxel>,
		<mekanismtools:diamondpaxel>,
		<mekanismtools:goldpaxel>,
		<mekanismtools:bronzepaxel>,
		<mekanismtools:bronzehelmet>,
		<mekanismtools:bronzechestplate>,
		<mekanismtools:bronzeleggings>,
		<mekanismtools:bronzeboots>,
		<mekanismtools:lapislazulipickaxe>,
		<mekanismtools:lapislazuliaxe>,
		<mekanismtools:lapislazulishovel>,
		<mekanismtools:lapislazulihoe>,
		<mekanismtools:lapislazulisword>,
		<mekanismtools:lapislazulipaxel>,
		<mekanismtools:lapislazulihelmet>,
		<mekanismtools:lapislazulichestplate>,
		<mekanismtools:lapislazulileggings>,
		<mekanismtools:lapislazuliboots>,
		//Pickle Tweaks
		<pickletweaks:aluminum_paxel>,
		<pickletweaks:copper_paxel>,
		<pickletweaks:tin_paxel>,
		<pickletweaks:silver_paxel>,
		<pickletweaks:nickel_paxel>,
		<pickletweaks:constantan_paxel>,
		<pickletweaks:electrum_paxel>,
		<pickletweaks:platinum_paxel>,
		//Quarry Plus
		<quarryplus:quarryplus>,
		<quarryplus:plainpipe>,
		<quarryplus:quarryframe>,
		<quarryplus:spawnercontroller>,
		<quarryplus:enchantmoverfrombook>,
		<quarryplus:solidquarry>,
		<quarryplus:dummyblock>,
		<quarryplus:quarryreplacer>,
		<quarryplus:filler>,
		<quarryplus:quarry_pickaxe>,
		<quarryplus:replacer_module>,
	];
	for i in removeFromJEI {
		HiiragiUtils.removeFromJEI(i);
		//HiiragiUtils.removeOreDict(i);
	}

//JEIへの新規登録
	val mapJEI as IItemStack[] = [
		<enderio:item_material:62>,
		<tconstruct:edible:5>,
		<tconstruct:slime:5>,
		<tconstruct:slime_congealed:5>,
		<tconstruct:slimesling:5>,
		<tconstruct:slime_boots:5>,
	];
	for i in mapJEI {
		mods.jei.JEI.addItem(i);
	}

//Tooltipの追加
	val mapTooltip as string[IItemStack] = {
		<contenttweaker:unfired_casting_channel>: "gohd.tooltip.grout_forming.name",
		<contenttweaker:unfired_casting_table>: "gohd.tooltip.grout_forming.name",
		<contenttweaker:unfired_casting_basin>: "gohd.tooltip.grout_forming.name",
		<dcs_climate:dcs_tinder:1>: "gohd.tooltip.burning_stick.name",
		<ezstorage:storage_box>: "gohd.tooltip.ezstorage_box_0.name",
		<ezstorage:condensed_storage_box>: "gohd.tooltip.ezstorage_box_1.name",
		<ezstorage:super_storage_box>: "gohd.tooltip.ezstorage_box_2.name",
		<ezstorage:ultra_storage_box>: "gohd.tooltip.ezstorage_box_3.name",
		<ezstorage:hyper_storage_box>: "gohd.tooltip.ezstorage_box_4.name",
		<ezstorage:output_port>: "gohd.tooltip.ezstorage_ejection.name",
		<ezstorage:access_terminal>: "gohd.tooltip.ezstorage_terminal.name",
		<ezstorage:security_box>: "gohd.tooltip.ezstorage_security.name",
		<ezstorage:dolly>: "gohd.tooltip.ezstorage_dolly.name",
		<ezstorage:dolly_super>: "gohd.tooltip.ezstorage_dolly.name",
		<ae2wtlib:infinity_booster_card>: "gohd.tooltip.infinity_booster_card.name",
		<contenttweaker:ingot_rainbow>: "gohd.tooltip.ingot_rainbow.name",
		<minecraft:bedrock>: "gohd.tooltip.bedrock.name",
		<contenttweaker:cube_cyan>: "gohd.tooltip.cube_cyan.name",
		<contenttweaker:cube_magenta>: "gohd.tooltip.cube_magenta.name",
		<contenttweaker:cube_yellow>: "gohd.tooltip.cube_yellow.name",
		<dcs_climate:dcs_magic_card_m3:*>: "gohd.tooltip.only_crate.name",
		<dcs_climate:dcs_magic_card:11>: "gohd.tooltip.cube_spell_green.name",
		<contenttweaker:dcs_color_ring2>: "gohd.tooltip.dcs_color_ring2.name",
		<contenttweaker:quantum_entangler>: "gohd.tooltip.quantum_entangler.name",
		<tconstruct:toolforge:0>: "gohd.tooltip.tool_forge.name",
	};
	for i, j in mapTooltip {
		i.addTooltip(I18n.format(j));
	}

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
	<forge:bucketfilled>.maxStackSize = 16;

//採掘レベルの調整
	//<botania:platform:2>.definition.setHarvestLevel("axe", 4);

//このscriptの読み込みの完了をログに出力
print("unification.zs loaded!");
