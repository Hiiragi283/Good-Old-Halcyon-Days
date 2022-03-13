#======================================================================
# name : gregtech.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Scripts for GregTech Community Ediiton Unofficial
#======================================================================

#priority 0

#crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

#各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import mods.gregtech.recipe.RecipeMap;

#scriptのimport
import scripts.HiiragiUtils;

#このscriptの読み込みの開始をログに出力
print("Start loading gregtech.zs ...");

#変数の登録

#作業台レシピの編集
##削除
val removeCrafting as IItemStack[] = [
    HiiragiUtils.gregItem(350),
    <gregtech:metal_casing:1>,
    <gregtech:metal_casing:8>
];
for i in removeCrafting {
    HiiragiUtils.removeCrafting(i);
}
##上書き
HiiragiUtils.addCrafting(true, true, HiiragiUtils.gregItem(347), [[<ore:slabWood>, <ore:GT.tool.saw>]]);
HiiragiUtils.addCrafting(true, false, HiiragiUtils.gregItem(347), [[<ore:slabWood>, <artisanworktables:artisans_handsaw_flint>.anyDamage().transformDamage()]]);
##新規
HiiragiUtils.addCraftingConv(<tconstruct:pattern>, HiiragiUtils.gregItem(347));

#かまどレシピの編集
##削除
val removeFurnace as IItemStack[] = [
    HiiragiUtils.gregItem(350)
];
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

#このscriptの読み込みの完了をログに出力
print("gregtech.zs loaded!");
