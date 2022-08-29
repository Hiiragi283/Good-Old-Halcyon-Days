#====================================================================
# ファイル名 : oreDict.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for tweaking Ore Dictionary
#====================================================================

#priority 98

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading oreDict.zs ...");

//鉱石辞書の削除
	<ore:dropHoney>.remove(<biomesoplenty:filled_honeycomb>);

	<ore:dustWood>.remove(<dcs_climate:dcs_fooddust:7>);

	<ore:dye>.remove([<minecraft:dye:0>, <minecraft:dye:3>, <minecraft:dye:4>, <minecraft:dye:15>]);
	//<ore:dyeBlack>.remove(<minecraft:dye:0>); //Printing press can't copy books without ink sak
	<ore:dyeBrown>.remove(<minecraft:dye:3>);
	<ore:dyeBlue>.remove(<minecraft:dye:4>);
	<ore:dyeWhite>.remove(<minecraft:dye:15>);

	<ore:blockWarpCoreCore>.remove(<minecraft:gold_block>);
	<ore:blockWarpCoreRim>.remove(<libvulpes:metal0:7>);

	HiiragiUtils.removeOreDict(<dcs_climate:dcs_gem_layer:4>);
	HiiragiUtils.removeOreDict(<dcs_climate:dcs_synthetic:2>);

	val removeLibVulpes as IItemStack[] = [
		<libvulpes:productdust>,
		<libvulpes:productingot>,
		<libvulpes:productboule>,
		<libvulpes:productnugget>,
		<libvulpes:productplate>,
		//<libvulpes:productrod>,
		//<libvulpes:productsheet>,
		<libvulpes:productgear>,
		<libvulpes:ore0>,

	];
	for i in 1 to 11 {
		for j in removeLibVulpes {
			HiiragiUtils.removeFromJEI(j.definition.makeStack(i));
			HiiragiUtils.removeOreDict(j.definition.makeStack(i));
		}
	}

//鉱石辞書の追加
	<ore:gemManaDiamond>.add(<botania:manaresource:2>);
	<ore:gemDragonStone>.add(<botania:manaresource:9>);
	<ore:itemCloth>.add(<botania:manaresource:22>);
	//<ore:itemMagicCloth>.add(<botania:manaresource:22>);
	<ore:ingotElementium>.add(<botania:manaresource:7>);
	<ore:nuggetElementium>.add(<botania:manaresource:19>);
	<ore:blockManasteel>.add(<botania:storage:0>);
	<ore:blockTerrasteel>.add(<botania:storage:1>);
	<ore:blockElementium>.add(<botania:storage:2>);
	<ore:blockManaDiamond>.add(<botania:storage:3>);
	<ore:blockDragonstone>.add(<botania:storage:4>);

	<ore:gemManalapis>.add(<botanicadds:mana_lapis>);
	<ore:gemElvenlapis>.add(<botanicadds:elven_lapis>);
	<ore:blockManalapis>.add(<botanicadds:mana_lapis_block>);
	<ore:blockElvenlapis>.add(<botanicadds:elven_lapis_block>);

	<ore:dustHalogen>.add(<contenttweaker:reagent_halogen>);
	<ore:blockBedrockium>.add(<contenttweaker:block_bedrockium>);
	<ore:ingotBedrockium>.add(<contenttweaker:ingot_bedrockium>);
	<ore:cubeCyan>.add(<contenttweaker:cube_cyan>);
	<ore:cubeMagenta>.add(<contenttweaker:cube_magenta>);
	<ore:cubeYellow>.add(<contenttweaker:cube_yellow>);
	<ore:cropPumpkin>.add(<contenttweaker:pumpkin_melon>);
	<ore:cropMelon>.add(<contenttweaker:pumpkin_melon>);

	<ore:dustSawDust>.add(<dcs_climate:dcs_miscdust:3>);
	<ore:blockPeridot>.add(<dcs_climate:dcs_ore_gemblock:10>);
	<ore:blockGlassHardened>.add(<dcs_climate:dcs_synthetic:2>);
	<ore:fusedQuartz>.add(<dcs_climate:dcs_synthetic:2>);
	<ore:blockWarpCoreCore>.add(<dcs_climate:dcs_ore_metal_alloy:8>);
	<ore:blockWarpCoreRim>.add(<dcs_climate:dcs_ore_metal_alloy:7>);

	<ore:blockFuelCoke>.add(<railcraft:generic:6>);

	<ore:blockCoke>.add(<thermalfoundation:storage_resource:1>);
	<ore:dropRosin>.add(<thermalfoundation:material:832>);
	<ore:dropCoaltar>.add(<thermalfoundation:material:833>);
	<ore:gemSlag>.add(<thermalfoundation:material:864>);

	<ore:blockIronwood>.add(<twilightforest:block_storage:0>);


//このscriptの読み込みの完了をログに出力
print("oreDict.zs loaded!");
