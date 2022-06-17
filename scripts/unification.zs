#======================================================================
# ファイル名 : unification.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : 鉱石辞書やレシピの統一
#======================================================================

#priority 90

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading unification.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
		val removeCrafting as IItemStack[] = [
			<dcs_climate:dcs_ore_gemblock:4>,
			<techreborn:nuggets:24>,
			<thermalfoundation:storage_resource:1>,
		];
		for i in removeCrafting {
			HiiragiUtils.removeCrafting(i);
		}
		val removeCraftingName as string[] = [
			"dcs_climate:main_container/dcs_gem_blue_1",
			"dcs_climate:main_yagen/dcs_gem_layer_1",
			"thermalfoundation:gunpowder",
			"thermalfoundation:gunpowder_1",
		];
		for i in removeCraftingName {
			recipes.removeByRecipeName(i);
		}

		for i in 0 to 15 {
			recipes.removeByRecipeName("mekanism:balloon_" ~ i);
			recipes.removeByRecipeName("dcs_lib:balloon_" ~ i ~ "_dcs");
		}

	//上書き
		HiiragiUtils.addCrafting(true, true, <appliedenergistics2:material>*4, [[<appliedenergistics2:quartz_block:0>]]);
		HiiragiUtils.addCrafting(false, true, <minecraft:wooden_pressure_plate>, RecipePattern.init(["AA"]).map({A:<minecraft:planks:0>}).ingredients);
		HiiragiUtils.addCrafting(false, true, <minecraft:slime>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<minecraft:slime_ball>}).ingredients);
		HiiragiUtils.addCrafting(false, true, <minecraft:trapdoor>*2, RecipePattern.init(["AAA", "AAA"]).map({A:<minecraft:planks:0>}).ingredients);
		HiiragiUtils.addCrafting(false, true, <tconstruct:slime:5>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<tconstruct:edible:5>}).ingredients);
		HiiragiUtils.addCrafting(false, true, <tconstruct:slime_congealed:5>, RecipePattern.init(["AA", "AA"]).map({A:<tconstruct:edible:5>}).ingredients);
		HiiragiUtils.addCrafting(false, true, <tconstruct:slimesling:5>, RecipePattern.init(["ABA", "C C", " C "]).map({A:<minecraft:string>, B:<tconstruct:slime_congealed:5>, C:<tconstruct:edible:5>}).ingredients);
		HiiragiUtils.addCrafting(false, true, <tconstruct:slime_boots:5>, RecipePattern.init(["A A", "B B"]).map({A:<tconstruct:edible:5>, B:<tconstruct:slime_congealed:5>}).ingredients);
		HiiragiUtils.addCrafting(true, true, <thermalfoundation:material:802>, [[<thermalfoundation:storage_resource:1>]]);

	//新規
		HiiragiUtils.addCrafting(false, false, <tconstruct:soil>, RecipePattern.init(["AA", "AA"]).map({A:<contenttweaker:grout_ball>}).ingredients);
		HiiragiUtils.addCrafting(true, false, <contenttweaker:grout_ball>*4, [[<tconstruct:soil:0>]]);
		HiiragiUtils.addCraftingConv(<contenttweaker:grout_ball>, <contenttweaker:grout_ingot>);

//かまどレシピの編集
	//削除
		val removeFurnace as IItemStack[] = [
			<tconstruct:materials>,
		];
		for i in removeFurnace {
			HiiragiUtils.removeFurnace(i);
		}
	//新規
		val addFurnace as IIngredient[IItemStack] = {
			<tconstruct:materials>: <contenttweaker:grout_ingot>,
			<tconstruct:channel>: <contenttweaker:unfired_casting_channel>,
			<tconstruct:casting>: <contenttweaker:unfired_casting_table>,
			<tconstruct:casting:1>: <contenttweaker:unfired_casting_basin>,
		};
		for output, input in addFurnace {
			HiiragiUtils.addFurnace(false, output, input);
		}

//AWレシピの編集
	//import
	//新規

