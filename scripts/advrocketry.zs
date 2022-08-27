#====================================================================
# ファイル名 : advrocktery.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for Advanced Rocktery
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading advrocktery.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
	val removeCrafting as IItemStack[] = [
		<advancedrocketry:misc:1>,
		<advancedrocketry:sawbladeiron>
	];
	for i in removeCrafting {
		HiiragiUtils.removeCrafting(i);
	}
	//上書き
	//新規

//AWレシピの編集
	//import
	//新規
	RecipeBuilder.get("basic")
		.setShapeless([<ore:blockQuartz>])
		.addTool(<ore:GT.tool.hammer.hard>, 1)
		.addTool(<chisel:chisel_iron>, 1)
		.addOutput(<advancedrocketry:iquartzcrucible>)
		.create();

//このscriptの読み込みの完了をログに出力
print("advrocktery.zs loaded!");
