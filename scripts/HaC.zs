#====================================================================
# ファイル名 : HaC.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Script for Heat And Climate and its addons
#====================================================================

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
print("Start loading HaC.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
	val removeCrafting as IItemStack[] = [
		<dcs_climate:dcs_device_shaft_l>,
		<dcs_climate:dcs_device_shaft_ta>,
		<dcs_climate:dcs_device_shaft_tb>,
		<dcs_climate:dcs_device_shaft_x>,
		<dcs_climate:dcs_device_shaft_switch>,
		<dcs_climate:dcs_device_shaft_l_steel>,
		<dcs_climate:dcs_device_shaft_ta_steel>,
		<dcs_climate:dcs_device_shaft_tb_steel>,
		<dcs_climate:dcs_device_shaft_x_steel>,
		<dcs_climate:dcs_device_shaft_switch_steel>,
		<dcs_climate:dcs_device_shaft_l_sus>,
		<dcs_climate:dcs_device_shaft_ta_sus>,
		<dcs_climate:dcs_device_shaft_tb_sus>,
		<dcs_climate:dcs_device_shaft_x_sus>,

		<hap:shaft_l_shaped_steel>,
		<hap:shaft_bifurcated_steel>,
		<hap:shaft_perpendicular_steel>,
		<hap:shaft_t_shaped_steel>,
		<hap:shaft_x_shaped_steel>,
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
	HiiragiUtils.addCraftingShaped(true, <dcs_climate:dcs_device_lowchest_wood>, RecipePattern.init(["AAA", "BCB", "AAA"]).map({A:<ore:plankWood>, B:<ore:stickWood>, C:<ore:chest>}).ingredients, null, null);
	//Gypsum Chandelier
	HiiragiUtils.addCraftingShaped(true, <dcs_climate:dcs_build_chandelier>, RecipePattern.init([" A ", "BCB", " B "]).map({A:<dcs_climate:dcs_build_chain:0>, B:<ore:gemGypsum>, C:<dcs_climate:dcs_build_challamp:1>}).ingredients, null, null);
	//Rock Salt Chandelier
	HiiragiUtils.addCraftingShaped(true, <dcs_climate:dcs_build_chandelier:1>, RecipePattern.init([" A ", "BCB", " B "]).map({A:<dcs_climate:dcs_build_chain:2>, B:<ore:gemSalt>, C:<dcs_climate:dcs_build_challamp:1>}).ingredients, null, null);
	//Chacedony Chandelier
	HiiragiUtils.addCraftingShaped(true, <dcs_climate:dcs_build_chandelier:2>, RecipePattern.init([" A ", "BCB", " B "]).map({A:<dcs_climate:dcs_build_chain:1>, B:<ore:gemSalt>, C:<dcs_climate:dcs_build_challamp:2>}).ingredients, null, null);
	//marble Chandelier
	HiiragiUtils.addCraftingShaped(true, <dcs_climate:dcs_build_chandelier:3>, RecipePattern.init([" A ", "BCB", " B "]).map({A:<dcs_climate:dcs_build_chain:0>, B:<ore:stoneMarble>, C:<dcs_climate:dcs_build_challamp:1>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <hap:reactor_advanced>, RecipePattern.init(["ABA", "CDE", "AFA"]).map({A:<ore:ingotTitanium>, B:<hap:compact_heater>, C:<thermaldynamics:duct_16:2>, D:<dcs_climate:dcs_device_reactor>, E:<thermaldynamics:duct_32>, F:<hap:compact_freezer>}).ingredients, null, null);

	HiiragiUtils.addCraftingReplace(<ore:ingotSteel>, <ore:stickHDPE>, <dcs_climate:dcs_sword_toolsteel>);

	HiiragiUtils.addCraftingReplace(<ore:ingotSteel>, <dcs_climate:dcs_ingot:11>, <hap:reactor_fluid_port>);
	HiiragiUtils.addCraftingReplace(<ore:ingotSteel>, <dcs_climate:dcs_ingot:11>, <hap:reactor_storage>);

	//新規
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:dustblock_alubrass>, RecipePattern.init(["AAA", "AAA", "ABB"]).map({A:<ore:dustAluminum>, B:<ore:dustCopper>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:dustblock_electrum>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<ore:dustElectrum>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:dustblock_ardite>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<ore:dustArdite>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:dustblock_cobalt>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<ore:dustCobalt>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:dustblock_constantan>, RecipePattern.init(["AAA", "ABC", "CCC"]).map({A:<ore:dustCopper>, B:<ore:dustCrystal>, C:<ore:dustNickel>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:dustblock_constantan>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<ore:dustConstantan>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:dustblock_electrum>, RecipePattern.init(["AAA", "ABC", "CCC"]).map({A:<ore:dustGold>, B:<ore:dustCrystal>, C:<ore:dustSilver>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:dustblock_invar>, RecipePattern.init(["AAA", "AAA", "BBB"]).map({A:<ore:dustIron>, B:<ore:dustNickel>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:dustblock_invar>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<ore:dustInvar>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:dustblock_iridium>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<ore:dustIridium>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:dustblock_lead>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<ore:dustLead>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:dustblock_manyullyn>, RecipePattern.init(["AAA", "ABC", "CCC"]).map({A:<ore:dustArdite>, B:<ore:dustCrystal>, C:<ore:dustCobalt>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:dustblock_osmium>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<ore:dustOsmium>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:dustblock_platinum>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<ore:dustPlatinum>}).ingredients, null, null);

	HiiragiUtils.addCraftingShaped(false, <dcs_climate:dcs_spade_earth>.withTag({ench: [{lvl: 10 as short, id: 34 as short}, {lvl: 1 as short, id: 33 as short}], display: {LocName: "gohd.custom.spade_of_the_gaia.name"}}), RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<railcraft:jaded_stone>, B:<dcs_climate:dcs_spade_earth:*>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <dcs_climate:dcs_rake_earth>.withTag({ench: [{lvl: 10 as short, id: 34 as short}, {lvl: 1 as short, id: 33 as short}], display: {LocName: "gohd.custom.rake_of_the_gaia.name"}}), RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<railcraft:jaded_stone>, B:<dcs_climate:dcs_rake_earth:*>}).ingredients, null, null);

//AWレシピの編集
	//import
	//新規

//このscriptの読み込みの完了をログに出力
print("HaC.zs loaded!");
