#====================================================================
# ファイル名 : jei.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : scripts for JEI/HEI
#====================================================================

#priority 99

//crafttweakerからclassをimport
import crafttweaker.enchantments.IEnchantment;
import crafttweaker.enchantments.IEnchantmentDefinition;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

//各種modからclassをimport
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading jei.zs ...");

//特殊アイテムの定義
	//SC Capasitor
	static cap6x as IItemStack = <enderio:item_basic_capacitor:4>.withTag({eiocap: {level: 6.0 as float}, display: {LocName: "gohd.custom.capasitor_6x"}});
	//TCon Tables
	static tableStencil as IItemStack = <tconstruct:tooltables:1>.withTag({textureBlock: {id: "twilightforest:twilight_oak_planks", Count: 1 as byte, Damage: 0 as short}});
	static tablePart as IItemStack = <tconstruct:tooltables:2>.withTag({textureBlock: {id: "twilightforest:twilight_log", Count: 1 as byte, Damage: 0 as short}});
	static toolForge as IItemStack = <tconstruct:toolforge>.withTag({textureBlock: {id: "dcs_climate:dcs_ore_heatingmetal", Count: 1 as byte, Damage: 2 as short}});

//JEIからの登録を削除
function hideJEI(item as IItemStack, oreDict as bool) {
	mods.jei.JEI.hide(item);
	item.addTooltip(I18n.format("gohd.tooltip.hidden.name"));
	if(oreDict) {
		//鉱石辞書の削除
		HiiragiUtils.tweakOreDict(item, [<ore:all>], []);
	}
}

val mapHide as bool[IItemStack] = {};
for i, j in mapHide {
	hideJEI(i, j);
}

//JEIからの登録と作成レシピを削除
function removeJEI(item as IItemStack, oreDict as bool) {
	mods.jei.JEI.removeAndHide(item);
	recipes.remove(item);
	item.addTooltip(I18n.format("gohd.tooltip.removed.name"));
	if(oreDict) {
		//鉱石辞書の削除
		HiiragiUtils.tweakOreDict(item, [<ore:all>], []);
	}
}

