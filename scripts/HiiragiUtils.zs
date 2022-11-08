#====================================================================
# Name   : HiiragiUtils.zs
# Author : Hiiragi R. Tsubasa: https://github.com/Hiiragi283
# Info   : Utilities for this pack
#====================================================================

#priority 100

//Classのimport
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.recipes.IRecipeAction;
import crafttweaker.recipes.IRecipeFunction;
import mods.zenutils.HexHelper;
import mods.zenutils.I18n;

//読み込みの開始をログに出力
print("Start loading HiiragiUtils.zs ...");

//定数の定義
	//染料
	static dyeList as IOreDictEntry[] = [
		<ore:dyeBlack>,
		<ore:dyeRed>,
		<ore:dyeGreen>,
		<ore:dyeBrown>,
		<ore:dyeBlue>,
		<ore:dyePurple>,
		<ore:dyeCyan>,
		<ore:dyeLightGray>,
		<ore:dyeGray>,
		<ore:dyePink>,
		<ore:dyeLime>,
		<ore:dyeYellow>,
		<ore:dyeLightBlue>,
		<ore:dyeMagenta>,
		<ore:dyeOrange>,
		<ore:dyeWhite>,
	];
	//レコード
	static listDisc as IItemStack[] = [
		<minecraft:record_13>,
		<minecraft:record_cat>,
		<minecraft:record_blocks>,
		<minecraft:record_chirp>,
		<minecraft:record_far>,
		<minecraft:record_mall>,
		<minecraft:record_mellohi>,
		<minecraft:record_stal>,
		<minecraft:record_strad>,
		<minecraft:record_ward>,
		<minecraft:record_11>,
		<minecraft:record_wait>,
	];
		//レコードの最大スタック数を変更
		for i in listDisc {
			i.maxStackSize = 16;
		}

//関数の定義
	//代入したアイテムに翻訳キーを対応させる関数
	function addLocname(item as IItemStack, key as string) as IItemStack {
		return item.withTag({display:{LocName: key}});
	}
	//アイテムに付与されたNBTタグを継承する関数
	function moveNBT(itemBase as IItemStack) as IRecipeFunction {
		return function(out, ins, cInfo){
			if(!ins.move.hasTag) {
				return itemBase;
			} else {
				var nbt as IData = ins.move.tag;
				return itemBase.withTag(nbt);
			}
		};
	}
	//レシピ上のアイテムを置換する関数
	function recipeReplace (before as IIngredient, after as IIngredient, output as IItemStack) {
		if (isNull(output)) {
			recipes.replaceAllOccurences(before, after);
		} else {
			recipes.replaceAllOccurences(before, after, output);
		}
	}
	//道具の耐久値を消費するアイテムを返す関数
	function toolInput(tool as IItemStack, damage as int) as IIngredient {
		return tool.anyDamage().transformDamage(damage);
	}
	//鉱石辞書を編集する関数
	function tweakOreDict(item as IItemStack, remove as IOreDictEntry[], add as IOreDictEntry[]) {
		//removeが空でないかどうか
		if(remove.length > 0) {
			//<ore:all>が最初にあるかどうか
			if(remove[0].name == "all") {
				//そのアイテムに紐づけられたすべての鉱石辞書を消す
				for i in item.definition.ores {
					i.remove(item);
				}
			} else {
				//指定された鉱石辞書のみを消す
				for i in remove {
					i.remove(item);
				}
			}
		}
		//addが空でないかどうか
		if(add.length > 0) {
			for i in add {
				//指定された鉱石辞書を付ける
				i.add(item);
			}
		}
	}

//読み込みの完了をログに出力
print("HiiragiUtils.zs loaded!");
