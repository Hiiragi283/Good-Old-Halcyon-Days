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
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:ingot_stable>, [[<ore:ingotIron>], [<contenttweaker:division_sigil_perm>], [<ore:gemDiamond>]], null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:ingot_unstable>, [[<ore:ingotIron>], [HiiragiUtils.toolInput(<contenttweaker:division_sigil_temp>, 1)], [<ore:gemDiamond>]], null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:tome_ancient>, RecipePattern.init(["AAA", "BCC"]).map({A:<dcs_climate:dcs_misc:11>, B:<dcs_climate:dcs_misc:10>, C:<ore:pattern>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:block_shadestone>, RecipePattern.init(["AA", "AA"]).map({A:<contenttweaker:dust_shadestone>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:dustblock_lead>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<ore:dustLead>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:block_bedrockium>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<contenttweaker:ingot_bedrockium>}).ingredients, null, null);
	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:ingot_bedrockium>*9, [<contenttweaker:block_bedrockium>], null, null);

	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:drop_soul>, [<extrautils2:lawsword>.reuse()], null, function(out, info, player) {
		player.health -= 2;
	});

//このscriptの読み込みの完了をログに出力
print("cot-recipes.zs loaded!");
