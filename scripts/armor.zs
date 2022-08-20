#===================================================================
# ファイル名 : armor.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for All Armors
#        Some scripts are partially referred to Nomifactory
#        -> https://github.com/Nomifactory/Nomifactory/
#===================================================================

#priority 90

//crafttweakerからclassをimport
import crafttweaker.api.IClient;
import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.recipes.IRecipeFunction;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading armor.zs ...");

//変数の定義
val armorTier as IItemStack[][string[]] = {
	["§lCommon", "§l普通の"]: [
		<minecraft:chainmail_helmet>,
		<minecraft:chainmail_chestplate>,
		<minecraft:chainmail_leggings>,
		<minecraft:chainmail_boots>,
		<minecraft:golden_helmet>,
		<minecraft:golden_chestplate>,
		<minecraft:golden_leggings>,
		<minecraft:golden_boots>,
		<bibliocraft:biblioglasses:*>,
		<railcraft:armor_overalls>,
		<twilightforest:arctic_helmet>,
		<twilightforest:arctic_chestplate>,
		<twilightforest:arctic_leggings>,
		<twilightforest:arctic_boots>
	],
	["§a§lUncommon", "§a§l少し珍しい"]: [
		<dcs_climate:dcs_met_brass>,
		<dcs_climate:dcs_plate_brass>,
		<dcs_climate:dcs_leggins_brass>,
		<dcs_climate:dcs_boots_brass>,
		<dcs_climate:dcs_met_sapphire>,
		<dcs_climate:dcs_plate_sapphire>,
		<dcs_climate:dcs_leggins_sapphire>,
		<dcs_climate:dcs_boots_sapphire>,
		<dcs_climate:dcs_met_silver>,
		<dcs_climate:dcs_plate_silver>,
		<dcs_climate:dcs_leggins_silver>,
		<dcs_climate:dcs_boots_silver>,
		<minecraft:iron_helmet>,
		<minecraft:iron_chestplate>,
		<minecraft:iron_leggings>,
		<minecraft:iron_boots>,
		<thermalfoundation:armor.helmet_lead>,
		<thermalfoundation:armor.plate_lead>,
		<thermalfoundation:armor.legs_lead>,
		<thermalfoundation:armor.boots_lead>,
		<thermalfoundation:armor.helmet_invar>,
		<thermalfoundation:armor.plate_invar>,
		<thermalfoundation:armor.legs_invar>,
		<thermalfoundation:armor.boots_invar>,
		<thermalfoundation:armor.helmet_bronze>,
		<thermalfoundation:armor.plate_bronze>,
		<thermalfoundation:armor.legs_bronze>,
		<thermalfoundation:armor.boots_bronze>,
		<twilightforest:ironwood_helmet>,
		<twilightforest:ironwood_chestplate>,
		<twilightforest:ironwood_leggings>,
		<twilightforest:ironwood_boots>,
	],
	["§9§lRare", "§9§lレアな"]: [
		<dcs_climate:dcs_met_steel>,
		<dcs_climate:dcs_plate_steel>,
		<dcs_climate:dcs_leggins_steel>,
		<dcs_climate:dcs_boots_steel>,
		<dcs_climate:dcs_met_titanium>,
		<dcs_climate:dcs_plate_titanium>,
		<dcs_climate:dcs_leggins_titanium>,
		<dcs_climate:dcs_boots_titanium>,
		<minecraft:diamond_helmet>,
		<minecraft:diamond_chestplate>,
		<minecraft:diamond_leggings>,
		<minecraft:diamond_boots>,
		<botania:manasteelhelm>,
		<botania:manasteelhelmreveal>,
		<botania:manasteelchest>,
		<botania:manasteellegs>,
		<botania:manasteelboots>,
		<botania:manaweavehelm>,
		<botania:manaweavechest>,
		<botania:manaweavelegs>,
		<botania:manaweaveboots>,
		<mekanism:jetpack>,
		<mekanism:gasmask>,
		<mekanism:scubatank>,
		<mekanism:freerunners>,
		<mekanismtools:glowstonehelmet>,
		<mekanismtools:glowstonechestplate>,
		<mekanismtools:glowstoneleggings>,
		<mekanismtools:glowstoneboots>,
		<mekanismtools:steelhelmet>,
		<mekanismtools:steelchestplate>,
		<mekanismtools:steelleggings>,
		<mekanismtools:steelboots>,
		<tcomplement:manyullyn_helmet>,
		<tcomplement:manyullyn_chestplate>,
		<tcomplement:manyullyn_leggings>,
		<tcomplement:manyullyn_boots>,
		<twilightforest:naga_chestplate>,
		<twilightforest:naga_leggings>,
		<twilightforest:steeleaf_helmet>,
		<twilightforest:steeleaf_chestplate>,
		<twilightforest:steeleaf_leggings>,
		<twilightforest:steeleaf_boots>,
		<twilightforest:knightmetal_helmet>,
		<twilightforest:knightmetal_chestplate>,
		<twilightforest:knightmetal_leggings>,
		<twilightforest:knightmetal_boots>
	],
	["§d§lEpic", "§d§l強力な"]: [
		<minecraft:elytra>,
		<dcs_climate:dcs_met_chalcedony>,
		<dcs_climate:dcs_plate_chalcedony>,
		<dcs_climate:dcs_leggins_chalcedony>,
		<dcs_climate:dcs_boots_chalcedony>,
		<botania:terrasteelhelm>,
		<botania:terrasteelhelmreveal>,
		<botania:terrasteelchest>,
		<botania:terrasteellegs>,
		<botania:terrasteelboots>,
		<botania:elementiumhelm>,
		<botania:elementiumhelmreveal>,
		<botania:elementiumchest>,
		<botania:elementiumlegs>,
		<botania:elementiumboots>,
		<enderio:item_dark_steel_helmet>,
		<enderio:item_dark_steel_chestplate>,
		<enderio:item_dark_steel_leggings>,
		<enderio:item_dark_steel_boots>,
		<mekanism:armoredjetpack>,
		<mekanismtools:osmiumhelmet>,
		<mekanismtools:osmiumchestplate>,
		<mekanismtools:osmiumleggings>,
		<mekanismtools:osmiumboots>,
		<railcraft:armor_goggles>,
		<tcomplement:knightslime_helmet>,
		<tcomplement:knightslime_chestplate>,
		<tcomplement:knightslime_leggings>,
		<tcomplement:knightslime_boots>,
		<twilightforest:fiery_helmet>,
		<twilightforest:fiery_chestplate>,
		<twilightforest:fiery_leggings>,
		<twilightforest:fiery_boots>,
		<twilightforest:yeti_helmet>,
		<twilightforest:yeti_chestplate>,
		<twilightforest:yeti_leggings>,
		<twilightforest:yeti_boots>
	],
	["§6§lLegendary", "§6§l伝説級の"]: [
		<dcs_climate:dcs_gemboots_blue>,
		<dcs_climate:dcs_gemboots_green>,
		<enderio:item_end_steel_helmet>,
		<enderio:item_end_steel_chestplate>,
		<enderio:item_end_steel_leggings>,
		<enderio:item_end_steel_boots>,
		<mekanismtools:obsidianhelmet>,
		<mekanismtools:obsidianchestplate>,
		<mekanismtools:obsidianleggings>,
		<mekanismtools:obsidianboots>,
		//<projecte:item.pe_dm_armor_3>,
		//<projecte:item.pe_dm_armor_2>,
		//<projecte:item.pe_dm_armor_1>,
		//<projecte:item.pe_dm_armor_0>,
		//<projecte:item.pe_rm_armor_3>,
		//<projecte:item.pe_rm_armor_2>,
		//<projecte:item.pe_rm_armor_1>,
		//<projecte:item.pe_rm_armor_0>,
		<twilightforest:phantom_helmet>,
		<twilightforest:phantom_chestplate>
	],
	["§c§lMythic", "§c§l神話級の"]: [
		<openblocks:technicolor_glasses>, //It's joke
		//<projecte:item.pe_gem_armor_3>,
		//<projecte:item.pe_gem_armor_2>,
		//<projecte:item.pe_gem_armor_1>,
		//<projecte:item.pe_gem_armor_0>,
	]
};
	for i, j in armorTier {
		for k in j {
			if(client.language == "ja_jp") {
				k.addTooltip(I18n.format("gohd.tooltip.armor.name", i[1]));
			} else {
				k.addTooltip(I18n.format("gohd.tooltip.armor.name", i[0]));
			}
		}
	}

//このscriptの読み込みの完了をログに出力
print("armor.zs loaded!");
