#====================================================================
# Name   : jei.zs
# Author : Hiiragi R. Tsubasa: https://github.com/Hiiragi283
# Info   : Scripts for JEI
#====================================================================

#priority 98

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
		item.addTooltip(I18n.format("ragicraft.tooltip.hidden.name"));
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
		item.addTooltip(I18n.format("ragicraft.tooltip.removed.name"));
		if(oreDict) {
			//鉱石辞書の削除
			HiiragiUtils.tweakOreDict(item, [<ore:all>], []);
		}
	}
	//処理
	val mapRemove as bool[IItemStack] = {
		<appliedenergistics2:material:40>: true,
		<dcs_climate:dcs_gem:*>: true,
		<microblockcbe:stone_rod>: true,
		<tcomplement:steel_boots>: false,
		<tcomplement:steel_chestplate>: false,
		<tcomplement:steel_helmet>: false,
		<tcomplement:steel_leggings>: false,
		<tcomplement:storage>: true,
		<tconstruct:stone_stick>: true,
	};
	for i, j in mapRemove {
		removeJEI(i, j);
	}

//JEIへ新規登録
	//処理
	val mapAdd as IItemStack[] = [
		<tconstruct:edible:5>,
		<tconstruct:slime_boots:5>,
		<tconstruct:slime_congealed:5>,
		<tconstruct:slime:5>,
		<tconstruct:slimesling:5>,
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
	val mapDesc as string[][IItemStack[]] = {};
	for i, j in mapDesc {
		addDesc(i, j);
	}

//読み込みの完了をログに出力
print("jei.zs loaded!");
