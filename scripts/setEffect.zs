#====================================================================
# ファイル名 : setEffect.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Script for Set Effect
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
print("Start loading setEffect.zs ...");

//特殊効果の設定
	//Steel Armor (HaC)
	mods.SetEffect.newSet()
		.setName("armor_steel")
		.withHead(<dcs_climate:dcs_met_steel>)
		.withChest(<dcs_climate:dcs_plate_steel>)
		.withLegs(<dcs_climate:dcs_leggins_steel>)
		.withFeet(<dcs_climate:dcs_boots_steel>)
		.addEffect(<potion:tconstruct:magnetic>.makePotionEffect(100, 0))
		.register();
	//Titanium Armor (HaC)
	mods.SetEffect.newSet()
		.setName("armor_titanium")
		.withHead(<dcs_climate:dcs_met_titanium>)
		.withChest(<dcs_climate:dcs_plate_titanium>)
		.withLegs(<dcs_climate:dcs_leggins_titanium>)
		.withFeet(<dcs_climate:dcs_boots_titanium>)
		.addEffect(<potion:minecraft:resistance>.makePotionEffect(100, 1))
		.addImmunity(<potion:twilightforest:frosted>)
		.register();
	//Cloaking Device
	/*mods.SetEffect.newSet()
		.setName("armor_cloaking")
		.withChest(<dcs_climate:dcs_plate_titanium>)
		.addEffect(<potion:dcs_climate:dcs.potion.warp>.makePotionEffect(100, 0))
		.addImmunity(<potion:minecraft:glowing>)
		.register();*/
	//Yeti Armor
	mods.SetEffect.newSet()
		.setName("armor_yeti")
		.withHead(<twilightforest:yeti_helmet>)
		.withChest(<twilightforest:yeti_chestplate>)
		.withLegs(<twilightforest:yeti_leggings>)
		.withFeet(<twilightforest:yeti_boots>)
		.addEffect(<potion:dcs_lib:dcs.potion.freeze_res>.makePotionEffect(100, 1))
		.addImmunity(<potion:twilightforest:frosted>)
		.register();
	//Knightslime Armor
	mods.SetEffect.newSet()
		.setName("armor_knightslime")
		.withHead(<tcomplement:knightslime_helmet>)
		.withChest(<tcomplement:knightslime_chestplate>)
		.withLegs(<tcomplement:knightslime_leggings>)
		.withFeet(<tcomplement:knightslime_boots>)
		.addEffect(<potion:minecraft:luck>.makePotionEffect(100, 1))
		.addImmunity(<potion:minecraft:unluck>)
		.register();

	//Upstreaming Hang Glider
	/*mods.SetEffect.newSet()
		.setName("custom_upstreaming_hang_glider")
		.withMainhand(HiiragiUtils.addLocname(<openblocks:hang_glider>, "gohd.custom.upstreaming_hang_glider.name"))
		.addEffect(<potion:dcs_climate:dcs.potion.bird>.makePotionEffect(100, 0))
		.register();*/

	//Traveler's Sleeping bag
	/*mods.SetEffect.newSet()
		.setName("custom_travelers_sleeping_bed")
		.withChest(<openblocks:sleeping_bag>.withTag({Sleeping: 1 as byte, display: {LocName: "gohd.custom.travelers_sleeping_bag.name"}}))
		.addEffect(<potion:minecraft:regeneration>.makePotionEffect(100, 7))
		.addEffect(<potion:minecraft:saturation>.makePotionEffect(100, 7))
		.register();*/

//このscriptの読み込みの完了をログに出力
print("setEffect.zs loaded!");
