#====================================================================
# ファイル名 : enderio.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : このファイルについて書く
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
print("Start loading enderio.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
		val removeCrafting as IItemStack[] = [
			<enderio:item_material:11>,
			<enderio:item_material:12>,
			<enderio:item_material:13>,
			<enderio:item_material:14>,
			<enderio:item_material:15>,
		];
		for i in removeCrafting {
			HiiragiUtils.removeCrafting(i);
		}
	//上書き
		HiiragiUtils.addCraftingShaped(true, <enderio:item_material:0>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:ingotSteel>, B:<minecraft:iron_bars>, C:<ore:gearIronInfinity>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <enderio:item_material:1>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:ingotDarkSteel>, B:<enderio:block_dark_iron_bars>, C:<ore:gearDark>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <enderio:item_material:66>, RecipePattern.init(["ABA", "BCB", "ABA"]).map({A:<ore:ingotEndSteel>, B:<enderio:block_end_iron_bars>, C:<ore:gearVibrant>}).ingredients, null, null);
		HiiragiUtils.addCraftingShapeless(true, <enderio:item_material:38>*3, [<ore:itemSilicon>, <ore:dustBismuth>, <ore:dustBedrock>], null, null);
		HiiragiUtils.addCraftingShaped(true, <enderio:item_material:51>, RecipePattern.init(["ABA", "CDC", "ABA"]).map({A:<enderio:item_material:50>, B:<ore:dustNetherQuartz>, C:<ore:dyeGray>, D:<dcs_climate:dcs_coating_tool:8>}).ingredients, null, null);
	//新規

//かまどレシピの編集
	//削除
		val removeFurnace as IItemStack[] = [];
		for i in removeFurnace {
			HiiragiUtils.removeFurnace(i);
		}
	//新規
		val addFurnace as IIngredient[IItemStack] = {};
		for output, input in addFurnace {
			HiiragiUtils.addFurnace(false, output, input);
		}

//AWレシピの編集
	//import
	//新規

//このscriptの読み込みの完了をログに出力
print("enderio.zs loaded!");
