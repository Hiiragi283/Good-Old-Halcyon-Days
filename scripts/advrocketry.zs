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
	//HiiragiUtils.addCraftingShapeless(true, <advancedrocketry:satelliteidchip>, [<techreborn:part:3>], null, null);
	//HiiragiUtils.addCraftingShapeless(true, <advancedrocketry:carbonscrubbercartridge>, [<techreborn:dynamiccell>, <minecraft:iron_bars>], null, null);

	HiiragiUtils.addCraftingReplace(<libvulpes:productsheet:1>, <ore:plateIron>, null);
	HiiragiUtils.addCraftingReplace(<libvulpes:productsheet:4>, <ore:plateCopper>, null);
	HiiragiUtils.addCraftingReplace(<libvulpes:productsheet:6>, <ore:plateSteel>, null);
	HiiragiUtils.addCraftingReplace(<libvulpes:productsheet:7>, <ore:plateTitanium>, null);
	//HiiragiUtils.addCraftingReplace(<advancedrocketry:ic:3>, <metaitem:circuit.quantum_processor>);
	//HiiragiUtils.addCraftingReplace(<advancedrocketry:ic:4>, <metaitem:robot.arm.hv>);
	//HiiragiUtils.addCraftingReplace(<advancedrocketry:ic:5>, <metaitem:fluid.regulator.hv>);
	//HiiragiUtils.addCraftingReplace(<advancedrocketry:misc:0>, <techreborn:part:24>, null);
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
