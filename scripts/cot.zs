#======================================================================
# ファイル名 : _TEMPLATE.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : このファイルについて書く
#======================================================================

#loader contenttweaker
#priority 1000

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.contenttweaker.BlockMaterial;
import mods.contenttweaker.Color;
import mods.contenttweaker.IBlockColorSupplier;
import mods.contenttweaker.ResourceLocation;
import mods.contenttweaker.VanillaFactory;
import mods.zenutils.HexHelper;

//このscriptの読み込みの開始をログに出力
print("Start loading _TEMPLATE.zs ...");

//アイテムの追加
    val items as string[] = [
        "unfired_heating_crucible"
    ];
    for i in items {
        var itemToRegister = mods.contenttweaker.VanillaFactory.createItem(i);
        itemToRegister.register();
    }

//このscriptの読み込みの完了をログに出力
print("_TEMPLATE.zs loaded!");
