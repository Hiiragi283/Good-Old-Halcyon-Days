#======================================================================
# ファイル名 : tool.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : このファイルについて書く
#======================================================================

#priority 90

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading tool.zs ...");

//変数の定義

//作業台レシピの編集
    //削除
        val removeCrafting as IItemStack[] = [];
        for i in removeCrafting {
            HiiragiUtils.removeCrafting(i);
        }

		val removeByName as string[] = [
			"dcs_climate:main_equip/dcs_axe_sapphire_0_2",
			"dcs_climate:main_equip/dcs_pickaxe_sapphire_0_2",
			"dcs_climate:main_equip/dcs_spade_sapphire_0_2",
			"dcs_climate:main_equip/dcs_axe_garnet_0_2",
			"dcs_climate:main_equip/dcs_pickaxe_garnet_0_2",
			"dcs_climate:main_equip/dcs_spade_garnet_0_2",
			"dcs_climate:main_equip/dcs_axe_garnet_0_2",
			"dcs_climate:main_equip/dcs_scythe_garnet_0_2",
		];
		for i in removeByName {
			recipes.removeByRecipeName(i);
		}
    //上書き
		recipes.replaceAllOccurences(<ore:ingotBrass>, <ore:platebrass>, <dcs_climate:dcs_axe_brass>);
		recipes.replaceAllOccurences(<ore:ingotBrass>, <ore:platebrass>, <dcs_climate:dcs_pickaxe_brass>);
		recipes.replaceAllOccurences(<ore:ingotBrass>, <ore:platebrass>, <dcs_climate:dcs_spade_brass>);
		recipes.replaceAllOccurences(<ore:ingotBrass>, <ore:platebrass>, <dcs_climate:dcs_sword_brass>);
		recipes.replaceAllOccurences(<ore:ingotBrass>, <ore:platebrass>, <dcs_climate:dcs_scythe_brass>);
		recipes.replaceAllOccurences(<ore:ingotSteel>, <ore:plateSteel>, <dcs_climate:dcs_axe_steel>);
		recipes.replaceAllOccurences(<ore:ingotSteel>, <ore:plateSteel>, <dcs_climate:dcs_pickaxe_steel>);
		recipes.replaceAllOccurences(<ore:ingotSteel>, <ore:plateSteel>, <dcs_climate:dcs_spade_steel>);
		recipes.replaceAllOccurences(<ore:ingotSteel>, <ore:plateSteel>, <dcs_climate:dcs_sword_steel>);
		recipes.replaceAllOccurences(<ore:ingotSteel>, <ore:plateSteel>, <dcs_climate:dcs_scythe_steel>);
		recipes.replaceAllOccurences(<ore:ingotSilver>, <ore:plateSilver>, <dcs_climate:dcs_axe_silver>);
		recipes.replaceAllOccurences(<ore:ingotSilver>, <ore:plateSilver>, <dcs_climate:dcs_pickaxe_silver>);
		recipes.replaceAllOccurences(<ore:ingotSilver>, <ore:plateSilver>, <dcs_climate:dcs_spade_silver>);
		recipes.replaceAllOccurences(<ore:ingotSilver>, <ore:plateSilver>, <dcs_climate:dcs_sword_silver>);
		recipes.replaceAllOccurences(<ore:ingotNickelsilver>, <ore:plateNickelsilver>, <dcs_climate:dcs_axe_nickelsilver>);
		recipes.replaceAllOccurences(<ore:ingotNickelsilver>, <ore:plateNickelsilver>, <dcs_climate:dcs_pickaxe_nickelsilver>);
		recipes.replaceAllOccurences(<ore:ingotNickelsilver>, <ore:plateNickelsilver>, <dcs_climate:dcs_spade_nickelsilver>);
		recipes.replaceAllOccurences(<ore:ingotNickelsilver>, <ore:plateNickelsilver>, <dcs_climate:dcs_sword_nickelsilver>);
		recipes.replaceAllOccurences(<ore:gemSapphire>, <ore:plateSapphire>, <dcs_climate:dcs_axe_sapphire>);
		recipes.replaceAllOccurences(<ore:gemSapphire>, <ore:plateSapphire>, <dcs_climate:dcs_pickaxe_sapphire>);
		recipes.replaceAllOccurences(<ore:gemSapphire>, <ore:plateSapphire>, <dcs_climate:dcs_spade_sapphire>);
		recipes.replaceAllOccurences(<ore:gemSapphire>, <ore:plateSapphire>, <dcs_climate:dcs_sword_sapphire>);
		recipes.replaceAllOccurences(<dcs_climate:dcs_ingot:11>, <ore:plateTitaniumAlloy>, <dcs_climate:dcs_axe_titanium>);
		recipes.replaceAllOccurences(<dcs_climate:dcs_ingot:11>, <ore:plateTitaniumAlloy>, <dcs_climate:dcs_pickaxe_titanium>);
		recipes.replaceAllOccurences(<dcs_climate:dcs_ingot:11>, <ore:plateTitaniumAlloy>, <dcs_climate:dcs_spade_titanium>);
		recipes.replaceAllOccurences(<dcs_climate:dcs_ingot:11>, <ore:plateTitaniumAlloy>, <dcs_climate:dcs_sword_titanium>);
		recipes.replaceAllOccurences(<ore:ingotSteel>, <ore:stickSteel>, <dcs_climate:dcs_axe_toolsteel>);
		recipes.replaceAllOccurences(<dcs_climate:dcs_ingot:17>, <ore:plateToolSteel>, <dcs_climate:dcs_axe_toolsteel>);
		recipes.replaceAllOccurences(<ore:ingotSteel>, <ore:stickSteel>, <dcs_climate:dcs_pickaxe_toolsteel>);
		recipes.replaceAllOccurences(<dcs_climate:dcs_ingot:17>, <ore:plateToolSteel>, <dcs_climate:dcs_pickaxe_toolsteel>);
		recipes.replaceAllOccurences(<ore:ingotSteel>, <ore:stickSteel>, <dcs_climate:dcs_spade_toolsteel>);
		recipes.replaceAllOccurences(<ore:ingotSteel>, <ore:stickSteel>, <dcs_climate:dcs_sword_toolsteel>);
		recipes.replaceAllOccurences(<ore:ingotSteel>, <ore:stickSteel>, <dcs_climate:dcs_scythe_toolsteel>);
		recipes.replaceAllOccurences(<dcs_climate:dcs_ingot:17>, <ore:plateToolSteel>, <dcs_climate:dcs_scythe_toolsteel>);
		recipes.replaceAllOccurences(<ore:ingotSteel>, <ore:stickSteel>, <dcs_climate:dcs_rake_toolsteel>);
		recipes.replaceAllOccurences(<dcs_climate:dcs_ingot:17>, <ore:plateToolSteel>, <dcs_climate:dcs_rake_toolsteel>);
		recipes.replaceAllOccurences(<ore:ingotSteel>, <ore:stickSteel>, <dcs_climate:dcs_axe_mangalloy>);
		recipes.replaceAllOccurences(<dcs_climate:dcs_ingot:18>, <ore:plateMangalloy>, <dcs_climate:dcs_axe_mangalloy>);
		recipes.replaceAllOccurences(<ore:ingotSteel>, <ore:stickSteel>, <dcs_climate:dcs_pickaxe_mangalloy>);
		recipes.replaceAllOccurences(<dcs_climate:dcs_ingot:18>, <ore:plateMangalloy>, <dcs_climate:dcs_pickaxe_mangalloy>);
		recipes.replaceAllOccurences(<ore:ingotSteel>, <ore:stickSteel>, <dcs_climate:dcs_spade_mangalloy>);
		recipes.replaceAllOccurences(<dcs_climate:dcs_ingot:18>, <ore:plateMangalloy>, <dcs_climate:dcs_spade_mangalloy>);
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
print("tool.zs loaded!");
