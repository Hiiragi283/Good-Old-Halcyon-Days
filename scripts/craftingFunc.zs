#====================================================================
# Name   : craftingFunc.zs
# Author : Hiiragi R. Tsubasa: https://github.com/Hiiragi283
# Info   : Register functional crafting recipes
#====================================================================

#priority 0

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
print("Start loading craftingFunc.zs ...");

//Tinker's Construct
	val mapTcon as IItemStack[] = [
		<tconstruct:rack:0>,
		<tconstruct:rack:1>,
		<tconstruct:toolforge>,
		<tconstruct:tooltables:1>,
		<tconstruct:tooltables:2>,
	];
	for i in mapTcon {
		HiiragiUtils.addShapeless(i, [i, <*>.marked("texture")], function(out, ins, cInfo) {
			var id as string = ins.texture.definition.id;
			var meta as int = ins.texture.metadata;
			return i.withTag({textureBlock: {id: id, Count: 1 as byte, Damage: meta as short}});
		i.addTooltip(I18n.format("gohd.tooltip.tcon_appear.name"));
		}, null);
	}

//読み込みの完了をログに出力
print("craftingFunc.zs loaded!");
