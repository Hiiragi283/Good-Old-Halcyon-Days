#======================================================================
# name : jei.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : scripts for JEI
#======================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.jei.JEI.addItem;
import mods.jei.JEI.addDescription;
import mods.jei.JEI.hide;
import mods.jei.JEI.hideCategory;
import mods.jei.JEI.removeAndHide;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading jei.zs ...");

//変数の定義

//レシピの編集

//JEIからアイテムを隠す
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

//JEIからアイテムを隠しレシピを削除する

//JEI上のアイテムにTooltipを追加する

/*val dontUseForDecoration as IItemStack[] = [
    <tcomplement:scorched_block:*>,
    <tcomplement:scorched_slab:*>,
    <tcomplement:scorched_slab2:*>,
    <tconstruct:seared:*>,
    <tconstruct:seared_glass:*>,
    <tconstruct:seared_slab:*>,
    <tconstruct:seared_slab2:*>
];*/

//このscriptの読み込みの完了をログに出力
print("jei.zs loaded!");
