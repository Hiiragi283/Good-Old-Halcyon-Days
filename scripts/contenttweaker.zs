#======================================================================
# name : contenttweaker.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : scripts for content tweaker
#======================================================================

#priority 100
#loader contenttweaker reloadableevents

//crafttweakerからclassをimport

//各種modからclassをimport
import mods.contenttweaker.VanillaFactory;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading contenttweaker.zs ...");

//変数の定義

//レシピの編集

//単純なアイテムを登録
val items as string[] = [
    "unfired_seared_brick"
];
for i in items {
    var itemRegistry = mods.contenttweaker.VanillaFactory.createItem(i);
    itemRegistry.register();
}

//特殊なアイテムを登録
val flintSaw = mods.contenttweaker.VanillaFactory.createItem("saw_flint");
flintSaw.maxDamage = 16;
flintSaw.maxStackSize = 1;
flintSaw.register();

//このscriptの読み込みの完了をログに出力
print("contenttweaker.zs loaded!");
