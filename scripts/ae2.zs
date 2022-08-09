#====================================================================
# ファイル名 : ae2.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Script for Applied Energistics 2
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.appliedenergistics2.Inscriber;
import mods.ctintegration.util.RecipePattern;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading ae2.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
	val removeCrafting as IItemStack[] = [];
	for i in removeCrafting {
		HiiragiUtils.removeCrafting(i);
		}
	//上書き
	HiiragiUtils.addCraftingShapeless(true, <appliedenergistics2:material>*4, [<appliedenergistics2:quartz_block:0>], null, null);
	//新規
	HiiragiUtils.addCraftingShaped(false, <appliedenergistics2:material:16>, RecipePattern.init([" A ", "BCB", " D "]).map({A:HiiragiUtils.toolInput(<appliedenergistics2:certus_quartz_cutting_knife>, 1), B:<ore:dustRedstone>, C:<ore:crystalPureCertusQuartz>, D:<ore:itemSilicon>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <appliedenergistics2:material:17>, RecipePattern.init([" A ", "BCB", " D "]).map({A:HiiragiUtils.toolInput(<appliedenergistics2:certus_quartz_cutting_knife>, 1), B:<ore:dustRedstone>, C:<ore:gemDiamond>, D:<ore:itemSilicon>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <appliedenergistics2:material:18>, RecipePattern.init([" A ", "BCB", " D "]).map({A:HiiragiUtils.toolInput(<appliedenergistics2:certus_quartz_cutting_knife>, 1), B:<ore:dustRedstone>, C:<ore:ingotGold>, D:<ore:itemSilicon>}).ingredients, null, null);

//AWレシピの編集
	//import
	//新規

//Inscriberのレシピ

//このscriptの読み込みの完了をログに出力
print("ae2.zs loaded!");
