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
import mods.tconstruct.Casting;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading dcs_climate.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
		val removeCrafting as IItemStack[] = [
			/*
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
			<hap:shaft_x_shaped_sus>,*/
			<dcs_climate:dcs_device_pail>,
		];
		for i in removeCrafting {
			HiiragiUtils.removeCrafting(i);
		}
	//上書き
		HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_chamber>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<minecraft:blaze_rod>, B:<tconstruct:seared:*>, C:<dcs_climate:dcs_cont_log:6>}).ingredients);
		HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_bellow>, RecipePattern.init(["ABA", "BCD", "ABA"]).map({A:<ore:ingotIron>, B:<ore:itemLeather>, C:<ore:gearWood>, D:<ore:craftingPiston>}).ingredients);
		//Brass Shafts
			HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_shaft_l>*8, RecipePattern.init([" A", "AB"]).map({A:<ore:ingotBrass>, B:<ore:gearBrass>}).ingredients);
			HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_shaft_ta>*8, RecipePattern.init([" A", "AB", " A"]).map({A:<ore:ingotBrass>, B:<ore:gearBrass>}).ingredients);
			HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_shaft_tb>*8, RecipePattern.init([" A ", "ABA"]).map({A:<ore:ingotBrass>, B:<ore:gearBrass>}).ingredients);
			HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_shaft_x>*8, RecipePattern.init(["  A ", "ABA", " A "]).map({A:<ore:ingotBrass>, B:<ore:gearBrass>}).ingredients);
		//Steel Shaft
			HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_shaft_l_steel>*8, RecipePattern.init([" A", "AB"]).map({A:<ore:ingotSteel>, B:<ore:gearSteel>}).ingredients);
			HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_shaft_ta_steel>*8, RecipePattern.init([" A", "AB", " A"]).map({A:<ore:ingotSteel>, B:<ore:gearSteel>}).ingredients);
			HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_shaft_tb_steel>*8, RecipePattern.init([" A ", "ABA"]).map({A:<ore:ingotSteel>, B:<ore:gearSteel>}).ingredients);
			HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_shaft_x_steel>*8, RecipePattern.init(["  A ", "ABA", " A "]).map({A:<ore:ingotSteel>, B:<ore:gearSteel>}).ingredients);
		//Stainless Shaft
			HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_shaft_l_sus>*8, RecipePattern.init([" A", "AB"]).map({A:<ore:ingotSUS>, B:<ore:gearToolsteel>}).ingredients);
			HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_shaft_ta_sus>*8, RecipePattern.init([" A", "AB", " A"]).map({A:<ore:ingotSUS>, B:<ore:gearToolSteel>}).ingredients);
			HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_shaft_tb_sus>*8, RecipePattern.init([" A ", "ABA"]).map({A:<ore:ingotSUS>, B:<ore:gearToolSteel>}).ingredients);
			HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_shaft_x_sus>*8, RecipePattern.init(["  A ", "ABA", " A "]).map({A:<ore:ingotSUS>, B:<ore:gearToolSteel>}).ingredients);
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

//Castingレシピの追加
	mods.tconstruct.Casting.addBasinRecipe(<dcs_climate:dcs_device_pail>, <minecraft:bucket>, <liquid:molten_tin>, 288, true);

//このscriptの読み込みの完了をログに出力
print("dcs_climate.zs loaded!");
