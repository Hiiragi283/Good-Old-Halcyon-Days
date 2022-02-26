#======================================================================
# name : chisel.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# infot : scripts for chisel mod
#======================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading chisel.zs ...");

//変数の定義

//レシピの編集

//chiselおよびunlimited chisel worksの建材のみをJEIから隠す
val chisel = loadedMods["chisel"];
for i in chisel.items {
    if (!(i.matches(<chisel:auto_chisel>)
        || i.matches(<chisel:chisel_iron>)
        || i.matches(<chisel:chisel_diamond>)
        || i.matches(<chisel:chisel_hitech>)
        || i.matches(<chisel:offsettool>))) {
            HiiragiUtils.hideFromJEI(i);
            HiiragiUtils.removeOreDict(i);
    }
}
val ucw = loadedMods["unlimitedchiselworks"];
for i in ucw.items {
        HiiragiUtils.hideFromJEI(i);
}

//このscriptの読み込みの完了をログに出力
print("chisel.zs loaded!");
