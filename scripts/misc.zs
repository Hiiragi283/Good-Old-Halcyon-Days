#======================================================================
# name : misc.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : scripts for mics
#======================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.ctintegration.util.RecipePattern;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;
import scripts.gregtech;

//このscriptの読み込みの開始をログに出力
print("Start loading misc.zs ...");

//変数の定義

//レシピの編集
HiiragiUtils.addCrafting(false, false, <contenttweaker:saw_flint>,
    RecipePattern.init(["AAA", " BB", "   "]).map({A:<ore:stickWood>, B:<ore:itemFlint>}).ingredients);
HiiragiUtils.addCrafting(true, true, <tconstruct:pattern>*4, [[<contenttweaker:saw_flint>.anyDamage().transformDamage(1), <ore:slabWood>]]);
HiiragiUtils.addCrafting(true, false, gregtech.gregItem(347), [[<tconstruct:pattern>]]);
HiiragiUtils.addCrafting(true, false, <tconstruct:pattern>, [[gregtech.gregItem(347)]]);

HiiragiUtils.addCrafting(true, false, <ore:blockGrout>.firstItem, [[<ore:dustGrout>, <ore:dustGrout>, <ore:dustGrout>, <ore:dustGrout>]]);
HiiragiUtils.addCrafting(true, false, <contenttweaker:grout_ingot>*4, [[gregtech.gregItem(348).reuse(), <ore:blockGrout>]]);

//tooltipの編集

<tconstruct:pattern>.addTooltip(I18n.format("gohd.tooltip.wooden_pattern.name"));
<gregtech:meta_item_1:347>.addTooltip(I18n.format("gohd.tooltip.wooden_form.name"));
<tconstruct:cast>.addTooltip(I18n.format("gohd.tooltip.cast_chisel.name"));
<tconstruct:smeltery_controller>.addTooltip(I18n.format("gohd.tooltip.smeltery_controller.name"));
<tconstruct:seared_slab:*>.addTooltip(I18n.format("tile.tconstruct.seared.tooltip"));
<tconstruct:seared_slab2:*>.addTooltip(I18n.format("tile.tconstruct.seared.tooltip"));

//このscriptの読み込みの完了をログに出力
print("misc.zs loaded!");
