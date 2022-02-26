#======================================================================
# name : materials.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : scripts for registring gregtech material
#======================================================================

#priority 1000
#loader gregtech

//crafttweakerからclassをimport

//各種modからclassをimport
import mods.gregtech.material.Material;
import mods.gregtech.material.MaterialBuilder;
import mods.gregtech.material.MaterialRegistry;

//scriptのimport

//このscriptの読み込みの開始をログに出力
print("Start loading materials.zs ...");

//変数の定義

//レシピの編集

//素材の登録
val grout = MaterialBuilder(32000, "grout")
    .dust()
    .color(0x878b92).iconSet("DULL")
    .flags(["mortar_grindable"])
    .build();

//登録済みの素材の編集

//このscriptの読み込みの完了をログに出力
print("materials.zs loaded!");