//JEIからエントリを完全に削除
	val removeFromJEI as IItemStack[] = [
		//Heat And Climate
			//<dcs_climate:dcs_gem:*>,
			<dcs_climate:dcs_door_marble>,
			<dcs_climate:dcs_door_greisen>,
			<dcs_climate:dcs_door_gypsum>,
			<dcs_climate:dcs_door_steel>,
	];
	for i in removeFromJEI {
		HiiragiUtils.removeFromJEI(i);
		//HiiragiUtils.removeOreDict(i);
	}

//鉱石辞書の削除
	<ore:dustWood>.remove(<dcs_climate:dcs_fooddust:7>);
	<ore:blockAluminium>.remove(<techreborn:storage:1>);

	HiiragiUtils.removeOreDict(<dcs_climate:dcs_gem_layer:4>);

	val removeFull as IItemStack[] = [
		<techreborn:storage:3>,
		<techreborn:dust:10>,
		<techreborn:ingot:3>,
		<techreborn:nuggets:3>,
		<techreborn:smalldust:10>,
	];

	for i in removeFull {
		HiiragiUtils.removeFromJEI(i);
		HiiragiUtils.removeOreDict(i);
	}

	val removeLibVulpes as IItemStack[] = [
		<libvulpes:productdust>,
		<libvulpes:productingot>,
		<libvulpes:productboule>,
		<libvulpes:productnugget>,
		<libvulpes:productplate>,
		<libvulpes:productrod>,
		<libvulpes:productsheet>,
		<libvulpes:productgear>,
		<libvulpes:ore0>,

	];
	for i in 0 to 10 {
		for j in removeLibVulpes {
			HiiragiUtils.removeFromJEI(j.definition.makeStack(i));
			HiiragiUtils.removeOreDict(j.definition.makeStack(i));
		}
	}

//鉱石辞書の追加
	<ore:itemCloth>.add(<botania:manaresource:22>);
	<ore:itemMagicCloth>.add(<botania:manaresource:22>);
	<ore:ingotElementium>.add(<botania:manaresource:7>);
	<ore:nuggetElementium>.add(<botania:manaresource:19>);
	<ore:blockElementium>.add(<botania:storage:2>);

	<ore:dustHalogen>.add(<contenttweaker:reagent_halogen>);
	<ore:dustEnergium>.add(<contenttweaker:energium_dust>);
	<ore:dustLapotron>.add(<contenttweaker:lapotron_dust>);

	<ore:dustSawDust>.add(<dcs_climate:dcs_miscdust:3>);

	<ore:blockFuelCoke>.add(<railcraft:generic:6>);

	<ore:cableTin>.add(<techreborn:cable:1>);
	<ore:cableCopper>.add(<techreborn:cable:0>);
	<ore:cableGold>.add(<techreborn:cable:2>);
	<ore:cableRefinedIron>.add(<techreborn:cable:3>);
	<ore:cableFiber>.add(<techreborn:cable:4>);
	<ore:cableCopperInsulated>.add(<techreborn:cable:5>);
	<ore:cableGoldInsulated>.add(<techreborn:cable:6>);
	<ore:cableRefinedIronInsulated>.add(<techreborn:cable:7>);
	<ore:cableSuperconductor>.add(<techreborn:cable:8>);

	<ore:blockCoke>.add(<thermalfoundation:storage_resource:1>);

//Tooltipの追加
	//<artisanworktables:workshop:10>.addTooltip(I18n.format("gohd.tooltip.terra_firma_interface.name"));
	<contenttweaker:unfired_casting_channel>.addTooltip(I18n.format("gohd.tooltip.grout_forming.name"));
	<contenttweaker:unfired_casting_table>.addTooltip(I18n.format("gohd.tooltip.grout_forming.name"));
	<contenttweaker:unfired_casting_basin>.addTooltip(I18n.format("gohd.tooltip.grout_forming.name"));
	<dcs_climate:dcs_tinder:1>.addTooltip(I18n.format("gohd.tooltip.burning_stick.name"));

//耐久値の調整
	<armortech:iron_hammer>.maxDamage = 160;
	<armortech:iron_cutter>.maxDamage = 160;

//このscriptの読み込みの完了をログに出力
print("unification.zs loaded!");