val mapRemove as bool[IItemStack] = {
	//Applied Energistics 2
	<appliedenergistics2:charger>: false,
	<appliedenergistics2:inscriber>: false,
	<appliedenergistics2:material:40>: true,
	//Botania
	<botania:floatingspecialflower>.withTag({type: "orechid"}): false,
	<botania:specialflower>.withTag({type: "orechid"}): false,
	//Heat And Climate
	//<dcs_climate:dcs_gem:*>,
	<dcs_climate:dcs_color_ring2>: false,
	<dcs_climate:dcs_door_greisen>: false,
	<dcs_climate:dcs_door_gypsum>: false,
	<dcs_climate:dcs_door_marble>: false,
	<dcs_climate:dcs_door_steel>: false,
	<dcs_climate:dcs_gem:*>: true,
	//Ender IO
	<enderio:block_simple_alloy_smelter>: false,
	<enderio:block_simple_crafter>: false,
	<enderio:block_simple_furnace>: false,
	<enderio:block_simple_sag_mill>: false,
	<enderio:block_simple_stirling_generator>: false,
	<enderio:block_simple_wired_charger>: false,
	//Extended Crafting
	<extendedcrafting:material:1>: true,
	<extendedcrafting:material:11>: false,
	<extendedcrafting:material:12>: false,
	<extendedcrafting:material:14>: false,
	<extendedcrafting:material:15>: false,
	<extendedcrafting:material:17>: false,
	<extendedcrafting:material:18>: false,
	<extendedcrafting:material:24>: true,
	<extendedcrafting:material:25>: true,
	<extendedcrafting:material:3>: false,
	<extendedcrafting:material:36>: true,
	<extendedcrafting:material:37>: true,
	<extendedcrafting:material:48>: true,
	<extendedcrafting:material:49>: true,
	<extendedcrafting:material:8>: false,
	<extendedcrafting:material:9>: false,
	<extendedcrafting:storage:3>: true,
	<extendedcrafting:storage:5>: true,
	<extendedcrafting:storage:7>: true,
	//Extra Utilities 2
	<extrautils2:itembuilderswand>: false,
	<extrautils2:itemdestructionwand>: false,
	<extrautils2:machine>.withTag({Type: "extrautils2:crusher"}): false,
	<extrautils2:machine>.withTag({Type: "extrautils2:enchanter"}): false,
	<extrautils2:machine>.withTag({Type: "extrautils2:furnace"}): false,
	<extrautils2:unstableingots:0>: true,
	<extrautils2:unstableingots:1>: true,
	<extrautils2:unstableingots:2>: true,
	//Inspirations
	<inspirations:materials:8>: true,
	//lazy AE2
	<threng:machine:0>: false,
	<threng:machine:1>: false,
	<threng:machine:2>: false,
	<threng:machine:5>: false,
	<threng:material:2>: false,
	//Mechanics
	<mechanics:heavy_mesh>: false,
	//Mekanism
	<mekanismgenerators:solarpanel>: false,
	<mekanismtools:bronzeboots>: false,
	<mekanismtools:bronzechestplate>: false,
	<mekanismtools:bronzehelmet>: false,
	<mekanismtools:bronzeleggings>: false,
	<mekanismtools:bronzepaxel>: false,
	<mekanismtools:diamondpaxel>: false,
	<mekanismtools:goldpaxel>: false,
	<mekanismtools:ironpaxel>: false,
	<mekanismtools:lapislazuliaxe>: false,
	<mekanismtools:lapislazuliboots>: false,
	<mekanismtools:lapislazulichestplate>: false,
	<mekanismtools:lapislazulihelmet>: false,
	<mekanismtools:lapislazulihoe>: false,
	<mekanismtools:lapislazulileggings>: false,
	<mekanismtools:lapislazulipaxel>: false,
	<mekanismtools:lapislazulipickaxe>: false,
	<mekanismtools:lapislazulishovel>: false,
	<mekanismtools:lapislazulisword>: false,
	<mekanismtools:stonepaxel>: false,
	<mekanismtools:woodpaxel>: false,
	//Minecraft
	<minecraft:stone_axe>: false,
	<minecraft:stone_hoe>: false,
	<minecraft:stone_pickaxe>: false,
	<minecraft:stone_shovel>: false,
	<minecraft:wooden_axe>: false,
	<minecraft:wooden_hoe>: false,
	<minecraft:wooden_pickaxe>: false,
	<minecraft:wooden_shovel>: false,
	//Pickle Tweaks
	<pickletweaks:aluminum_paxel>: false,
	<pickletweaks:constantan_paxel>: false,
	<pickletweaks:copper_paxel>: false,
	<pickletweaks:electrum_paxel>: false,
	<pickletweaks:nickel_paxel>: false,
	<pickletweaks:platinum_paxel>: false,
	<pickletweaks:silver_paxel>: false,
	<pickletweaks:tin_paxel>: false,
	//ProjectE
	//ProjectEX
	<projectex:collector:*>: false,
	<projectex:compressed_collector:*>: false,
	<projectex:final_star_shard>: false,
	<projectex:matter:*>: false,
	//Quarry Plus
	<quarryplus:dummyblock>: false,
	<quarryplus:enchantmoverfrombook>: false,
	<quarryplus:filler>: false,
	<quarryplus:plainpipe>: false,
	<quarryplus:quarry_pickaxe>: false,
	<quarryplus:quarryframe>: false,
	<quarryplus:quarryplus>: false,
	<quarryplus:quarryreplacer>: false,
	<quarryplus:replacer_module>: false,
	<quarryplus:solidquarry>: false,
	<quarryplus:spawnercontroller>: false,
	//Railcraft
	//Simple Storage Network
	<storagenetwork:remote:0>: false,
	//Tinkers Complement
	<extrautils2:itembuilderswand>: false,
	<extrautils2:itemdestructionwand>: false,
	<tcomplement:alloy_tank>: false,
	<tcomplement:melter:8>: false,
	<tcomplement:melter>: false,
};
for i, j in mapRemove {
	removeJEI(i, j);
}
	//不要なFlower Bonsai Potを削除
	for i in 1 to 16 {
		removeJEI(<projectex:power_flower>.definition.makeStack(i), false);
	}
	//Electric TrackをJEIから削除
		/*val removeTrack as string[] = [
		"railcraft_activator",
		"railcraft_control",
		"railcraft_throttle",
		"railcraft_detector",
		"railcraft_disembarking",
		"railcraft_priming",
		"railcraft_locomotive",
		"railcraft_booster",
		"railcraft_launcher",
		"railcraft_whistle",
		"railcraft_embarking",
		"railcraft_routing",
		"railcraft_gated",
		"railcraft_one_way",
		"railcraft_dumping",
		"railcraft_coupler",
		"railcraft_locking",
		"railcraft_messenger",
		"railcraft_delayed",
		"railcraft_buffer",
		];
		for i in removeTrack {
			removeJEI(<railcraft:track_outfitted>.withTag({railcraft:{rail:"railcraft_electric", kit:i}}), false);
			removeJEI(<railcraft:track_outfitted>.withTag({railcraft:{rail:"railcraft_high_speed_electric", kit:i}}), false);
		}*/
	//不要なStencil TableをJEIから削除
		val removeStencil as short[][string] = {
			"biomesoplenty:planks_0": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],
			"chisel:planks-acacia": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],
			"chisel:planks-birch": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],
			"chisel:planks-dark-oak": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],
			"chisel:planks-jungle": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],
			"chisel:planks-oak": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],
			"chisel:planks-spruce": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],
			"extrautils2:ironwood_planks": [0,1],
			"minecraft:planks": [0,1,2,3,4,5],
			"twilightforest:canopy_planks": [0],
			"twilightforest:dark_planks": [0],
			"twilightforest:mangrove_planks": [0],
			"twilightforest:mine_planks": [0],
			"twilightforest:sort_planks": [0],
			"twilightforest:time_planks": [0],
			"twilightforest:tower_wood": [0,1,2,3,4],
			"twilightforest:trans_planks": [0],
		};
		for id, damage in removeStencil {
			for i in damage {
				removeJEI(<tconstruct:tooltables:1>.withTag({textureBlock: {id: id, Count: 1 as byte, Damage: i}}), false);
			}
		}
	//不要なPart BuilderをJEIから削除
		val removePart as short[][string] = {
			"advancedrocketry:alienwood": [0],
			"biomesoplenty:log_0": [4,5,6,7],
			"biomesoplenty:log_1": [4,5,6,7],
			"biomesoplenty:log_2": [4,5,6,7],
			"biomesoplenty:log_3": [4,5,6,7],
			"biomesoplenty:log_4": [4,5],
			"extrautils2:ironwood_log": [0,1],
			"minecraft:log": [0,1,2,3],
			"minecraft:log2": [0,1],
			"twilightforest:magic_log": [0,1,2,3],
			"twilightforest:twilight_log": [1,2,3],
		};
		for id, damage in removePart {
			for i in damage {
				removeJEI(<tconstruct:tooltables:2>.withTag({textureBlock: {id: id, Count: 1 as byte, Damage: i}}), false);
			}
		}
	//不要なToolforgeをJEIから削除
		val removeForge as short[][string] = {
			"botania:storage": [0,1,2],
			"chisel:blockcobalt": [0],
			"dcs_climate:dcs_ore_metal_alloy": [0,3,4,5,6,9],
			"dcs_climate:dcs_ore_metal_new": [0],
			"enderio:block_alloy": [0,1,2,3,4,5,6,7,8,9],
			"mekanism:basicblock": [0,2,4],
			"minecraft:glowstone": [0],
			"minecraft:gold_block": [0],
			"minecraft:iron_block": [0],
			"minecraft:redstone_block": [0],
			"projecte:matter_block": [0,1],
			"tconevo:metal_block": [4,5,6],
			"tconstruct:metal": [0,1,2,3,4,5],
			"thermalfoundation:storage_alloy": [0,1,2,3,4,5,6,7],
			"thermalfoundation:storage": [0,1,2,3,4,5,6,7],
			"twilightforest:block_storage": [1,2]
		};
		for id, damage in removeForge {
			for i in damage {
				removeJEI(<tconstruct:toolforge>.withTag({textureBlock: {id: id, Count: 1 as byte, Damage: i}}), false);
			}
		}

//JEIタブの削除
val removeCategory as string[] = [
	"alloying",
	"drying",
	"railcraft.rock.crusher",
];
for i in removeCategory {
	//mods.jei.JEI.hideCategory(i);
}

//JEIへの新規登録
val mapAdd as IItemStack[] = [
		<tconstruct:edible:5>,
		<tconstruct:slime_boots:5>,
		<tconstruct:slime_congealed:5>,
		<tconstruct:slime:5>,
		<tconstruct:slimesling:5>,
		cap6x,
		toolForge,
];
for i in mapAdd {
	mods.jei.JEI.addItem(i);
}

//説明ページの追加
function addDesc(items as IItemStack[], desc as string[]) {
	mods.jei.JEI.addDescription(items, desc);
}
addDesc([<contenttweaker:drop_soul>],[I18n.format("gohd.jei.drop_soul.name")]);
addDesc([<dcs_climate:dcs_tinder:0>, <dcs_climate:dcs_tinder:1>], [I18n.format("gohd.jei.tinder.name")]);

//このscriptの読み込みの完了をログに出力
print("jei.zs loaded!");
