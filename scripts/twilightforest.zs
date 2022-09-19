#====================================================================
# ファイル名 : twilightforest.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for Twilight Forest
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
print("Start loading twilightforest.zs ...");

//作業台レシピの編集
	//上書き
	//新規
	HiiragiUtils.addCraftingShaped(false, <twilightforest:castle_door:0>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:dustVoid>, B:<appliedenergistics2:paint_ball:24>, C:<botania:quartztypedark:1>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <twilightforest:castle_door:1>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:dustVoid>, B:<appliedenergistics2:paint_ball:30>, C:<botania:quartztypedark:1>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <twilightforest:castle_door:2>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:dustVoid>, B:<appliedenergistics2:paint_ball:22>, C:<botania:quartztypedark:1>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <twilightforest:castle_door:3>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:dustVoid>, B:<appliedenergistics2:paint_ball:29>, C:<botania:quartztypedark:1>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <twilightforest:trophy_pedestal>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:ingotSteeleaf>, B:<twilightforest:trophy:*>, C:<twilightforest:stone_twist_thin>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <twilightforest:root>, RecipePattern.init(["AA", "AA"]).map({A:<twilightforest:twilight_plant:8>|<biomesoplenty:plant_1:9>}).ingredients, null, null);
	//置換
	HiiragiUtils.recipeReplace(<twilightforest:maze_map_focus>, <contenttweaker:ragi_ticket>, <twilightforest:uncrafting_table>);

//このscriptの読み込みの完了をログに出力
print("twilightforest.zs loaded!");
