#====================================================================
# ファイル名 : bibliocraft.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for Bibliocraft
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
print("Start loading bibliocraft.zs ...");

//作業台レシピの編集
	//上書き
	//新規
	HiiragiUtils.addCraftingShaped(false, <bibliocraft:lanterngold:0>, RecipePattern.init([" A ", "BCB", " A "]).map({A:<ore:ingotGold>, B:<ore:paneGlass>, C:<ore:torch>|<ore:dustGlowstone>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <bibliocraft:lanterniron:0>, RecipePattern.init([" A ", "BCB", " A "]).map({A:<ore:ingotIron>, B:<ore:paneGlass>, C:<ore:torch>|<ore:dustGlowstone>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <bibliocraft:lampgold:0>, RecipePattern.init(["ABA", " C ", "DCD"]).map({A:<ore:hardenedClay>, B:<dcs_climate:dcs_build_challamp:*>, C:<ore:ingotGold>, D:<ore:nuggetGold>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <bibliocraft:lampiron:0>, RecipePattern.init(["ABA", " C ", "DCD"]).map({A:<ore:hardenedClay>, B:<dcs_climate:dcs_build_challamp:*>, C:<ore:ingotIron>, D:<ore:nuggetIron>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <bibliocraft:typewriter:0>, RecipePattern.init(["ABA", "CDC", "EEE"]).map({A:<ore:gearBrass>, B:<ore:paper>, C:<ore:ingotIron>, D:<dcs_climate:dcs_desktop_accessories:5>, E:<minecraft:stained_hardened_clay:0>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <bibliocraft:swordpedestal:0>, RecipePattern.init([" A ", "ABA"]).map({A:<minecraft:stone_slab>, B:<minecraft:stained_hardened_clay:0>}).ingredients, null, null);

//このscriptの読み込みの完了をログに出力
print("bibliocraft.zs loaded!");
