#priority 0

import crafttweaker.item.IItemStack;

import mods.ctintegration.util.RecipePattern;

import scripts.HiiragiUtils;

//Tweak crafting recipes

HiiragiUtils.addCrafting(false, false, <contenttweaker:saw_flint>,
    RecipePattern.init(["AAA", " BB", "   "]).map({A:<ore:stickWood>, B:<ore:itemFlint>}).ingredients);
