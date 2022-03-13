#======================================================================
# name : furnace.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Tweak furnace recipes
#======================================================================

#priority 0
#norun

#crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

#各種modからclassをimport

#scriptのimport
import scripts.HiiragiUtils;

#このscriptの読み込みの開始をログに出力
print("Start loading furnace.zs ...");

#変数の定義

#レシピの削除
val toRemove as IIngredient[] = [
    HiiragiUtils.gregItem(350)
];
for i in toRemove {
    furnace.remove(i);
}

#レシピの上書き
val override as IIngredient[IItemStack] = {
    <tconstruct:materials:0> : <contenttweaker:grout_ingot>
};
for output, input in override {
    HiiragiUtils.addFurnace(true, output, input);
}

#レシピの追加
val adition as IIngredient[IItemStack] = {
    <ore:ingotUnscorched>.firstItem : <ore:dustUnscorched>
};
for output, input in override {
    HiiragiUtils.addFurnace(false, output, input);
}

#このscriptの読み込みの完了をログに出力
print("furnace.zs loaded!");
