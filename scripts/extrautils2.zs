#====================================================================
# ファイル名 : extrautils2.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for Extra Utilities 2
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;

//各種modからclassをimport
import mods.ctintegration.util.RecipePattern;
import extrautilities2.Tweaker.IMachine;
import extrautilities2.Tweaker.IMachineRegistry;
import extrautilities2.Tweaker.IMachineSlot;

//scriptのimport
import scripts.HiiragiUtils;
import scripts.jei;

//このscriptの読み込みの開始をログに出力
print("Start loading extrautils2.zs ...");

//作業台レシピの編集
	//削除
	val removeCrafting as IItemStack[] = [];
	for i in removeCrafting {
		HiiragiUtils.removeCrafting(i);
	}
	//上書き
	HiiragiUtils.addCraftingShaped(true, <extrautils2:lawsword>, RecipePattern.init(["  A", " A ", "B  "]).map({A:<ore:ingotStable>, B:<ore:ingotBedrockium>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <extrautils2:compoundbow>, RecipePattern.init([" AB", "C B", " AB"]).map({A:<ore:ingotStable>, B: <dcs_climate:dcs_synthetic:0>, C:<ore:ingotBedrockium>}).ingredients, null, null);
	//新規
	HiiragiUtils.addCraftingShaped(false, <extrautils2:machine>.withTag({Type: "crafttweaker:assembler"}), RecipePattern.init(["ABA", "CDC", "ABA"]).map({A:<ore:gearEnergized>, B:<enderio:item_basic_capacitor:1>, C:<hap:conveyor>, D:<enderio:block_crafter>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <extrautils2:machine>.withTag({Type: "crafttweaker:assembler"}), RecipePattern.init(["ABA", "CDC", "ABA"]).map({A:<ore:alloyAdvanced>, B:<ore:circuitAdvanced>, C:<hap:conveyor>, D:<mekanism:machineblock3:5>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <extrautils2:machine>.withTag({Type: "crafttweaker:assembler"}), RecipePattern.init(["ABA", "CDC", "ABA"]).map({A:<ore:gearSignalum>, B:<ore:plateSignalum>, C:<hap:conveyor>, D:<thermalexpansion:machine:11>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <extrautils2:machine>.withTag({Type: "crafttweaker:apiary"}), RecipePattern.init(["AAA", "ABA", "CDC"]).map({A:<botania:livingwood:0>, B:<extrautils2:machine>, C:<biomesoplenty:filled_honeycomb>, D:<railcraft:equipment:2>}).ingredients, null, null);

	HiiragiUtils.addCraftingShaped(true, <extrautils2:machine:0>, RecipePattern.init(["AAA", "ABA", "CCC"]).map({A:<ore:ingotInvar>, B:<ore:gemRedstone>, C:<ore:ingotSteel>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <extrautils2:machine:0>*3, RecipePattern.init(["AAA", "ABA", "CCC"]).map({A:<ore:ingotToolSteel>, B:<ore:gemRedstone>, C:<ore:ingotStainlessSteel>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <extrautils2:decorativesolid:8>*8, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<extrautils2:decorativesolid:3>, B:<extendedcrafting:material:32>|<contenttweaker:cube_iridescent>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <extrautils2:itemcreativebuilderswand>, [[null, <ore:ingotUnstable>], [<ore:obsidian>, null]], null, null);
	HiiragiUtils.addCraftingShaped(false, <extrautils2:itemcreativedestructionwand>, [[<ore:ingotStable>, null], [null, <ore:obsidian>]], null, null);
	HiiragiUtils.addCraftingShaped(false, <extrautils2:spike_creative>, RecipePattern.init([" A ", "ABA", "CDC"]).map({A:<extrautils2:lawsword>, B:<extendedcrafting:singularity_ultimate>.reuse(), C:<ore:gemDragonStone>, D:<ore:blockGaiasteel>}).ingredients, null, null);

	HiiragiUtils.addCraftingShapeless(false, <extrautils2:creativeharvest>, [<extrautils2:creativeharvest>, <*>.marked("creative")], function(out, ins, cInfo) {
		var id as string = ins.creative.definition.id;
		var meta as int = ins.creative.metadata;
		return <extrautils2:creativeharvest>.withTag({creative_block: {meta: meta, block: id}, display_stack: {id: id, Count: 1 as byte, Damage: meta as short}});
	}, null);

	HiiragiUtils.recipeReplace(<minecraft:gold_ingot>, <ore:ingotEnergeticAlloy>, <extrautils2:grocket:6>);

//Assemblerのレシピ
	static machineAssembler as IMachine = extrautilities2.Tweaker.IMachineRegistry.getMachine("assembler");

	function addAssembler(input as IIngredient[], output as WeightedItemStack) {
		machineAssembler.addRecipe({"input1": input[0], "input2": input[1]}, {"output": output}, 5000, 200);
	}

	val mapAssembler as WeightedItemStack[IIngredient[]] = {
		//Building Gadgets
		[<buildinggadgets:buildingtool>, <extrautils2:itemcreativedestructionwand>]:  <buildinggadgets:exchangertool>,
		[<buildinggadgets:buildingtool>, <thermalfoundation:diagram_redprint>]:  <buildinggadgets:copypastetool>,
		//Ender IO
		[<enderio:block_omni_reservoir>, <ore:runeWaterB>]: <enderio:block_reservoir>,
		[<enderio:block_solar_panel:0>, <ore:ingotEnergeticAlloy>]: <enderio:block_solar_panel:1>,
		[<enderio:block_solar_panel:1>, <ore:ingotPulsatingIron>]: <enderio:block_solar_panel:2>,
		[<enderio:block_solar_panel:2>, <ore:ingotVibrantAlloy>]: <enderio:block_solar_panel:3>,
		[<enderio:item_basic_capacitor:0>, <ore:ingotEnergeticAlloy>]: <enderio:item_basic_capacitor:1>,
		[<enderio:item_basic_capacitor:1>, <ore:ingotVibrantAlloy>]: <enderio:item_basic_capacitor:2>,
		[<enderio:item_basic_capacitor:2>, <dcs_climate:dcs_mechanical:5>]: jei.cap6x,
		[<openblocks:tank>, <ore:itemChassiParts>]: <enderio:block_omni_reservoir>,
		[<ore:blockMagnet>, <ore:itemVibrantCrystal>]: <enderio:item_magnet>,
		[<ore:dustBedrock>, <ore:ingotCopper>]: <enderio:item_basic_capacitor:0>,
		[<ore:dustBedrock>, <ore:ingotIron>]: <ore:gearIronInfinity>.firstItem,
		[<ore:gearIronInfinity>, <ore:ingotDarkSteel>]: <ore:gearDark>.firstItem,
		[<ore:gearIronInfinity>, <ore:ingotEnergeticAlloy>]: <ore:gearEnergized>.firstItem,
		[<ore:gearIronInfinity>, <ore:ingotVibrantAlloy>]: <ore:gearVibrant>.firstItem,
		[<ore:gemDiamond>, <ore:ingotPulsatingIron>]: <ore:itemPulsatingCrystal>.firstItem,
		[<ore:gemEmerald>, <ore:ingotVibrantAlloy>]: <ore:itemVibrantCrystal>.firstItem,
		[<ore:gemOlivine>, <ore:ingotVibrantAlloy>]: <ore:itemVibrantCrystal>.firstItem,
		[<ore:gemSlate>, <enderio:block_dark_iron_bars>]: <enderio:item_dark_steel_upgrade>,
		[<ore:gemTausonite>, <ore:ingotPulsatingIron>]: <ore:itemPulsatingCrystal>.firstItem,
		[<ore:ingotElectricalSteel>, <minecraft:piston>]: <enderio:item_extract_speed_upgrade>,
		[<ore:ingotElectricalSteel>, <ore:slimeball>]: <enderio:item_extract_speed_downgrade>,
		[<ore:ingotRedstoneAlloy>, <ore:paper>]: <enderio:item_material:60>,
		[<ore:itemPlatePhotovoltaic>, <ore:ingotElectricalSteel>]: <enderio:block_solar_panel:0>,
		[<ore:itemPlatePhotovoltaic>, <ore:ingotEnergeticAlloy>]: <enderio:block_solar_panel:1>,
		[<ore:itemPlatePhotovoltaic>, <ore:ingotPulsatingIron>]: <enderio:block_solar_panel:2>,
		[<ore:itemPlatePhotovoltaic>, <ore:ingotVibrantAlloy>]: <enderio:block_solar_panel:3>,
		[<ore:itemRemoteAwarenessUpgrade>, <ore:ingotElectricalSteel>]: <enderio:item_material:65>,
		[<ore:itemWirelessDish>, <enderio:block_cap_bank:1>]: <enderio:item_inventory_charger_basic>,
		[<ore:itemWirelessDish>, <enderio:block_cap_bank:2>]: <enderio:item_inventory_charger>,
		[<ore:itemWirelessDish>, <enderio:block_cap_bank:3>]: <enderio:item_inventory_charger_vibrant>,
		[<ore:itemWirelessDish>, <enderio:item_basic_capacitor>]: <enderio:item_inventory_charger_simple>,
		[<theoneprobe:probe>, <enderio:item_yeta_wrench>]: <enderio:item_conduit_probe>,
		//Lazy AE2
		[<appliedenergistics2:material:6>, <threng:material:1>]: <threng:material:7>,
		//Mekanism
		[<ore:alloyAdvanced>, <botanicadds:rune_energy>]: <mekanism:electrolyticcore>,
		[<ore:alloyAdvanced>, <ore:dustDiamond>]: <mekanism:anchorupgrade>,
		[<ore:alloyAdvanced>, <ore:dustGold>]: <mekanism:energyupgrade>,
		[<ore:alloyAdvanced>, <ore:dustIron>]: <mekanism:gasupgrade>,
		[<ore:alloyAdvanced>, <ore:dustOsmium>]: <mekanism:speedupgrade>,
		[<ore:alloyAdvanced>, <ore:dustSteel>]: <mekanism:mufflingupgrade>,
		[<ore:alloyAdvanced>, <ore:dustTin>]: <mekanism:filterupgrade>,
		//Thermal
		[<ore:ingotElectrum>, <thermalfoundation:material:512>]: <thermalfoundation:material:640>,
		[<ore:ingotRedstoneAlloy>, <ore:ingotElectrum>]: <thermalfoundation:material:515>,
		[<ore:ingotRedstoneAlloy>, <ore:ingotGold>]: <thermalfoundation:material:513>,
		[<ore:ingotRedstoneAlloy>, <ore:ingotIron>]: <thermalfoundation:material:512>,
		[<ore:ingotRedstoneAlloy>, <ore:ingotSilver>]: <thermalfoundation:material:514>,
		[<ore:plateGold>, <thermalfoundation:material:515>]: <thermalexpansion:augment:128>,
		[<ore:plateSilver>, <thermalfoundation:material:514>]: <thermalexpansion:augment:512>,
		[<thermalfoundation:material:512>, <biomesoplenty:terrestrial_artifact>]: <thermalexpansion:augment:720>,
		[<thermalfoundation:material:512>, <botania:alchemycatalyst>]: <thermalexpansion:augment:688>,
		[<thermalfoundation:material:512>, <dcs_climate:dcs_device_faucet>]: <thermalexpansion:augment:288>,
		[<thermalfoundation:material:512>, <dcs_climate:dcs_expgem>]: <thermalexpansion:augment:401>,
		[<thermalfoundation:material:512>, <dcs_climate:dcs_mechanical:5>]: <thermalexpansion:augment:672>,
		[<thermalfoundation:material:512>, <dcs_climate:dcs_rotaryblade:2>]: <thermalexpansion:augment:129>,
		[<thermalfoundation:material:512>, <enderio:block_enhanced_wireless_charger>]: <thermalexpansion:augment:402>,
		[<thermalfoundation:material:512>, <enderio:block_killer_joe>]: <thermalexpansion:augment:416>,
		[<thermalfoundation:material:512>, <extrautils2:ironwood_sapling:0>]: <thermalexpansion:augment:323>,
		[<thermalfoundation:material:512>, <hap:coke_oven>]: <thermalexpansion:augment:258>,
		[<thermalfoundation:material:512>, <liquid:lava>]: <thermalexpansion:augment:130>,
		[<thermalfoundation:material:512>, <mekanismgenerators:turbineblade>]: <thermalexpansion:augment:640>,
		[<thermalfoundation:material:512>, <minecraft:brewing_stand>]: <thermalexpansion:augment:369>,
		[<thermalfoundation:material:512>, <minecraft:comparator>]: <thermalexpansion:augment:515>,
		[<thermalfoundation:material:512>, <ore:catalystBladeSUS>]: <thermalexpansion:augment:497>,
		[<thermalfoundation:material:512>, <ore:circuitElite>]: <thermalexpansion:augment:432>,
		[<thermalfoundation:material:512>, <ore:coalPowered>]: <thermalexpansion:augment:513>,
		[<thermalfoundation:material:512>, <ore:cubeBlack>]: <thermalexpansion:augment:368>,
		[<thermalfoundation:material:512>, <ore:cubeBlue>]: <thermalexpansion:augment:496>,
		[<thermalfoundation:material:512>, <ore:cubeGreen>]: <thermalexpansion:augment:674>,
		[<thermalfoundation:material:512>, <ore:cubeRed>]: <thermalexpansion:augment:673>,
		[<thermalfoundation:material:512>, <ore:cubeWhite>]: <thermalexpansion:augment:704>,
		[<thermalfoundation:material:512>, <ore:dustCryotheum>]: <thermalexpansion:augment:656>,
		[<thermalfoundation:material:512>, <ore:dustPetrotheum>]: <thermalexpansion:augment:273>,
		[<thermalfoundation:material:512>, <ore:dustPyrotheum>]: <thermalexpansion:augment:304>,
		[<thermalfoundation:material:512>, <ore:itemCinnabar>]: <thermalexpansion:augment:303>,
		[<thermalfoundation:material:512>, <ore:runeFireB>]: <thermalexpansion:augment:257>,
		[<thermalfoundation:material:512>, <ore:runeGluttonyB>]: <thermalexpansion:augment:256>,
		[<thermalfoundation:material:512>, <ore:runeLustB>]: <thermalexpansion:augment:324>,
		[<thermalfoundation:material:512>, <ore:runeManaB>]: <thermalexpansion:augment:448>,
		[<thermalfoundation:material:512>, <ore:runeSlothB>]: <thermalexpansion:augment:514>,
		[<thermalfoundation:material:512>, <railcraft:boiler_tank_pressure_high>]: <thermalexpansion:augment:576>,
		[<thermalfoundation:material:512>, <railcraft:firestone_refined>]: <thermalexpansion:augment:352>,
		[<thermalfoundation:material:512>, <tconstruct:cast_custom:2>]: <thermalexpansion:augment:336>,
		[<thermalfoundation:material:512>, <tconstruct:cast_custom:4>]: <thermalexpansion:augment:337>,
		[<thermalfoundation:material:512>, <thermaldynamics:duct_0:5>]: <thermalexpansion:augment:400>,
		[<thermalfoundation:material:512>, <thermalexpansion:tank>]: <thermalexpansion:augment:433>,
		[<thermalfoundation:material:512>, <thermalfoundation:fertilizer:2>]: <thermalexpansion:augment:320>,
		//Joke
		[<minecraft:pumpkin>, <minecraft:melon_block>]:  <contenttweaker:pumpkin_melon>*2,

	};

	for input, output in mapAssembler{
		addAssembler(input, output);
	}

//Apiaryのレシピ
	static machineApiary as IMachine = extrautilities2.Tweaker.IMachineRegistry.getMachine("apiary");

	function addApiary(input as IIngredient, output as WeightedItemStack) {
		machineApiary.addRecipe({"input": input}, {"output": output}, 0, 1200);
	}

	val mapApiary as WeightedItemStack[IIngredient] = {
		<minecraft:yellow_flower>: <biomesoplenty:filled_honeycomb>,
		<minecraft:red_flower:*>: <biomesoplenty:filled_honeycomb>,
		<minecraft:double_plant:*>: <biomesoplenty:filled_honeycomb>*2,
		<biomesoplenty:plant_0:4>: <dcs_climate:dcs_food_antibiotic:3>,
		<biomesoplenty:plant_0:5>: <twilightforest:torchberries>,
		<biomesoplenty:plant_1:4>: <minecraft:wool:0>,
		//<biomesoplenty:plant_1:6>:
		//<biomesoplenty:plant_1:10>:
		<biomesoplenty:double_plant:0>: <dcs_climate:dcs_food_drop_oil>,
		<biomesoplenty:double_plant:2>: <minecraft:spider_eye>,
		<biomesoplenty:flower_0:2>: <extrautils2:ingredients:10>,
		<biomesoplenty:flower_0:3>: <minecraft:glowstone_dust>,
		<biomesoplenty:flower_0:10>: <enderio:item_material:62>,
		<biomesoplenty:flower_0:13>: <thermalfoundation:material:2051>,
		<biomesoplenty:flower_0:15>: <minecraft:blaze_powder>,
		<biomesoplenty:flower_1:1>: <minecraft:clay_ball>,
		<biomesoplenty:flower_1:3>: <thermalfoundation:material:2053>,
		<biomesoplenty:flower_1:4>: <thermalfoundation:material:2049>,
		<biomesoplenty:flower_1:5>: <biomesoplenty:sapling_1>%1,
		<botania:flower:*>: <botania:manaresource:23>,
		<twilightforest:thorn_rose>: <dcs_climate:dcs_food_essential_oil>,
		<twilightforest:huge_waterlily>: <dcs_climate:dcs_food_petals>,
	};

	for input, output in mapApiary{
		addApiary(input, output);
	}

//このscriptの読み込みの完了をログに出力
print("extrautils2.zs loaded!");
