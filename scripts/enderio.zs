#====================================================================
# ファイル名 : enderio.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for Ender IO and its addons
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

//各種modからclassをimport
import mods.ctintegration.util.RecipePattern;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading enderio.zs ...");

//変数の定義

//作業台レシピの編集
	//上書き
	HiiragiUtils.addCraftingShaped(true, <enderio:item_material:0>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:ingotSteel>, B:<minecraft:iron_bars>, C:<ore:gearIronInfinity>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <enderio:item_material:1>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:ingotDarkSteel>, B:<enderio:block_dark_iron_bars>, C:<ore:gearDark>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <enderio:item_material:51>, RecipePattern.init(["ABA", "CDC", "ABA"]).map({A:<dcs_climate:dcs_reagent:7>, B:<ore:dustNetherQuartz>, C:<ore:dyeGray>, D:<dcs_climate:dcs_coating_tool:8>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <enderio:item_material:66>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:ingotEndSteel>, B:<enderio:block_end_iron_bars>, C:<ore:gearVibrant>}).ingredients, null, null);
	HiiragiUtils.addCraftingShapeless(true, <enderio:block_buffer:0>, [<ore:chest>, <ore:itemChassiParts>], null, null);
	HiiragiUtils.addCraftingShapeless(true, <enderio:block_buffer:1>, [<enderio:item_basic_capacitor:0>, <ore:itemChassiParts>], null, null);
	HiiragiUtils.addCraftingShapeless(true, <enderio:item_material:38>*3, [<ore:itemSilicon>, <ore:dustBismuth>, <ore:dustBedrock>], null, null);
	//新規

//このscriptの読み込みの完了をログに出力
print("enderio.zs loaded!");
