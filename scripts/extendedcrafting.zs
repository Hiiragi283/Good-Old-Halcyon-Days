#====================================================================
# ファイル名 : extendedcrafting.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for Extended Crafting
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

//各種modからclassをimport
import mods.ctintegration.util.RecipePattern;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading extendedcrafting.zs ...");

//作業台レシピの編集
	//上書き
	HiiragiUtils.addCraftingShaped(true, <extendedcrafting:material:7>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:ingotRefinedGlowstone>, B:<enderio:block_holier_fog>, C:<ore:itemGrindingBallLumium>}).ingredients, null, null);
	//新規

//Ender Craftingレシピの編集
mods.extendedcrafting.EnderCrafting.addShaped(<minecraft:nether_star>, RecipePattern.init(["AAA", "BBB", "CBD"]).map({A:<minecraft:skull:1>, B:<minecraft:soul_sand>, C:<minecraft:diamond_sword>, D:<minecraft:bow>}).ingredients, 500);

//このscriptの読み込みの完了をログに出力
print("extendedcrafting.zs loaded!");
