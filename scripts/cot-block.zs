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
import mods.contenttweaker.Fluid;
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

    //Terrestrial Agglomeration Core
        var agglo_core_mana = mods.contenttweaker.VanillaFactory.createBlock("agglo_core_mana", <blockmaterial:iron>);
        agglo_core_mana.register();
    //Terre-Infused Terrestrial Agglomeration Core
        var agglo_core_terra = mods.contenttweaker.VanillaFactory.createBlock("agglo_core_terra", <blockmaterial:iron>);
        agglo_core_terra.register();
    //Elemental Terrestrial Agglomeration Core
        var agglo_core_elem = mods.contenttweaker.VanillaFactory.createBlock("agglo_core_elem", <blockmaterial:iron>);
        agglo_core_elem.register();
    //Gaia-blessed Terrestrial Agglomeration Core
        var agglo_core_gaia = mods.contenttweaker.VanillaFactory.createBlock("agglo_core_gaia", <blockmaterial:iron>);
        agglo_core_gaia.register();

    //End Portal Agglomeration Altar
        var end_portal_altar = mods.contenttweaker.VanillaFactory.createBlock("end_portal_altar", <blockmaterial:glass>);
        end_portal_altar.register();

    //Enderstone
        var ender_stone = mods.contenttweaker.VanillaFactory.createBlock("ender_stone", <blockmaterial:rock>);
        ender_stone.register();

//液体の追加
        var evil_distillation = mods.contenttweaker.VanillaFactory.createFluid("evil_distillation", Color.fromHex("2C105C"));
        evil_distillation.density = 4000;
        evil_distillation.viscosity = 250;
        evil_distillation.fillSound = <soundevent:minecraft:ambient.cave>;
        evil_distillation.emptySound = <soundevent:minecraft:ambient.cave>;
        evil_distillation.register();

//このscriptの読み込みの完了をログに出力
print("cot-block.zs loaded!");
