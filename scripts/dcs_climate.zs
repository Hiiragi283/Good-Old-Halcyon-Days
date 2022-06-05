#======================================================================
# ファイル名 : dcs_climate.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : このファイルについて書く
#======================================================================

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
print("Start loading dcs_climate.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
		val removeCrafting as IItemStack[] = [
			<dcs_climate:dcs_device_shaft_s>,
			<dcs_climate:dcs_device_shaft_l>,
			<dcs_climate:dcs_device_shaft_ta>,
			<dcs_climate:dcs_device_shaft_tb>,
			<dcs_climate:dcs_device_shaft_x>,
			<dcs_climate:dcs_device_handcrank>,
			<dcs_climate:dcs_device_shaft_s_steel>,
			<dcs_climate:dcs_device_shaft_l_steel>,
			<dcs_climate:dcs_device_shaft_ta_steel>,
			<dcs_climate:dcs_device_shaft_tb_steel>,
			<dcs_climate:dcs_device_shaft_x_steel>,
			<dcs_climate:dcs_device_shaft_s_sus>,
			<dcs_climate:dcs_device_shaft_l_sus>,
			<dcs_climate:dcs_device_shaft_ta_sus>,
			<dcs_climate:dcs_device_shaft_tb_sus>,
			<dcs_climate:dcs_device_shaft_x_sus>,
			<hap:shaft_straight_steel>,
			<hap:shaft_l_shaped_steel>,
			<hap:shaft_bifurcated_steel>,
			<hap:shaft_perpendicular_steel>,
			<hap:shaft_t_shaped_steel>,
			<hap:shaft_x_shaped_steel>,
			<hap:shaft_straight_sus>,
			<hap:shaft_l_shaped_sus>,
			<hap:shaft_bifurcated_sus>,
			<hap:shaft_perpendicular_sus>,
			<hap:shaft_t_shaped_sus>,
			<hap:shaft_x_shaped_sus>,
		];
		for i in removeCrafting {
			HiiragiUtils.removeCrafting(i);
		}
	//上書き
		HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_chamber>, RecipePattern.init(["AAA", "ABA", "ACA"]).map({A:<tconstruct:seared:0>, B:<minecraft:blaze_rod>, C:<dcs_climate:dcs_cont_log:6>}).ingredients);
	//新規

//かまどレシピの編集
	//削除
		val removeFurnace as IItemStack[] = [];
		for i in removeFurnace {
			HiiragiUtils.removeFurnace(i);
		}
	//新規
		val addFurnace as IIngredient[IItemStack] = {};
		for output, input in addFurnace {
			HiiragiUtils.addFurnace(false, output, input);
		}

//AWレシピの編集
	//import
	//新規

//このscriptの読み込みの完了をログに出力
print("dcs_climate.zs loaded!");
