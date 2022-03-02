#======================================================================
# name : contenttweaker.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : scripts for content tweaker
#        Some scripts are partially referred to this repositry
#        -> https://github.com/delta-nos/MorphoDays_old
#======================================================================

#priority 100
#loader contenttweaker reloadableevents

//crafttweakerからclassをimport

//各種modからclassをimport
import mods.contenttweaker.Color;
import mods.contenttweaker.IItemColorSupplier;
import mods.contenttweaker.ResourceLocation;
import mods.contenttweaker.VanillaFactory;

//このscriptの読み込みの開始をログに出力
print("Start loading contenttweaker.zs ...");

//変数の定義

//レシピの編集

//単純なアイテムを登録
val items as string[] = [];/*
for i in items {
    var itemRegistry = mods.contenttweaker.VanillaFactory.createItem(i);
    itemRegistry.register();
}*/

//色付きアイテムを登録

val map as string[string][string]= {
    "grout_dust":{
        "878b92":"gregtech:items/material_sets/rough/dust"
    },
    "grout_ingot":{
        "878b92":"gregtech:items/material_sets/rough/ingot"
    }
};
for id, textureMap in map {
    for color, texture in textureMap {
        var item = mods.contenttweaker.VanillaFactory.createItem(id);
        item.itemColorSupplier = function(item, tintindex) {
            return Color.fromHex(color);
        };
        item.textureLocation = ResourceLocation.create(texture);
        item.register();
    }
}

//特殊なアイテムを登録
val flintSaw = mods.contenttweaker.VanillaFactory.createItem("saw_flint");
flintSaw.maxDamage = 16;
flintSaw.maxStackSize = 1;
flintSaw.register();

val record_minecraft = mods.contenttweaker.VanillaFactory.createItem("record_minecarft");
record_minecraft.maxStackSize = 1;
record_minecraft.rarity = "EPIC";
record_minecraft.register();
//このscriptの読み込みの完了をログに出力
print("contenttweaker.zs loaded!");
