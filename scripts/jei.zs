#====================================================================
# Name   : jei.zs
# Author : Hiiragi R. Tsubasa: https://github.com/Hiiragi283
# Info   : Scripts for JEI
#====================================================================

#priority 90

//Classのimport
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.recipes.IRecipeAction;
import crafttweaker.recipes.IRecipeFunction;
import mods.ctintegration.util.RecipePattern;
import mods.zenutils.HexHelper;
import mods.zenutils.I18n;
import scripts.grassUtils.RecipeUtils;
import scripts.HiiragiUtils;

//読み込みの開始をログに出力
print("Start loading jei.zs ...");

//JEIからの登録を削除
	//関数の定義
	function hideJEI(item as IItemStack, oreDict as bool) {
		mods.jei.JEI.hide(item);
		//ツールチップの付与
		item.addTooltip(I18n.format("gohd.tooltip.hidden.name"));
		if(oreDict) {
			//鉱石辞書の削除
			HiiragiUtils.tweakOreDict(item, [<ore:all>], []);
		}
	}
	//処理
	val mapHide as bool[IItemStack] = {};
	for i, j in mapHide {
		hideJEI(i, j);
	}

//JEIからの登録と作成レシピを削除
	//関数の定義
	function removeJEI(item as IItemStack, oreDict as bool) {
		mods.jei.JEI.removeAndHide(item);
		//ツールチップの付与
		item.addTooltip(I18n.format("gohd.tooltip.removed.name"));
		if(oreDict) {
			//鉱石辞書の削除
			HiiragiUtils.tweakOreDict(item, [<ore:all>], []);
		}
	}
	//処理
	val mapRemove as bool[IItemStack] = {
		<appliedenergistics2:material:40>: true,
		<enderio:block_simple_alloy_smelter>: false,
		<enderio:block_simple_crafter>: false,
		<enderio:block_simple_furnace>: false,
		<enderio:block_simple_sag_mill>: false,
		<enderio:block_simple_stirling_generator>: false,
		<enderio:block_simple_wired_charger>: false,
		<dcs_climate:dcs_bed_futon>: false,
		<dcs_climate:dcs_bed_hammock>: false,
		<dcs_climate:dcs_bed_rattan>: false,
		<dcs_climate:dcs_bed_white>: false,
		<dcs_climate:dcs_bed>: false,
		<dcs_climate:dcs_door_greisen>: false,
		<dcs_climate:dcs_door_gypsum>: false,
		<dcs_climate:dcs_door_marble>: false,
		<dcs_climate:dcs_door_steel>: false,
		<dcs_climate:dcs_gem:*>: true,
		//<microblockcbe:stone_rod>: true,
		<tconstruct:stone_stick>: true,
	};
	for i, j in mapRemove {
		removeJEI(i, j);
	}
		//Castまわりの処理
		val mapPattern as string[] = [
			"arrow_head",
			"arrow_shaft",
			"axe_head",
			"binding",
			"bow_limb",
			"bow_string",
			"broad_axe_head",
			"cross_guard",
			"excavator_head",
			"hammer_head",
			"hand_guard",
			"kama_head",
			"knife_blade",
			"large_plate",
			"large_sword_blade",
			"pan_head",
			"pick_head",
			"scythe_head",
			"shard",
			"sharpening_kit",
			"shovel_head",
			"sign_head",
			"sword_blade",
			"tool_rod",
			"tough_binding",
			"tough_tool_rod",
			"wide_guard",
		];
		for i in mapPattern {
			//Clay Castの無効化
			val castClay as IItemStack = <tconstruct:clay_cast>.withTag({PartType: "tconstruct" ~ i});
			removeJEI(castClay, false);
			//mods.tconstruct.Casting.removeTableRecipe(castClay);
		}
		//不要なStencil TableをJEIから削除
		val removeStencil as short[][string] = {
			"biomesoplenty:planks_0": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],
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
			"biomesoplenty:log_0": [4,5,6,7],
			"biomesoplenty:log_1": [4,5,6,7],
			"biomesoplenty:log_2": [4,5,6,7],
			"biomesoplenty:log_3": [4,5,6,7],
			"biomesoplenty:log_4": [4,5],
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
			"dcs_climate:dcs_ore_metal_alloy": [0,3,4,5,6,7,9],
			"dcs_climate:dcs_ore_metal_new": [0],
			"enderio:block_alloy": [0,1,2,3,4,5,6,7,8,9],
			"minecraft:glowstone": [0],
			"minecraft:gold_block": [0],
			"minecraft:iron_block": [0],
			"minecraft:redstone_block": [0],
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

//JEIへ新規登録
	//処理
	val mapAdd as IItemStack[] = [
		<tconstruct:edible:5>,
		<tconstruct:slime_boots:5>,
		<tconstruct:slime_congealed:5>,
		<tconstruct:slime:5>,
		<tconstruct:slimesling:5>,
		TablePart,
		TableStencil,
		ToolForge,
	];
	for i in mapAdd {
		mods.jei.JEI.addItem(i);
	}

//説明ページの追加
	//関数の定義
	function addDesc(items as IItemStack[], desc as string[]) {
		mods.jei.JEI.addDescription(items, desc);
	}
	//処理
	val mapDesc as string[][IItemStack[]] = {
		[<dcs_climate:dcs_tinder>, <dcs_climate:dcs_tinder:1>]: ["gohd.jei.tinder.name"],
	};
	for i, j in mapDesc {
		addDesc(i, j);
	}

//カテゴリーの削除
val mapCategory as string[] = [
	"thermaldynamics.covers",
	"jeresources.plant",
	"jeresources.worldgen",
	"threng.agg",
	"threng.purify",
	"threng.etch",
	"threng.energize",
];
for i in mapCategory {
	//mods.jei.JEI.hideCategory(i);
}

//読み込みの完了をログに出力
print("jei.zs loaded!");
