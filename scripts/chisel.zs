#======================================================================
# name : chisel.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# infot : scripts for chisel mod
#======================================================================

#priority 0

#crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

#各種modからclassをimport

#scriptのimport
import scripts.HiiragiUtils;

#このscriptの読み込みの開始をログに出力
print("Start loading chisel.zs ...");

#変数の定義

#作業台レシピの編集
##削除
val removeCrafting as IItemStack[] = [];
for i in removeCrafting {
    HiiragiUtils.removeCrafting(i);
}
##上書き
##新規

#かまどレシピの編集
##削除
val removeFurnace as IItemStack[] = [];
for i in removeFurnace {
    HiiragiUtils.removeFurnace(i);
}
##新規
val addFurnace as IIngredient[IItemStack] = {};
for output, input in addFurnace {
    HiiragiUtils.addFurnace(false, output, input);
}

#AWレシピの編集
##import
##新規

#GTレシピの編集
##削除
##上書き
##新規

#chiselおよびunlimited chisel worksの建材のみをJEIから隠す
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

#このscriptの読み込みの完了をログに出力
print("chisel.zs loaded!");
