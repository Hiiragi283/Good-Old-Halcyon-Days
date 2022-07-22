#====================================================================
# ファイル名 : extraUtil.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : このファイルについて書く
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.item.WeightedItemStack;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import extrautilities2.Tweaker.IMachine;
import extrautilities2.Tweaker.IMachineRegistry;
import extrautilities2.Tweaker.IMachineSlot;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading extraUtil.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
		val removeCrafting as IItemStack[] = [];
		for i in removeCrafting {
			HiiragiUtils.removeCrafting(i);
		}
	//上書き
	//新規
		HiiragiUtils.addCraftingShaped(false, <extrautils2:machine>.withTag({Type: "crafttweaker:assembler"}), RecipePattern.init(["ABA", "CDC", "ABA"]).map({A:<ore:gearEnergized>, B:<enderio:item_basic_capacitor:1>, C:<hap:conveyor>, D:<enderio:block_crafter>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(false, <extrautils2:machine>.withTag({Type: "crafttweaker:assembler"}), RecipePattern.init(["ABA", "CDC", "ABA"]).map({A:<ore:alloyAdvanced>, B:<ore:circuitAdvanced>, C:<hap:conveyor>, D:<mekanism:machineblock3:5>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(false, <extrautils2:machine>.withTag({Type: "crafttweaker:assembler"}), RecipePattern.init(["ABA", "CDC", "ABA"]).map({A:<ore:gearSignalum>, B:<ore:plateSignalum>, C:<hap:conveyor>, D:<thermalexpansion:machine:11>}).ingredients, null, null);

		HiiragiUtils.addCraftingShapeless(false, <extrautils2:creativeharvest>, [<extrautils2:creativeharvest>, <*>.marked("creative")], function(out, ins, cInfo) {
			var owner as string = ins.creative.definition.owner;
			var id as string = ins.creative.definition.id.split(":")[1];
			var idMod as string = owner ~ ":" ~ id;
			var meta as int = ins.creative.metadata;
			return <extrautils2:creativeharvest>.withTag({creative_block: {meta: meta, block: idMod}, display_stack: {id: idMod, Count: 1 as byte, Damage: meta as short}});
		}, null);

//AWレシピの編集
	//import
	//新規

//ExU機械のレシピ
	static machineAssembler as IMachine = extrautilities2.Tweaker.IMachineRegistry.getMachine("assembler");

	function addAssembler(input as IIngredient[], output as IIngredient) {
		machineAssembler.addRecipe({"input1": input[0], "input2": input[1]}, {"output": output}, 5000, 200);
	}

	val mapAssembler as IIngredient[IIngredient[]] = {
		//Ender IO
			[<ore:dustBedrock>, <ore:ingotCopper>]: <enderio:item_basic_capacitor:0>,
			[<enderio:item_basic_capacitor:0>, <ore:ingotEnergeticAlloy>]: <enderio:item_basic_capacitor:1>,
			[<enderio:item_basic_capacitor:1>, <ore:ingotVibrantAlloy>]: <enderio:item_basic_capacitor:2>,
			[<ore:dustBedrock>, <ore:ingotIron>]: <ore:gearIronInfinity>.firstItem,
			[<ore:gearIronInfinity>, <ore:ingotDarkSteel>]: <ore:gearDark>.firstItem,
			[<ore:gearIronInfinity>, <ore:ingotEnergeticAlloy>]: <ore:gearEnergized>.firstItem,
			[<ore:gearIronInfinity>, <ore:ingotVibrantAlloy>]: <ore:gearVibrant>.firstItem,
			[<ore:gemDiamond>, <ore:ingotPulsatingIron>]: <ore:itemPulsatingCrystal>.firstItem,
			[<ore:gemTausonite>, <ore:ingotPulsatingIron>]: <ore:itemPulsatingCrystal>.firstItem,
			[<ore:gemEmerald>, <ore:ingotVibrantAlloy>]: <ore:itemVibrantCrystal>.firstItem,
			[<ore:gemOlivine>, <ore:ingotVibrantAlloy>]: <ore:itemVibrantCrystal>.firstItem,
			[<ore:ingotRedstoneAlloy>, <ore:paper>]: <enderio:item_material:60>,
			[<ore:itemRemoteAwarenessUpgrade>, <ore:ingotElectricalSteel>]: <enderio:item_material:65>,
			[<theoneprobe:probe>, <enderio:item_yeta_wrench>]: <enderio:item_conduit_probe>,
			[<ore:blockMagnet>, <ore:itemVibrantCrystal>]: <enderio:item_magnet>,
			[<ore:itemWirelessDish>, <enderio:item_basic_capacitor>]: <enderio:item_inventory_charger_simple>,
			[<ore:itemWirelessDish>, <enderio:block_cap_bank:1>]: <enderio:item_inventory_charger_basic>,
			[<ore:itemWirelessDish>, <enderio:block_cap_bank:2>]: <enderio:item_inventory_charger>,
			[<ore:itemWirelessDish>, <enderio:block_cap_bank:3>]: <enderio:item_inventory_charger_vibrant>,
			[<ore:gemSlate>, <enderio:block_dark_iron_bars>]: <enderio:item_dark_steel_upgrade>,
			[<ore:ingotElectricalSteel>, <minecraft:piston>]: <enderio:item_extract_speed_upgrade>,
			[<ore:ingotElectricalSteel>, <ore:slimeball>]: <enderio:item_extract_speed_downgrade>,
			[<enderio:block_omni_reservoir>, <ore:runeWaterB>]: <enderio:block_reservoir>,
			[<openblocks:tank>, <ore:itemChassiParts>]: <enderio:block_omni_reservoir>,
			[<ore:itemPlatePhotovoltaic>, <ore:ingotElectricalSteel>]: <enderio:block_solar_panel:0>,
			[<ore:itemPlatePhotovoltaic>, <ore:ingotEnergeticAlloy>]: <enderio:block_solar_panel:1>,
			[<ore:itemPlatePhotovoltaic>, <ore:ingotPulsatingIron>]: <enderio:block_solar_panel:2>,
			[<ore:itemPlatePhotovoltaic>, <ore:ingotVibrantAlloy>]: <enderio:block_solar_panel:3>,
			[<enderio:block_solar_panel:0>, <ore:ingotEnergeticAlloy>]: <enderio:block_solar_panel:1>,
			[<enderio:block_solar_panel:1>, <ore:ingotPulsatingIron>]: <enderio:block_solar_panel:2>,
			[<enderio:block_solar_panel:2>, <ore:ingotVibrantAlloy>]: <enderio:block_solar_panel:3>,
		//Mekanism
		//Thermal
			[<ore:plateGold>, <thermalfoundation:material:515>]: <thermalexpansion:augment:128>,
			[<thermalfoundation:material:512>, <dcs_climate:dcs_rotaryblade:2>]: <thermalexpansion:augment:129>,
			[<thermalfoundation:material:512>, <liquid:lava>]: <thermalexpansion:augment:130>,
			[<thermalfoundation:material:512>, <ore:runeGluttonyB>]: <thermalexpansion:augment:256>,
			[<thermalfoundation:material:512>, <ore:runeFireB>]: <thermalexpansion:augment:257>,
			[<thermalfoundation:material:512>, <hap:coke_oven>]: <thermalexpansion:augment:258>,
			[<thermalfoundation:material:512>, <ore:dustPetrotheum>]: <thermalexpansion:augment:273>,
			[<thermalfoundation:material:512>, <dcs_climate:dcs_device_faucet>]: <thermalexpansion:augment:288>,
			[<thermalfoundation:material:512>, <ore:itemCinnabar>]: <thermalexpansion:augment:303>,
			[<thermalfoundation:material:512>, <ore:dustPyrotheum>]: <thermalexpansion:augment:304>,
			[<thermalfoundation:material:512>, <thermalfoundation:fertilizer:2>]: <thermalexpansion:augment:320>,
			[<thermalfoundation:material:512>, <extrautils2:ironwood_sapling:0>]: <thermalexpansion:augment:323>,
			[<thermalfoundation:material:512>, <ore:runeLustB>]: <thermalexpansion:augment:324>,
			[<thermalfoundation:material:512>, <tconstruct:cast_custom:2>]: <thermalexpansion:augment:336>,
			[<thermalfoundation:material:512>, <tconstruct:cast_custom:4>]: <thermalexpansion:augment:337>,
			[<thermalfoundation:material:512>, <railcraft:firestone_refined>]: <thermalexpansion:augment:352>,
			[<thermalfoundation:material:512>, <ore:cubeBlack>]: <thermalexpansion:augment:368>,
			[<thermalfoundation:material:512>, <minecraft:brewing_stand>]: <thermalexpansion:augment:369>,
			[<thermalfoundation:material:512>, <thermaldynamics:duct_0:5>]: <thermalexpansion:augment:400>,
			[<thermalfoundation:material:512>, <dcs_climate:dcs_expgem>]: <thermalexpansion:augment:401>,
			[<thermalfoundation:material:512>, <enderio:block_enhanced_wireless_charger>]: <thermalexpansion:augment:402>,
			[<thermalfoundation:material:512>, <enderio:block_killer_joe>]: <thermalexpansion:augment:416>,
			[<thermalfoundation:material:512>, <ore:circuitElite>]: <thermalexpansion:augment:432>,
			[<thermalfoundation:material:512>, <thermalexpansion:tank>]: <thermalexpansion:augment:433>,
			[<thermalfoundation:material:512>, <ore:runeManaB>]: <thermalexpansion:augment:448>,
			[<thermalfoundation:material:512>, <ore:cubeBlue>]: <thermalexpansion:augment:496>,
			[<thermalfoundation:material:512>, <ore:catalystBladeSUS>]: <thermalexpansion:augment:497>,
			[<ore:plateSilver>, <thermalfoundation:material:514>]: <thermalexpansion:augment:512>,
			[<thermalfoundation:material:512>, <ore:coalPowered>]: <thermalexpansion:augment:513>,
			[<thermalfoundation:material:512>, <ore:runeSlothB>]: <thermalexpansion:augment:514>,
			[<thermalfoundation:material:512>, <minecraft:comparator>]: <thermalexpansion:augment:515>,
			[<thermalfoundation:material:512>, <railcraft:boiler_tank_pressure_high>]: <thermalexpansion:augment:576>,
			[<thermalfoundation:material:512>, <mekanismgenerators:turbineblade>]: <thermalexpansion:augment:640>,
			[<thermalfoundation:material:512>, <ore:dustCryotheum>]: <thermalexpansion:augment:656>,
			[<thermalfoundation:material:512>, <dcs_climate:dcs_mechanical:5>]: <thermalexpansion:augment:672>,
			[<thermalfoundation:material:512>, <ore:cubeRed>]: <thermalexpansion:augment:673>,
			[<thermalfoundation:material:512>, <ore:cubeGreen>]: <thermalexpansion:augment:674>,
			[<thermalfoundation:material:512>, <botania:alchemycatalyst>]: <thermalexpansion:augment:688>,
			[<thermalfoundation:material:512>, <ore:cubeWhite>]: <thermalexpansion:augment:704>,
			[<thermalfoundation:material:512>, <biomesoplenty:terrestrial_artifact>]: <thermalexpansion:augment:720>,
			[<ore:ingotRedstoneAlloy>, <ore:ingotIron>]: <thermalfoundation:material:512>,
			[<ore:ingotRedstoneAlloy>, <ore:ingotGold>]: <thermalfoundation:material:513>,
			[<ore:ingotRedstoneAlloy>, <ore:ingotSilver>]: <thermalfoundation:material:514>,
			[<ore:ingotRedstoneAlloy>, <ore:ingotElectrum>]: <thermalfoundation:material:515>,
			[<ore:ingotElectrum>, <thermalfoundation:material:512>]: <thermalfoundation:material:640>,
	};

	for input, output in mapAssembler{
		addAssembler(input, output);
	}

//このscriptの読み込みの完了をログに出力
print("extraUtil.zs loaded!");
