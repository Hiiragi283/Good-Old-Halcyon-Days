#priority 0

import crafttweaker.item.IItemStack;

import mods.chisel.Carving as chisel;
import mods.ctintegration.util.RecipePattern;
import mods.tconstruct.Casting as casting;
import mods.zenutils.I18n;

import scripts.HiiragiUtils;

//Hide items

val toHide as IItemStack[] = [];

for i in toHide {
    HiiragiUtils.hideFromJEI(i);
}

//Remove items

val toRemove as IItemStack[] = [
    <tcomplement:materials:10>,
    <tcomplement:materials:20>,
    <tcomplement:melter:8>,
    <tcomplement:storage:*>,
    <tconstruct:ore:0>
];

for i in toRemove {
    HiiragiUtils.removeFromJEI(i);
}

//Disable clay casts

val castPattern as string[] = [
    "pick_head",
    "arrow_shaft",
    "sign_head",
    "arrow_head",
    "tool_rod",
    "large_plate",
    "bow_string",
    "binding",
    "chisel_head",
    "cross_guard",
    "sharpening_kit",
    "sword_blade",
    "axe_head",
    "broad_axe_head",
    "scythe_head",
    "kama_head",
    "pan_head",
    "tough_tool_rod",
    "knife_blade",
    "bow_limb",
    "wide_guard",
    "excavator_head",
    "hammer_head",
    "large_sword_blade",
    "shovel_head",
    "hand_guard",
    "shard",
    "tough_binding"
];

chisel.addGroup("cast");

for i in castPattern {
    var CastPatternName as string = "tconstruct:" + i;
    var castClay as IItemStack = <tconstruct:clay_cast>.withTag({PartType: CastPatternName});
    HiiragiUtils.removeFromJEI(castClay);
    casting.removeTableRecipe(castClay);

    var castBrass as IItemStack = <tconstruct:cast>.withTag({PartType: CastPatternName});
    castBrass.addTooltip(I18n.format("gohd.tooltip.cast_chisel.name"));
    casting.removeTableRecipe(castBrass);
    chisel.addVariation("cast", castBrass);
}

for i in 0 to 5 {
    var castBrass as IItemStack = <tconstruct:cast_custom>.definition.makeStack(i);
    castBrass.addTooltip(I18n.format("gohd.tooltip.cast_chisel.name"));
    casting.removeTableRecipe(castBrass);
    chisel.addVariation("cast", castBrass);
}

HiiragiUtils.removeFromJEI(<tconstruct:clay_cast>.withTag({PartType:"tcomplement:chisel_head"}));

//tweak crafting recipes

HiiragiUtils.addCrafting(false, <tcomplement:melter:0>,
    RecipePattern.init(["AAA", "ABA", "CCC"])
    .map({A:<ore:blockGlass>, B:<tconstruct:seared_tank:*>, C:<tconstruct:materials:0>})
    .ingredients, true);

HiiragiUtils.addCrafting(true, <tconstruct:pattern>, [[<tconstruct:pattern>]], false);
recipes.remove(<tconstruct:smeltery_controller>);
recipes.replaceAllOccurences(<minecraft:furnace>, null, <tconstruct:seared_furnace_controller>);

//Tweak tooltips

<tconstruct:pattern>.addTooltip(I18n.format("gohd.tooltip.wooden_pattern.name"));
<tconstruct:smeltery_controller>.addTooltip(I18n.format("gohd.tooltip.smeltery_controller.name"));

<tcomplement:scorched_block:*>.clearTooltip();
<tcomplement:scorched_block:*>.addTooltip(I18n.format("gohd.tooltip.dont_use_for_decoration4"));
<tcomplement:scorched_block:*>.addTooltip(I18n.format("gohd.tooltip.dont_use_for_decoration3"));
<tcomplement:scorched_slab:*>.addTooltip(I18n.format("gohd.tooltip.dont_use_for_decoration4"));
<tcomplement:scorched_slab:*>.addTooltip(I18n.format("gohd.tooltip.dont_use_for_decoration3"));
<tcomplement:scorched_slab2:*>.addTooltip(I18n.format("gohd.tooltip.dont_use_for_decoration4"));
<tcomplement:scorched_slab2:*>.addTooltip(I18n.format("gohd.tooltip.dont_use_for_decoration3"));
<tconstruct:seared:*>.clearTooltip();
<tconstruct:seared:*>.addTooltip(I18n.format("gohd.tooltip.dont_use_for_decoration1"));
<tconstruct:seared:*>.addTooltip(I18n.format("gohd.tooltip.dont_use_for_decoration3"));
<tconstruct:seared_glass>.clearTooltip();
<tconstruct:seared_glass>.addTooltip(I18n.format("gohd.tooltip.dont_use_for_decoration1"));
<tconstruct:seared_glass>.addTooltip(I18n.format("gohd.tooltip.dont_use_for_decoration3"));
<tconstruct:seared_glass>.addTooltip(I18n.format("gohd.tooltip.dont_use_for_decoration2"));
<tconstruct:seared_slab:*>.addTooltip(I18n.format("gohd.tooltip.dont_use_for_decoration1"));
<tconstruct:seared_slab:*>.addTooltip(I18n.format("gohd.tooltip.dont_use_for_decoration3"));
<tconstruct:seared_slab2:*>.addTooltip(I18n.format("gohd.tooltip.dont_use_for_decoration1"));
<tconstruct:seared_slab2:*>.addTooltip(I18n.format("gohd.tooltip.dont_use_for_decoration3"));
