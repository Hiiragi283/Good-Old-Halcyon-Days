#====================================================================
# ファイル名 : ezStorage.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for EZ Storage
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
print("Start loading ezStorage.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
	val removeCrafting as IItemStack[] = [];
	for i in removeCrafting {
		HiiragiUtils.removeCrafting(i);
	}
	//上書き
	//新規
		HiiragiUtils.addCraftingShaped(true, <ezstorage:blank_box>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:logWood>, B:<ore:plankWood>, C:<ore:gearWood>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <ezstorage:storage_core>, RecipePattern.init([" A ", "ABA", " A "]).map({A:<contenttweaker:ticket_common>, B:<ezstorage:blank_box>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <ezstorage:condensed_storage_box>, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<ezstorage:storage_box>, B:<ore:blockIron>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <ezstorage:super_storage_box>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A: <ore:blockBrass>,B:<ezstorage:condensed_storage_box>, C:<ore:gearBrass>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <ezstorage:ultra_storage_box>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A: <ore:blockNickelsilver>,B:<ezstorage:super_storage_box>, C:<ore:gearNickelsilver>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <ezstorage:hyper_storage_box>, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<ezstorage:ultra_storage_box>, B:<ore:blockStainlessSteel>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <ezstorage:input_port>, RecipePattern.init(["A", "B"]).map({A:<minecraft:hopper>, B:<ezstorage:blank_box>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <ezstorage:output_port>, RecipePattern.init(["A", "B"]).map({A:<minecraft:dropper>, B:<ezstorage:blank_box>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <ezstorage:extract_port>, RecipePattern.init(["B", "A"]).map({A:<minecraft:hopper>, B:<ezstorage:blank_box>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <ezstorage:crafting_box>, RecipePattern.init(["AB"]).map({A:<tconstruct:tooltables:0>, B:<ezstorage:blank_box>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <ezstorage:search_box>, RecipePattern.init(["AB"]).map({A:<railcraft:tool_magnifying_glass>, B:<ezstorage:blank_box>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <ezstorage:sort_box>, RecipePattern.init(["AB"]).map({A:<ore:bookshelf>, B:<ezstorage:blank_box>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <ezstorage:access_terminal>, RecipePattern.init(["ABA"]).map({A:<ore:pearlEnderEye>, B:<ezstorage:storage_core>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <ezstorage:security_box>, RecipePattern.init(["AB"]).map({A:<ezstorage:key>, B:<ezstorage:blank_box>}).ingredients, null, null);

//AWレシピの編集
	//新規

//このscriptの読み込みの完了をログに出力
print("ezStorage.zs loaded!");
