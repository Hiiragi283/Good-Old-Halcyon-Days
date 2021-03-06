#====================================================================
# ファイル名 : HiiragiUtils.zs
# 作成者 : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# 情報 : 有用な機能を実装
#        このスクリプトの一部はGrassUtilsを参考にしています
#        -> https://github.com/friendlyhj/GrassUtils
#====================================================================

#priority 99

//crafttweakerからclassをimport
import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.recipes.IRecipeAction;
import crafttweaker.recipes.IRecipeFunction;

//各種modからclassをimport
//import mods.astralsorcery.Altar;
import mods.jei.JEI.hide;
import mods.jei.JEI.removeAndHide;
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

	static voltageTier as int[] = [
		32, //ULV
		128, //LV
		512, //MV
		2048, //HV
		8192, //EV
		32768, //IV
		131072, //LuV
	];

//代入されたIItemStackから名前を生成する関数
	function getNameItem (item as IItemStack) as string {
		var owner as string = item.definition.owner;
		var id as string = item.definition.id.split(":")[1];
		var meta as int = item.metadata;
		return (owner ~ "_" ~ id ~ "_" ~ meta);
	}

//代入されたILiquidStackから名前を生成する関数
	function getNameLiquid (liquid as ILiquidStack) as string {
		var name as string = liquid.name;
		return ("liquid_" ~ name);
	}

//代入されたIOreDictEntryから名前を生成する関数
	function getNameOreDict (oredict as IOreDictEntry) as string {
		var name as string = oredict.name;
	}

//代入されたIItemStackに紐づけされた鉱石辞書を取得し、それを削除する関数
	function removeOreDict (item as IItemStack) {
		if (!isNull(item.ores)) {
			var oredict = item.ores;
			for i in oredict {
				i.remove(item);
			}
		}
	}

//代入されたIItemStackをJEIから隠す関数
	function hideFromJEI (item as IItemStack) {
		mods.jei.JEI.hide(item);
		item.addTooltip(I18n.format("gohd.tooltip.hidden.name"));
	}

//代入されたIItemStackをJEIから隠し、レシピを削除する関数
	function removeFromJEI (item as IItemStack) {
		mods.jei.JEI.removeAndHide(item);
		item.addTooltip(I18n.format("gohd.tooltip.removed.name"));
	}

//レシピ名を自動的に生成しつつレシピを登録する関数
	static recipeID as int = 0;
	function addCrafting (shapeless as bool, remove as bool, output as IItemStack, input as IIngredient[][]) {
		var recipeName as string = getNameItem(output) ~ "_" ~ recipeID;
		if (remove) {
			recipes.remove(output, true);
		}
		if (!shapeless) {
			recipes.addShaped(recipeName, output, input);
		} else {
			recipes.addShapeless(recipeName, output, input[0]);
		}
		recipeID += 1;
	}
	function removeCrafting (output as IItemStack) {
		recipes.remove(output, true);
	}

	function addCraftingAdv (shapeless as bool, remove as bool, output as IItemStack, input as IIngredient[][], recipeFunction as IRecipeFunction, recipeAction as IRecipeAction) {
		var recipeName as string = getNameItem(output) ~ "_" ~ recipeID;
		if (remove) {
			recipes.remove(output, true);
		}
		if (!shapeless) {
			recipes.addShaped(recipeName, output, input, recipeFunction, recipeAction);
		} else {
			recipes.addShapeless(recipeName, output, input[0], recipeFunction, recipeAction);
		}
		recipeID += 1;
	}

	function addCraftingShaped (remove as bool, output as IItemStack, input as IIngredient[][], recipeFunction as IRecipeFunction, recipeAction as IRecipeAction) {
		var recipeName as string = getNameItem(output) ~ "_" ~ recipeID;
		if (remove) {
			recipes.remove(output, true);
		}
		recipes.addShaped(recipeName, output, input, recipeFunction, recipeAction);
		recipeID += 1;
	}

	function addCraftingShapeless (remove as bool, output as IItemStack, input as IIngredient[], recipeFunction as IRecipeFunction, recipeAction as IRecipeAction) {
		var recipeName as string = getNameItem(output) ~ "_" ~ recipeID;
		if (remove) {
			recipes.remove(output, true);
		}
		recipes.addShapeless(recipeName, output, input, recipeFunction, recipeAction);
		recipeID += 1;
	}

