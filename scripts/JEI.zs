#priority 0

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.jei.JEI.addItem;
import mods.jei.JEI.addDescription;
import mods.jei.JEI.hide;
import mods.jei.JEI.hideCategory;
import mods.jei.JEI.removeAndHide;
import mods.zenutils.I18n;

import scripts.HiiragiUtils;

// Hide items from JEI

val toHide as IItemStack[] = [
    <minecraft:spawn_egg:*>,
//  <minecraft:splash_potion:*>,
//  <minecraft:tipped_arrow:*>,
//  <minecraft:lingering_potion:*>,
    <minecraft:mob_spawner>,
    <minecraft:structure_void>,
    <minecraft:structure_block>,
//  <minecraft:filled_map>,
    <minecraft:command_block_minecart>,
    <appliedenergistics2:quartz_ore>,
    <appliedenergistics2:charged_quartz_ore>,
    <appliedenergistics2:facade:*>
];

for i in toHide {
    HiiragiUtils.hideFromJEI(i);
}

// Remove items from JEI

// Add tooltip

/*val dontUseForDecoration as IItemStack[] = [
    <tcomplement:scorched_block:*>,
    <tcomplement:scorched_slab:*>,
    <tcomplement:scorched_slab2:*>,
    <tconstruct:seared:*>,
    <tconstruct:seared_glass:*>,
    <tconstruct:seared_slab:*>,
    <tconstruct:seared_slab2:*>
];*/
