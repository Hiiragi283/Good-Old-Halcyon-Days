#====================================================================
# ファイル名 : storagenetwork.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : このファイルについて書く
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

//各種modからclassをimport
import mods.ctintegration.util.RecipePattern;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading storagenetwork.zs ...");

//作業台レシピの編集
	//上書き
	HiiragiUtils.addCraftingShaped(true, <storagenetwork:inventory>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:ingotBrass>, B:<storagenetwork:kabel>, C:<minecraft:writable_book>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <storagenetwork:remote:3>, [[<storagenetwork:master>], [<ore:gemBismuth>], [<ore:ingotGold>]], null, null);
	HiiragiUtils.addCraftingShapeless(true, <storagenetwork:remote:1>, [<storagenetwork:remote:2>, <ae2wtlib:infinity_booster_card>], null, null);
	HiiragiUtils.addCraftingShapeless(true, <storagenetwork:remote:2>, [<storagenetwork:remote:3>, <ore:workbench>], null, null);
	HiiragiUtils.addCraftingShapeless(true, <storagenetwork:request>, [<storagenetwork:inventory>, <ore:workbench>], null, null);
	//置換
	HiiragiUtils.recipeReplace(<minecraft:quartz_block:0>, <ore:ingotIron>, <storagenetwork:master>);
	HiiragiUtils.recipeReplace(<storagenetwork:remote:0>, <storagenetwork:remote:3>, <storagenetwork:collector_remote>);
	HiiragiUtils.recipeReplace(<storagenetwork:remote:0>, <storagenetwork:remote:3>, <storagenetwork:picker_remote>);

//このscriptの読み込みの完了をログに出力
print("storagenetwork.zs loaded!");
