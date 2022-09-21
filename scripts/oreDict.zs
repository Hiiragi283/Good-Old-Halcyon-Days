#====================================================================
# ファイル名 : oreDict.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for tweaking Ore Dictionary
#====================================================================

#priority 97

//crafttweakerからclassをimport
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading oreDict.zs ...");

//鉱石辞書の編集
	HiiragiUtils.tweakOreDict(<dcs_climate:dcs_gem_layer:4>, [<ore:all>], []);
	HiiragiUtils.tweakOreDict(<dcs_climate:dcs_synthetic:2>, [<ore:all>], []);

	HiiragiUtils.tweakOreDict(<biomesoplenty:filled_honeycomb>, [<ore:dropHoney>], []);
	HiiragiUtils.tweakOreDict(<dcs_climate:dcs_fooddust:7>, [<ore:dustWood>], []);

	HiiragiUtils.tweakOreDict(<dcs_climate:dcs_ore_metal_alloy:2>, [<ore:all>], [<ore:blockWroughtIron>]);

	HiiragiUtils.tweakOreDict(<botania:manaresource:2>, [], [<ore:gemManaDiamond>]);
	HiiragiUtils.tweakOreDict(<botania:manaresource:9>, [], [<ore:gemDragonStone>]);
	HiiragiUtils.tweakOreDict(<botania:manaresource:22>, [], [<ore:itemCloth>]);
	//HiiragiUtils.tweakOreDict(<botania:manaresource:22>, [], [<ore:itemMagicCloth>]);
	//HiiragiUtils.tweakOreDict(<botania:manaresource:7>, [], [<ore:ingotElementium>]);
	HiiragiUtils.tweakOreDict(<botania:manaresource:19>, [], [<ore:nuggetElvenElementium>]);
	HiiragiUtils.tweakOreDict(<botania:storage:0>, [], [<ore:blockManasteel>]);
	HiiragiUtils.tweakOreDict(<botania:storage:1>, [], [<ore:blockTerrasteel>]);
	HiiragiUtils.tweakOreDict(<botania:storage:2>, [], [<ore:blockElvenElementium>]);
	HiiragiUtils.tweakOreDict(<botania:storage:3>, [], [<ore:blockManaDiamond>]);
	HiiragiUtils.tweakOreDict(<botania:storage:4>, [], [<ore:blockDragonstone>]);
	HiiragiUtils.tweakOreDict(<botanicadds:mana_lapis>, [], [<ore:gemManalapis>]);
	HiiragiUtils.tweakOreDict(<botanicadds:elven_lapis>, [], [<ore:gemElvenlapis>]);
	HiiragiUtils.tweakOreDict(<botanicadds:mana_lapis_block>, [], [<ore:blockManalapis>]);
	HiiragiUtils.tweakOreDict(<botanicadds:elven_lapis_block>, [], [<ore:blockElvenlapis>]);
	HiiragiUtils.tweakOreDict(<contenttweaker:reagent_halogen>, [], [<ore:dustHalogen>]);
	HiiragiUtils.tweakOreDict(<contenttweaker:block_bedrockium>, [], [<ore:blockBedrockium>]);
	HiiragiUtils.tweakOreDict(<contenttweaker:ingot_bedrockium>, [], [<ore:ingotBedrockium>]);
	HiiragiUtils.tweakOreDict(<contenttweaker:ingot_stable>, [], [<ore:ingotStable>, <ore:ingotUnstable>]);
	HiiragiUtils.tweakOreDict(<contenttweaker:ingot_unstable>, [], [<ore:ingotUnstable>]);
	HiiragiUtils.tweakOreDict(<contenttweaker:cube_cyan>, [], [<ore:cubeCyan>]);
	HiiragiUtils.tweakOreDict(<contenttweaker:cube_magenta>, [], [<ore:cubeMagenta>]);
	HiiragiUtils.tweakOreDict(<contenttweaker:cube_yellow>, [], [<ore:cubeYellow>]);
	HiiragiUtils.tweakOreDict(<contenttweaker:pumpkin_melon>, [], [<ore:listAllveggie>]);
	HiiragiUtils.tweakOreDict(<dcs_climate:dcs_miscdust:3>, [], [<ore:dustSawDust>]);
	HiiragiUtils.tweakOreDict(<dcs_climate:dcs_ore_gemblock:10>, [], [<ore:blockPeridot>]);
	HiiragiUtils.tweakOreDict(<dcs_climate:dcs_synthetic:2>, [], [<ore:blockGlassHardened>, <ore:fusedQuartz>]);
	HiiragiUtils.tweakOreDict(<extendedcrafting:material:2>, [], [<ore:plateBlackIron>]);
	HiiragiUtils.tweakOreDict(<railcraft:generic:6>, [], [<ore:blockFuelCoke>]);
	HiiragiUtils.tweakOreDict(<thermalfoundation:storage_resource:1>, [], [<ore:blockCoke>]);
	HiiragiUtils.tweakOreDict(<thermalfoundation:material:832>, [], [<ore:dropRosin>]);
	HiiragiUtils.tweakOreDict(<thermalfoundation:material:833>, [], [<ore:dropCoaltar>]);
	HiiragiUtils.tweakOreDict(<thermalfoundation:material:864>, [], [<ore:gemSlag>]);
	HiiragiUtils.tweakOreDict(<twilightforest:block_storage:0>, [], [<ore:blockIronwood>]);

//このscriptの読み込みの完了をログに出力
print("oreDict.zs loaded!");
