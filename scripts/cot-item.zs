#======================================================================
# name : cot-item.zs
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
import mods.zenutils.HexHelper;

//このscriptの読み込みの開始をログに出力
print("Start loading cot-item.zs ...");

//単純なアイテムを登録
    val items as string[] = [
        "unfired_seared_channel",
        "unfired_casting_table",
        "unfired_casting_basin",
        "wiring_basic",
        "wiring_advanced",
        "wiring_elite",
        "circuit_board_basic",
        "circuit_board_advanced",
        "circuit_board_elite",
        "plate_livingwood",
        "plate_livingrock"
    ];
    for i in items {
        var itemRegistry = mods.contenttweaker.VanillaFactory.createItem(i);
        itemRegistry.register();
    }

//色付きアイテムを登録
    val map as string[string][string]= {
        "grout_ingot":{
            "878b92":"gregtech:items/material_sets/rough/ingot"
        },
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
    val record_minecraft = mods.contenttweaker.VanillaFactory.createItem("record_minecraft");
    record_minecraft.maxStackSize = 1;
    record_minecraft.rarity = "EPIC";
    record_minecraft.register();

//このscriptの読み込みの完了をログに出力
print("cot-item.zs loaded!");

/*
53 55 57
61 34 26

114 89 93

57 44 46
*/
