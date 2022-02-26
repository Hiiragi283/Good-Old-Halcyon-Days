#======================================================================
# name : oredict.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : scripts for adding and removing ore dictionary
#======================================================================

#priority 10

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;

//各種modからclassをimport

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading oredict.zs ...");

//変数の定義

//レシピの編集

//鉱石辞書の削除

//鉱石辞書の追加
<ore:blockGrout>.add(<tconstruct:soil:0>);

//このscriptの読み込みの完了をログに出力
print("oredict.zs loaded!");