//アイテムの等価交換を実装するレシピ
	function addCraftingConv (item1, item2) {
		var recipeName1 as string = getNameItem(item1 as IItemStack) ~ "_" ~ recipeID;
		var recipeName2 as string = getNameItem(item2 as IItemStack) ~ "_" ~ recipeID;
		recipes.addShapeless(recipeName1, item1 as IItemStack, [item2 as IIngredient]);
		recipes.addShapeless(recipeName2, item2  as IItemStack, [item1 as IIngredient]);
	}

	function addCraftingConvOre (item1 as IOreDictEntry, item2 as IOreDictEntry) {
		var recipeName1 as string = getNameOreDict(item1) ~ "_" ~ recipeID;
		var recipeName2 as string = getNameOreDict(item2) ~ "_" ~ recipeID;
		recipes.addShapeless(recipeName1, item1.firstItem, [item2]);
		recipes.addShapeless(recipeName2, item2.firstItem, [item1]);
	}

//レシピ上のアイテムを置換する関数
	function addCraftingReplace (fromReplace as IIngredient, toReplace as IIngredient, output as IItemStack) {
		if (isNull(output)) {
			recipes.replaceAllOccurences(fromReplace, toReplace);
		} else {
			recipes.replaceAllOccurences(fromReplace, toReplace, output);
		}
	}

//自動的に古いレシピを削除する機能を備えた関数
	function addFurnace (remove as bool, output as IItemStack, input as IIngredient) {
		if (remove) {
			furnace.remove(output);
		}
		furnace.addRecipe(output, input);
	}
	function removeFurnace (output as IItemStack) {
		furnace.remove(output);
	}

//道具の耐久値を消費するレシピ用
	function toolInput(tool as IItemStack, damage as int) as IIngredient {
		return tool.anyDamage().transformDamage(damage);
	}

//代入したアイテムに翻訳キーを対応させる
	function addLocname(item as IItemStack, key as string) as IItemStack {
		return item.withTag({display:{LocName: key}});
	}

//代入した文字列から特定の鋳型を返す関数
	function castClay (pattern as string) as IItemStack {
		if (isNull(pattern)) {
			return <tconstruct:clay_cast>;
		} else if (pattern == "chisel_head") {
			return <tconstruct:clay_cast>.withTag({PartType:"tcomplement:chisel_head"});
		} else
			var patternName = "tconstruct:" + pattern;
			return <tconstruct:clay_cast>.withTag({PartType:patternName});
	}

	function castBrass (pattern as string) as IItemStack {
		if (isNull(pattern)) {
			return <tconstruct:cast>;
		} else if (pattern == "chisel_head") {
			return <tconstruct:cast>.withTag({PartType:"tcomplement:chisel_head"});
		} else if (pattern == "ingot") {
			return <tconstruct:cast_custom:0>;
		} else if (pattern == "nugget") {
			return <tconstruct:cast_custom:1>;
		} else if (pattern == "gem") {
			return <tconstruct:cast_custom:2>;
		} else if (pattern == "plate") {
			return <tconstruct:cast_custom:3>;
		} else if (pattern == "gear") {
			return <tconstruct:cast_custom:4>;
		} else
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

//アイテムに付与されたNBTタグを継承する
function inheritStatus(itemBase as IItemStack) as IRecipeFunction {
	return function(out, ins, cInfo){
		if(!ins.inherit.hasTag) {
			return itemBase;
		} else {
			var nbt as IData = ins.inherit.tag;
			return itemBase.withTag(nbt);
		}
	};
}

//液体入りアイテムを返す関数
/*function liquidItem (type as string, liquid as ILiquidStack) as IItemStack {
	var name as string = liquid.name;
	if (type == "bucket") {
		return <forge:bucketfilled>.withTag({FluidName: name, Amount: 1000});
	} else {
		if (type == "cell") {
			return <techreborn:dynamiccell>.withTag({Fluid: {FluidName: name, Amount: 1000}});
		}
	}
}*/

//HaCの見た目が変わるブロックの見た目を指定
function changeAppear (block as IItemStack, color as int) as IItemStack {
	return block.withTag({Color: color});
}

//このscriptの読み込みの完了をログに出力
print("HiiragiUtils.zs loaded!");
