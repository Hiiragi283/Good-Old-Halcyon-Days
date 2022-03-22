#======================================================================
# name : preinit.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : scripts loaded in preinit
#======================================================================

#priority 10000
#loader preinit

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport

//scriptのimport

//このscriptの読み込みの開始をログに出力
print("Start loading preinit.zs ...");

//変数の定義

//レシピの編集

//代入されたIItemStackに紐づけされた鉱石辞書を取得し、それを削除する
//異なるloaderを利用するファイル間ではimportができないため、こちらでも定義する必要があった
    function removeOreDict (item as IItemStack) {
        if (!isNull(item.ores)) {
            var oredict = item.ores;
            for i in oredict {
                i.remove(item);
            }
        }
    }

//このscriptの読み込みの完了をログに出力
print("preinit.zs loaded!");
