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
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:assembly_parallel>, RecipePattern.init([" A ", "BCB", " D "]).map({A:HiiragiUtils.toolInput(<appliedenergistics2:certus_quartz_cutting_knife>, 1), B:<ore:dustRedstone>, C:<threng:material:5>, D:<ore:itemSilicon>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:assembly_speculative>, RecipePattern.init([" A ", "BCB", " D "]).map({A:HiiragiUtils.toolInput(<appliedenergistics2:certus_quartz_cutting_knife>, 1), B:<ore:dustRedstone>, C:<threng:material:13>, D:<ore:itemSilicon>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:block_bedrockium>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<contenttweaker:ingot_bedrockium>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:block_shadestone>, RecipePattern.init(["AA", "AA"]).map({A:<contenttweaker:dust_shadestone>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:cube_cyan>, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<minecraft:ghast_tear>, B:<contenttweaker:cube_cyan_inactive>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:cube_iridescent>, [[<ore:cubeMagenta>, <ore:cubeWhite>, <ore:cubeRed>], [<ore:cubeBlue>, <minecraft:nether_star>, <ore:cubeYellow>], [<ore:cubeCyan>, <ore:cubeBlack>, <ore:cubeGreen>]], null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:cube_magenta>, RecipePattern.init(["ABA", "ACA", "ABA"]).map({A:<dcs_climate:dcs_gem_blue:2>, B:<extrautils2:ingredients:5>, C:<contenttweaker:cube_magenta_inactive>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:cube_yellow>, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<twilightforest:torchberries>, B:<contenttweaker:cube_yellow_inactive>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:dcs_color_ring2>, [[<ore:dustCrystal>], [<ore:dropBlue>], [<ore:ingotGold>]], null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:dust_shadestone>*8, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<ore:dustGlowstone>, B:<ore:itemDarkMatter>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:dustblock_lead>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<ore:dustLead>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:ingot_stable>, [[<ore:ingotIron>], [<contenttweaker:division_sigil_perm>], [<ore:gemDiamond>]], null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:ingot_unstable>, [[<ore:ingotIron>], [HiiragiUtils.toolInput(<contenttweaker:division_sigil_temp>, 1)], [<ore:gemDiamond>]], null, null);
	HiiragiUtils.addCraftingShaped(false, <contenttweaker:tome_ancient>, RecipePattern.init(["AAA", "BCC"]).map({A:<dcs_climate:dcs_misc:11>, B:<dcs_climate:dcs_misc:10>, C:<ore:pattern>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <contenttweaker:ingot_bedrockium>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:compressed3xCobblestone>, B:<ore:compressed4xCobblestone>, C:<ore:blockDiamond>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <contenttweaker:pumpkin_melon>, RecipePattern.init(["AAA", "BAC", "AAA"]).map({A:<ore:listAllseeds>, B:<minecraft:pumpkin>, C:<minecraft:melon_block>}).ingredients, null, null);
	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:cube_cyan>, [<ore:blockElestial>, <ore:gemManaDiamond>, <ore:itemPulsatingPowder>], HiiragiUtils.rainCheck(<contenttweaker:cube_cyan_inactive>), null);
	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:cube_magenta>, [<ore:blockElestial>, <ore:gemDragonStone>, <threng:material:1>], HiiragiUtils.nightCheck(<contenttweaker:cube_magenta_inactive>), null);
	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:cube_yellow>, [<ore:blockElestial>, <extrautils2:suncrystal:0>, <ore:dustLumium>],HiiragiUtils.dimCheck(7, <contenttweaker:cube_yellow_inactive>),null);
	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:feather_black>, [<minecraft:feather>, <botania:dye:15>, <botania:dye:15>, <botania:dye:15>], null, null);
	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:ingot_bedrockium>*9, [<contenttweaker:block_bedrockium>], null, null);
	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:nether_grout>, [<contenttweaker:unfired_scorched_channel>], null, null);
	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:nether_grout>*2, [<biomesoplenty:mudball>, <railcraft:generic:7>, <minecraft:soul_sand>], null, null);
	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:quantum_entangler>, [<compactmachines3:psd>, <minecraft:nether_star>], null, null);
	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:unfired_casting_basin>, [<contenttweaker:unfired_casting_table>], null, null);
	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:unfired_casting_channel>, [<contenttweaker:unfired_casting_basin>], null, null);
	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:unfired_casting_table>, [<tconstruct:soil>], null, null);
	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:unfired_scorched_basin>, [<contenttweaker:unfired_scorched_table>], null, null);
	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:unfired_scorched_channel>, [<contenttweaker:unfired_scorched_basin>], null, null);
	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:unfired_scorched_table>, [<contenttweaker:nether_grout>], null, null);

	HiiragiUtils.addCraftingShapeless(false, <contenttweaker:drop_soul>, [<extrautils2:lawsword>.reuse()], null, function(out, info, player) {
		player.health -= 2;
	});

//このscriptの読み込みの完了をログに出力
print("cot-recipes.zs loaded!");
