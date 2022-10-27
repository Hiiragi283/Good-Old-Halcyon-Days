#====================================================================
# ファイル名 : tconstruct.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for Tinkers Construct and its addons
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.chisel.Carving;
import mods.ctintegration.util.RecipePattern;
import mods.tcomplement.highoven.HighOven;
import mods.tconstruct.Casting;
import mods.tconstruct.Melting;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;
import scripts.jei;

//このscriptの読み込みの開始をログに出力
print("Start loading tconstruct.zs ...");

//作業台レシピの編集
	//上書き
	HiiragiUtils.addCraftingShaped(true, <tcomplement:high_oven_controller>, RecipePattern.init(["AAA", "ABA", "AAA"]).map({A:<tcomplement:materials:1>, B:<tconstruct:smeltery_controller>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <tconstruct:smeltery_controller>, RecipePattern.init(["ABA", "ACA", "ADA"]).map({A:<tconstruct:materials:0>, B:<tconstruct:seared_furnace_controller>, C:<tconstruct:tinker_tank_controller>, D:<dcs_climate:dcs_device_chamber>}).ingredients, null, null);
	HiiragiUtils.addCraftingShapeless(true, <tconstruct:faucet>*2, [<tconstruct:channel>, HiiragiUtils.toolInput(<microblockcbe:saw_stone>, 1)|HiiragiUtils.toolInput(<microblockcbe:saw_iron>, 1)|HiiragiUtils.toolInput(<microblockcbe:saw_diamond>, 1)], null, null);
	//新規
	HiiragiUtils.addCraftingShaped(false, <tconstruct:materials:16>, RecipePattern.init([" A ", "ABA", " A "]).map({A:<ore:itemSilkCloth>, B:<ore:gemEmerald>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <tconstruct:materials:50>, RecipePattern.init([" A ", "ABA", " A "]).map({A:<minecraft:golden_apple:1>, B:<minecraft:skull:3>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <tconstruct:seared:3>, RecipePattern.init(["AA", "AA"]).map({A:<tconstruct:materials:0>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <tconstruct:soil>, RecipePattern.init(["AA", "AA"]).map({A:<contenttweaker:grout_ball>}).ingredients, null, null);
		//吐き気スライム周りの追加
		HiiragiUtils.addCraftingShaped(true, 	<tconstruct:slime_congealed:5>, RecipePattern.init(["AA", "AA"]).map({A:<tconstruct:edible:5>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <tconstruct:slime_boots:5>, RecipePattern.init(["A A", "B B"]).map({A:<tconstruct:edible:5>, B:<tconstruct:slime_congealed:5>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <tconstruct:slime:5>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<tconstruct:edible:5>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <tconstruct:slimesling:5>, RecipePattern.init(["ABA", "C C", " C "]).map({A:<minecraft:string>, B:<tconstruct:slime_congealed:5>, C:<tconstruct:edible:5>}).ingredients, null, null);
		//道具関連のレシピの統合
		HiiragiUtils.addCraftingShaped(false, jei.tablePart, RecipePattern.init(["A", "B"]).map({A:<tconstruct:pattern>, B:<twilightforest:twilight_log>}).ingredients, null ,null);
		HiiragiUtils.addCraftingShaped(false, jei.tableStencil, RecipePattern.init(["A", "B"]).map({A:<tconstruct:pattern>, B:<twilightforest:twilight_oak_planks>}).ingredients, null ,null);
		HiiragiUtils.addCraftingShaped(false, jei.toolForge, RecipePattern.init(["AAA", "BCB", "B B"]).map({A:<ore:blockSeared>, B:<dcs_climate:dcs_ore_heatingmetal:2>, C:<tconstruct:tooltables:3>}).ingredients, null, null);

	//見た目を変えるレシピ
	val mapAppear as IItemStack[] = [
		<tconstruct:rack:0>,
		<tconstruct:rack:1>,
		<tconstruct:toolforge>,
		<tconstruct:tooltables:1>,
		<tconstruct:tooltables:2>,
	];
	for i in mapAppear {
		HiiragiUtils.addCraftingShapeless(false, i, [i, <*>.marked("texture").reuse()], function(out, ins, cInfo) {
			var owner as string = ins.texture.definition.owner;
			var id as string = ins.texture.definition.id.split(":")[1];
			//var idMod as string = owner ~ ":" ~ id;
			var meta as int = ins.texture.metadata;
			return i.withTag({textureBlock: {id: id, Count: 1 as byte, Damage: meta as short}});
		}, null);
	}

//Castの統一
	mods.chisel.Carving.addGroup("cast");
	mods.chisel.Carving.addVariation("cast", <tconstruct:cast>);
	HiiragiUtils.addCasting("table", true, <tconstruct:cast>, null, <liquid:brass>, 144, true, 1*20);
	HiiragiUtils.addCasting("table", false, <tconstruct:cast>, null, <liquid:alubrass>, 144, true, 1*20);

	val castPattern as string[] = [
		"arrow_head",
		"arrow_shaft",
		"axe_head",
		"binding",
		"bow_limb",
		"bow_string",
		"broad_axe_head",
		"cross_guard",
		"excavator_head",
		"hammer_head",
		"hand_guard",
		"kama_head",
		"knife_blade",
		"large_plate",
		"large_sword_blade",
		"pan_head",
		"pick_head",
		"scythe_head",
		"shard",
		"sharpening_kit",
		"shovel_head",
		"sign_head",
		"sword_blade",
		"tool_rod",
		"tough_binding",
		"tough_tool_rod",
		"wide_guard",
	];

	for i in 0 to 5 {
		var castBrass as IItemStack = <tconstruct:cast_custom>.definition.makeStack(i);
		castBrass.addTooltip(I18n.format("gohd.tooltip.cast_chisel.name"));
		mods.tconstruct.Casting.removeTableRecipe(castBrass);
		mods.chisel.Carving.addVariation("cast", castBrass);
	}
	for i in castPattern {
		//Clay Castの無効化
		jei.removeJEI(HiiragiUtils.castClay(i), false);
		mods.tconstruct.Casting.removeTableRecipe(HiiragiUtils.castClay(i));
		//Brass Castを全てchiselから作るように改変
		mods.tconstruct.Casting.removeTableRecipe(HiiragiUtils.castBrass(i));
		mods.chisel.Carving.addVariation("cast", HiiragiUtils.castBrass(i));
	}

	mods.tconstruct.Casting.removeTableRecipe(HiiragiUtils.castBrass("chisel_head"));
	mods.tconstruct.Casting.removeTableRecipe(HiiragiUtils.castClay("chisel_head"));
	jei.removeJEI(HiiragiUtils.castClay("chisel_head"), false);
	mods.chisel.Carving.addVariation("cast", HiiragiUtils.castBrass("chisel_head"));

//Alloyingレシピの編集
	mods.tconstruct.Alloy.removeRecipe(<liquid:manyullyn>);

	mods.tconstruct.Alloy.addRecipe(<liquid:manyullyn>*32, [<liquid:cobalt>*16, <liquid:ardite>*16]);

//Castingレシピの編集
	HiiragiUtils.addCasting("basin", false, <railcraft:bloodstained:2>, <minecraft:sandstone:2>, <liquid:blood>, 40, true, 5*20);
	HiiragiUtils.addCasting("table", false, <thermalfoundation:material:512>, <ore:plateIron>, <liquid:redstone>, 100, true, 5*20);
	HiiragiUtils.addCasting("table", false, <thermalfoundation:material:513>, <ore:plateGold>, <liquid:redstone>, 100, true, 5*20);
	HiiragiUtils.addCasting("table", false, <thermalfoundation:material:514>, <ore:plateSilver>, <liquid:redstone>, 100, true, 5*20);
	HiiragiUtils.addCasting("table", false, <thermalfoundation:material:515>, <ore:plateElectrum>, <liquid:redstone>, 100, true, 5*20);
	HiiragiUtils.addCasting("table", false, <thermalfoundation:material:640>, <thermalfoundation:material:512>, <liquid:electrum>, 144, true, 5*20);
	HiiragiUtils.addCasting("table", true, <enderio:item_material:11>, <ore:dustBedrock>, <liquid:steel>, 144, true, 5*20);
	HiiragiUtils.addCasting("table", true, <enderio:item_material:12>, <enderio:item_material:11>, <liquid:energetic_alloy>, 144, true, 5*20);
	HiiragiUtils.addCasting("table", true, <enderio:item_material:13>, <enderio:item_material:11>, <liquid:vibrant_alloy>, 144, true, 5*20);
	HiiragiUtils.addCasting("table", true, <enderio:item_material:14>, <ore:gemDiamond>, <liquid:pulsating_iron>, 144, true, 5*20);
	HiiragiUtils.addCasting("table", true, <enderio:item_material:15>, <ore:gemEmerald>, <liquid:vibrant_alloy>, 144, true, 5*20);
	HiiragiUtils.addCasting("table", true, <enderio:item_material:73>, <enderio:item_material:11>, <liquid:dark_steel>, 144, true, 5*20);

//Meltingレシピの編集
	mods.tconstruct.Melting.removeRecipe(<liquid:steel>, <dcs_climate:dcs_ore_metal_alloy:2>);

	mods.tconstruct.Melting.addRecipe(<liquid:wrought_iron>*1296, <dcs_climate:dcs_ore_metal_alloy:2>);

//High Ovenのレシピの編集
	//Fuel
	//Melting
	//Heat
	//Mix
	HighOven.removeMixRecipe(<liquid:steel>);
	val ovenSteel = HighOven.newMixRecipe(<liquid:steel>*1296, <liquid:wrought_iron>*1296, 1500);
	ovenSteel.addPurifier(<ore:dustLime>, 100);
	ovenSteel.register();

//このscriptの読み込みの完了をログに出力
print("tconstruct.zs loaded!");
