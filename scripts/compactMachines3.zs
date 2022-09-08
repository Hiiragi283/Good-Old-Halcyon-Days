#====================================================================
# ファイル名 : compactMachines3.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for Compact Machines 3
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading compactMachines3.zs ...");

//作業台レシピの編集
	//上書き
	HiiragiUtils.addCraftingShaped(true, <compactmachines3:fieldprojector>*4, RecipePattern.init([" A ", " B ", "CCC"]).map({A:<compactmachines3:psd>.reuse(), B:<appliedenergistics2:material:47>, C:<appliedenergistics2:smooth_sky_stone_block>}).ingredients, null, null);
	//新規
		//Compact Machineのコピーレシピ
		HiiragiUtils.addCraftingShapeless(false, <contenttweaker:quantum_entangler>, [<compactmachines3:psd>, <minecraft:nether_star>], null, null);
		for i in 0 to 6 {
			var machine = <compactmachines3:machine>.definition.makeStack(i);
			HiiragiUtils.addCraftingShapeless(false, machine*2, [machine.marked("move"), <contenttweaker:quantum_entangler>.reuse(), machine], HiiragiUtils.moveNBT(machine), null);
		}

//このscriptの読み込みの完了をログに出力
print("compactMachines3.zs loaded!");
