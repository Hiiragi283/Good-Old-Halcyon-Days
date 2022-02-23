#priority 0

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import mods.ctintegration.util.RecipePattern;

import scripts.HiiragiUtils;

val metaItem as IItemStack = <gregtech:meta_item_1>;

function gregItem (i as int) as IItemStack {
    return <gregtech:meta_item_1>.definition.makeStack(i);
}

//Tweak recipes

recipes.remove(gregItem(350));

HiiragiUtils.addCrafting(false, false, <ore:blockGrout>.firstItem, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<ore:dustGrout>}).ingredients);
HiiragiUtils.addCrafting(true, false, <ore:dustGrout>.firstItem * 9, [[<ore:blockGrout>]]);
HiiragiUtils.addCrafting(true, false, <contenttweaker:unfired_seared_brick>*4, [[gregItem(348).reuse(), <ore:blockGrout>]]);
