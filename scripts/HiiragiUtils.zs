#====================================================================
# ファイル名 : HiiragiUtils.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Registry some functions for Craft Tweaker
#        このスクリプトの一部はGrassUtilsを参考にしています
#        -> https://github.com/friendlyhj/GrassUtils
#====================================================================

#priority 99

//crafttweakerからclassをimport
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.recipes.IRecipeAction;
import crafttweaker.recipes.IRecipeFunction;
import crafttweaker.world.IBiome;
import crafttweaker.world.IBiomeType;

//各種modからclassをimport
import mods.zenutils.HexHelper;
import mods.zenutils.I18n;

//このscriptの読み込みの開始をログに出力
print("Start loading HiiragiUtils.zs ...");

//定数の定義
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

	static dyeLiquid as ILiquidStack[] = [
		<liquid:black>,
		<liquid:red>,
		<liquid:green>,
		<liquid:brown>,
		<liquid:blue>,
		<liquid:purple>,
		<liquid:cyan>,
		<liquid:light_gray>,
		<liquid:gray>,
		<liquid:pink>,
		<liquid:lime>,
		<liquid:yellow>,
		<liquid:light_blue>,
		<liquid:magenta>,
		<liquid:orange>,
		<liquid:white>,
	];

//代入されたIItemStackから名前を生成する関数
function getNameItem(item as IItemStack) as string {
	var owner as string = item.definition.owner;
	var id as string = item.definition.id.split(":")[1];
	var meta as int = item.metadata;
	return owner ~ "_" ~ id ~ "_" ~ meta;
}

//鉱石辞書を編集する関数
function tweakOreDict(item as IItemStack, remove as IOreDictEntry[], add as IOreDictEntry[]) {
	if(remove.length > 0) {
		if(remove[0].name == "all") {
			for i in item.definition.ores {
				i.remove(item);
			}
		} else {
			for i in remove {
				i.remove(item);
			}
		}
	}
	if(add.length > 0) {
		for i in add {
			i.add(item);
		}
	}
}

//レシピを登録する関数
	function removeCrafting (output as IItemStack) {
		recipes.remove(output, true);
	}

	function addCraftingShaped (remove as bool, output as IItemStack, input as IIngredient[][], recipeFunction as IRecipeFunction, recipeAction as IRecipeAction) {
		if (remove) {
			removeCrafting(output);
		}
		recipes.addShaped(output, input, recipeFunction, recipeAction);
	}

	function addCraftingShapeless (remove as bool, output as IItemStack, input as IIngredient[], recipeFunction as IRecipeFunction, recipeAction as IRecipeAction) {
		if (remove) {
			removeCrafting(output);
		}
		recipes.addShapeless(output, input, recipeFunction, recipeAction);
	}

//アイテムの等価交換を実装するレシピ
function addCraftingConv(item1 as IItemStack, item2 as IItemStack) {
	recipes.addShapeless(item1 as IItemStack, [item2 as IIngredient]);
	recipes.addShapeless(item2  as IItemStack, [item1 as IIngredient]);
}

function addCraftingConvOre(item1 as IOreDictEntry, item2 as IOreDictEntry) {
	recipes.addShapeless(item1.firstItem, [item2]);
	recipes.addShapeless(item2.firstItem, [item1]);
}

//レシピ上のアイテムを置換する関数
function recipeReplace (fromReplace as IIngredient, toReplace as IIngredient, output as IItemStack) {
	if (isNull(output)) {
		recipes.replaceAllOccurences(fromReplace, toReplace);
	} else {
		recipes.replaceAllOccurences(fromReplace, toReplace, output);
	}
}

//道具の耐久値を消費するレシピ用
function toolInput(tool as IItemStack, damage as int) as IIngredient {return tool.anyDamage().transformDamage(damage);}


//代入したアイテムに翻訳キーを対応させる
function addLocname(item as IItemStack, key as string) as IItemStack {return item.withTag({display:{LocName: key}});}

//アイテムに付与されたNBTタグを継承する
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

//クラフトが行われた時の天気をチェックする
function rainCheck(outFailed as IItemStack) as IRecipeFunction {
	return function(out, ins, cInfo) as IItemStack{
		if(cInfo.world.isRaining()) {
			return out as IItemStack;
		} else {
			return outFailed;
		}
	};
}

//クラフトが行われた時間帯をチェックする
function nightCheck(outFailed as IItemStack) as IRecipeFunction {
	return function(out, ins, cInfo) as IItemStack{
		var timeTotal as long = cInfo.world.getWorldTime();
		var time as long = timeTotal % 24000;
		if(time >= 13000 && time <= 23000) {
			return out as IItemStack;
		} else {
			return outFailed;
		}
	};
}

//クラフトが行われた次元をチェックする
function dimCheck(dimNum as int, outFailed as IItemStack) as IRecipeFunction {
	return function(out, ins, cInfo) as IItemStack{
		var dim as int = cInfo.dimensionID;
		if(dim == dimNum) {
			return out as IItemStack;
		} else {
			return outFailed;
		}
	};
}

//代入した文字列から特定の鋳型を返す関数
function castClay(pattern as string) as IItemStack {
	if(isNull(pattern)) return <tconstruct:clay_cast>;
	if(pattern == "chisel_head") return <tconstruct:clay_cast>.withTag({PartType:"tcomplement:chisel_head"});
	var patternName = "tconstruct:" + pattern;
	return <tconstruct:clay_cast>.withTag({PartType:patternName});
}

function castBrass(pattern as string) as IItemStack {
	if(isNull(pattern)) return <tconstruct:cast>;
	if(pattern == "chisel_head") return <tconstruct:cast>.withTag({PartType:"tcomplement:chisel_head"});
	if(pattern == "ingot") return <tconstruct:cast_custom:0>;
	if(pattern == "nugget") return <tconstruct:cast_custom:1>;
	if(pattern == "gem") return <tconstruct:cast_custom:2>;
	if(pattern == "plate") return <tconstruct:cast_custom:3>;
	if(pattern == "gear") return <tconstruct:cast_custom:4>;
	var patternName = "tconstruct:" + pattern;
	return <tconstruct:cast>.withTag({PartType:patternName});
}

//Castingレシピの編集
	function addCasting(type as string, remove as bool, output as IItemStack, cast as IIngredient, liquid as ILiquidStack, amount as int, consume as bool, time as int) {
		if(type == "table") {
			if(remove) {
				mods.tconstruct.Casting.removeTableRecipe(output);
			}
			mods.tconstruct.Casting.addTableRecipe(output, cast, liquid, amount, consume, time);
		} else if(type == "basin") {
			if(remove) {
				mods.tconstruct.Casting.removeBasinRecipe(output);
			}
			mods.tconstruct.Casting.addBasinRecipe(output, cast, liquid, amount, consume, time);
		}
	}

//このscriptの読み込みの完了をログに出力
print("HiiragiUtils.zs loaded!");
