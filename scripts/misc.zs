#======================================================================
# name : misc.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : scripts for mics
#======================================================================

#priority 0

#crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

#各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import mods.gregtech.recipe.RecipeMap;
import mods.zenutils.I18n;

#scriptのimport
import scripts.HiiragiUtils;

#このscriptの読み込みの開始をログに出力
print("Start loading misc.zs ...");

#変数の定義

#作業台レシピの編集
##削除
val removeCrafting as IItemStack[] = [];
for i in removeCrafting {
    HiiragiUtils.removeCrafting(i);
}
##上書き
##新規

#かまどレシピの編集
##削除
val removeFurnace as IItemStack[] = [];
for i in removeFurnace {
    HiiragiUtils.removeFurnace(i);
}
##新規
val addFurnace as IIngredient[IItemStack] = {};
for output, input in addFurnace {
    HiiragiUtils.addFurnace(false, output, input);
}

#AWレシピの編集
##import
##新規

#GTレシピの編集
##削除
##上書き
##新規

#tooltipの編集

<tconstruct:pattern>.addTooltip(I18n.format("gohd.tooltip.wooden_pattern.name"));
<gregtech:meta_item_1:347>.addTooltip(I18n.format("gohd.tooltip.wooden_form.name"));
<tconstruct:cast>.addTooltip(I18n.format("gohd.tooltip.cast_chisel.name"));
<tconstruct:smeltery_controller>.addTooltip(I18n.format("gohd.tooltip.smeltery_controller.name"));
<tconstruct:seared_slab:*>.addTooltip(I18n.format("tile.tconstruct.seared.tooltip"));
<tconstruct:seared_slab2:*>.addTooltip(I18n.format("tile.tconstruct.seared.tooltip"));

#このscriptの読み込みの完了をログに出力
print("misc.zs loaded!");
