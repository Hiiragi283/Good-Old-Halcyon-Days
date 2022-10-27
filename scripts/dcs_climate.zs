#====================================================================
# ファイル名 : dcs_climate.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for Heat And Climate and its addons
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

//各種modからclassをimport
import mods.ctintegration.util.RecipePattern;
import mods.tconstruct.Casting;

//scriptのimport
import scripts.HiiragiUtils;
import scripts.jei;

//このscriptの読み込みの開始をログに出力
print("Start loading dcs_climate.zs ...");

//変数の定義

//作業台レシピの編集

	//上書き
	//Heat And Climate
	HiiragiUtils.addCraftingShaped(true, <dcs_climate:dcs_device_chamber>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<minecraft:blaze_rod>, B:<ore:dustRedstone>, C:<minecraft:furnace>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <dcs_climate:dcs_device_lowchest_wood>, RecipePattern.init(["AAA", "BCB", "AAA"]).map({A:<ore:plankWood>, B:<ore:stickWood>, C:<ore:chest>}).ingredients, null, null);
	HiiragiUtils.recipeReplace(<ore:ingotSteel>, <ore:stickHDPE>, <dcs_climate:dcs_sword_toolsteel>);
	//Heat And Processing
	HiiragiUtils.addCraftingShaped(true, <hap:reactor_advanced>, [
		[<thermaldynamics:duct_32>, <hap:compact_freezer>, <hap:compact_heater>],
		[<thermaldynamics:duct_16:2>, <dcs_climate:dcs_device_reactor>, <ore:ingotStainlessSteel>],
		[<ore:ingotTitaniumAlloy>, <ore:gearDark>, <ore:ingotTitaniumAlloy>]], null, null);
	HiiragiUtils.addCraftingShaped(true, <hap:reactor_fluid_port>, RecipePattern.init(["AAA", " B ", "CCC"]).map({A:<ore:gemSlate>, B:<thermalexpansion:device:6>, C:<ore:ingotStainlessSteel>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <hap:reactor_storage>, RecipePattern.init(["AAA", " B ", "CCC"]).map({A:<ore:ingotCobalt>, B:<thermalexpansion:device:5>, C:<ore:ingotStainlessSteel>}).ingredients, null, null);

	//新規
	HiiragiUtils.addCraftingShaped(false, <dcs_climate:dcs_device_creative_box>, RecipePattern.init(["ABA", "ACA", "DDD"]).map({A:<dcs_climate:dcs_mechanical:5>, B:<dcs_climate:dcs_magic_card_m>, C:<extendedcrafting:singularity_ultimate>.reuse(), D:<ore:ingotBedrockium>}).ingredients, null, null);

//このscriptの読み込みの完了をログに出力
print("dcs_climate.zs loaded!");
