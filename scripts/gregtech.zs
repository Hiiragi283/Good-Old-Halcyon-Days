#======================================================================
# name : gregtech.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Write about this script file
#======================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.ctintegration.util.RecipePattern;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading gregtech.zs ...");

//変数の登録
val metaItem as IItemStack = <gregtech:meta_item_1>;

//メタデータから自動的にIItemStackを返す関数 (毎回"meta_item_1"って打つのだるい)
function gregItem (i as int) as IItemStack {
    return <gregtech:meta_item_1>.definition.makeStack(i);
}

//レシピの編集

recipes.remove(gregItem(350));

HiiragiUtils.addCrafting(false, false, <ore:blockGrout>.firstItem, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<ore:dustGrout>}).ingredients);
HiiragiUtils.addCrafting(true, false, <ore:dustGrout>.firstItem * 9, [[<ore:blockGrout>]]);
HiiragiUtils.addCrafting(true, false, <contenttweaker:unfired_seared_brick>*4, [[gregItem(348).reuse(), <ore:blockGrout>]]);

//このscriptの読み込みの完了をログに出力
print("gregtech.zs loaded!");
