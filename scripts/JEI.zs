#======================================================================
# name : jei.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : scripts for JEI
#======================================================================

#priority 0

#crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

#各種modからclassをimport
import mods.jei.JEI.addItem;
import mods.jei.JEI.addDescription;
import mods.jei.JEI.hide;
import mods.jei.JEI.hideCategory;
import mods.jei.JEI.removeAndHide;
import mods.zenutils.I18n;

#scriptのimport
import scripts.HiiragiUtils;

#このscriptの読み込みの開始をログに出力
print("Start loading jei.zs ...");

#変数の定義

#JEIからアイテムを隠す
val toHide as IItemStack[] = [
    <appliedenergistics2:quartz_ore>,
    <appliedenergistics2:charged_quartz_ore>,
    <appliedenergistics2:facade:*>
];
for i in toHide {
    HiiragiUtils.hideFromJEI(i);
}

#JEIからアイテムを隠しレシピを削除する
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

#JEI上のアイテムにTooltipを追加する

#このscriptの読み込みの完了をログに出力
print("jei.zs loaded!");
