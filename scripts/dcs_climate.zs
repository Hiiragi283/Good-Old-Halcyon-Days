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
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import mods.tconstruct.Casting;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading dcs_climate.zs ...");

//変数の定義

//作業台レシピの編集

	//上書き
	//Heat And Climate
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

//このscriptの読み込みの完了をログに出力
print("dcs_climate.zs loaded!");
