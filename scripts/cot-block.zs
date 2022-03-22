#======================================================================
# name : cot-block.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : scripts for content tweaker
#        Some scripts are partially referred to this repositry
#        -> https://github.com/delta-nos/MorphoDays_old
#======================================================================

#priority 100
#loader contenttweaker reloadableevents

//crafttweakerからclassをimport

//各種modからclassをimport
import mods.contenttweaker.BlockMaterial;
import mods.contenttweaker.Color;
import mods.contenttweaker.IBlockColorSupplier;
import mods.contenttweaker.ResourceLocation;
import mods.contenttweaker.VanillaFactory;
import mods.zenutils.HexHelper;

//このscriptの読み込みの開始をログに出力
print("Start loading cot-block.zs ...");

//単純なブロックの追加
    //Living Wood Casing
        var casing_livingwood = mods.contenttweaker.VanillaFactory.createBlock("casing_livingwood", <blockmaterial:wood>);
        casing_livingwood.register();
    //Living rock Casing
        var casing_livingrock = mods.contenttweaker.VanillaFactory.createBlock("casing_livingrock", <blockmaterial:rock>);
        casing_livingrock.register();

//このscriptの読み込みの完了をログに出力
print("cot-block.zs loaded!");
