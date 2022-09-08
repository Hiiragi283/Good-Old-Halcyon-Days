#====================================================================
# ファイル名 : cot-recipes.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for Content Tweaker
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
print("Start loading cot-recipes.zs ...");

//作業台レシピの編集
	//上書き
	//新規
	recipes.addShaped(<contenttweaker:ingot_stable>, [[<ore:ingotEnchantedMetal>], [<contenttweaker:division_sigil_perm>], [<ore:gemMoon>]]);
	recipes.addShaped(<contenttweaker:ingot_unstable>, [[<ore:ingotEnchantedMetal>], [HiiragiUtils.toolInput(<contenttweaker:division_sigil_temp>, 1)], [<ore:gemMoon>]]);
	recipes.addShaped(<contenttweaker:tome_ancient>, RecipePattern.init(["AAA", "BCC"]).map({A:<dcs_climate:dcs_misc:11>, B:<dcs_climate:dcs_misc:10>, C:<ore:pattern>}).ingredients);

//このscriptの読み込みの完了をログに出力
print("cot-recipes.zs loaded!");
