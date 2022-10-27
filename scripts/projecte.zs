#====================================================================
# ファイル名 : projecte.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for ProjectE and its addon
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

//各種modからclassをimport
import mods.ctintegration.projecte.EMCManager;
import mods.ctintegration.util.RecipePattern;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading projecte.zs ...");

//作業台レシピの編集
recipes.removeByMod("projectex");
	//新規
	HiiragiUtils.addCraftingShaped(false, <projectex:energy_link>, RecipePattern.init(["ABA", "CDC", "ABA"]).map({A:<ore:ingotBedrockium>, B:<ore:blockDarkMatter>, C:<contenttweaker:drop_soul>, D:<projecte:transmutation_table>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <projectex:personal_link>, RecipePattern.init(["ABA", "BCB", "ADA"]).map({A:<ore:blockDarkMatter>, B:<ore:hopper>, C:<projecte:condenser_mk2>, D:<dcs_climate:dcs_device_hopper_filter>}).ingredients, null, null);
	HiiragiUtils.addCraftingShapeless(false, <projecte:item.pe_tome>, [<thermalfoundation:tome_experience>, <extendedcrafting:singularity_ultimate>.reuse()], null, null);
	HiiragiUtils.addCraftingShapeless(false, <projectex:arcane_tablet>, [<projecte:item.pe_transmutation_tablet>, <projecte:item.pe_klein_star:5>, <tconstruct:tooltables>], null, null);
	HiiragiUtils.addCraftingShapeless(false, <projectex:refined_link>, [<projectex:personal_link>, <appliedenergistics2:interface>, <ore:itemRedMatter>], null, null);

	HiiragiUtils.addCraftingConv(<projecte:collector_mk3>, <contenttweaker:dummy_collector>);
	HiiragiUtils.addCraftingConv(<projecte:relay_mk3>, <contenttweaker:dummy_relay>);
	HiiragiUtils.addCraftingConv(<projectex:energy_link>, <contenttweaker:dummy_link>);

	//置換
	HiiragiUtils.recipeReplace(<ore:obsidian>, <contenttweaker:block_shadestone>, <projecte:relay_mk1>);
	HiiragiUtils.recipeReplace(<ore:obsidian>, <contenttweaker:block_shadestone>, <projecte:relay_mk2>);
	HiiragiUtils.recipeReplace(<ore:obsidian>, <contenttweaker:block_shadestone>, <projecte:relay_mk3>);

//EMCの編集
	//EMCの読み込み
	EMCManager.mapEMC();
	//EMCの削除
	val removeEMC as IItemStack[] = [];
	for i in removeEMC {
		EMCManager.setEMC(i, 0);
	}
	for i in loadedMods["projectex"].items {
		i.emc = 0;
	}
	EMCManager.mapEMC();
	//EMCの追加
	val mapEMC as long[IItemStack] = {};
	for i, j in mapEMC {
		EMCManager.setEMC(i, j);
	}

//このscriptの読み込みの完了をログに出力
print("projecte.zs loaded!");
