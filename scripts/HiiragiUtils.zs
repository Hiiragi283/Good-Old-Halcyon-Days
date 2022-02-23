#priority 99

//Some scripts are partially referred to GrassUtils : https://github.com/friendlyhj/GrassUtils

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;

//import mods.ctintegration.util.RecipePattern;
import mods.jei.JEI.hide;
import mods.jei.JEI.removeAndHide;
import mods.zenutils.I18n;

//Get name from the passed item

function getNameItem (item as IItemStack) as string {
    var owner as string = item.definition.owner;
    var id as string = item.definition.id.split(":")[1];
    var meta as int = item.metadata;
    return (owner ~ "_" ~ id ~ "_" ~ meta);
} 

//Get name from the passed liquid

function getNameLiquid (fluid as ILiquidStack) as string {
    var name as string = fluid.name;
    return ("liquid_" ~ name);
} 

//Detect oredict automaticaly from the passed item and remove oredict

function removeOreDict (item as IItemStack) {
    if (!isNull(item.ores)) {
        var oredict = item.ores;
        for i in oredict {
            i.remove(item);
        }
    }
}

//Hide the passed item from JEI

function hideFromJEI (item as IItemStack) {
    mods.jei.JEI.hide(item);
    item.addTooltip(I18n.format("gohd.tooltip.hided.name"));
}

//Hide the passed item from JEI and remove its recipe

function removeFromJEI (item as IItemStack) {
    mods.jei.JEI.removeAndHide(item);
    item.addTooltip(I18n.format("gohd.tooltip.removed.name"));
}

//Make crafting recipe pattern
/*
function recipePattern (shapeless as bool, pattern as string[], map as IIngredient[string]) as IIngredient[][] {
    if (!shapeless) {
        return RecipePattern.init(pattern).map(map).ingredients;
    } else {
        return RecipePattern.init(pattern).map(map).shapelessIngredients;
    }
}
*/
//Make recipe with auto-generated name

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
