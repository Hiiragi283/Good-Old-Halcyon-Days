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
	HiiragiUtils.addCraftingShaped(true, <tconstruct:smeltery_controller>, RecipePattern.init(["ABA", "ACA", "ADA"]).map({A:<tconstruct:materials:0>, B:<tconstruct:seared_furnace_controller>, C:<tconstruct:tinker_tank_controller>, D:<dcs_climate:dcs_device_chamber>}).ingredients, null, null);
	//新規
	HiiragiUtils.addCraftingShaped(false, <tconstruct:seared:3>, RecipePattern.init(["AA", "AA"]).map({A:<tconstruct:materials:0>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(false, <tconstruct:soil>, RecipePattern.init(["AA", "AA"]).map({A:<contenttweaker:grout_ball>}).ingredients, null, null);

	HiiragiUtils.addCraftingShaped(true, <tconstruct:slime:5>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<tconstruct:edible:5>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <tconstruct:slime_congealed:5>, RecipePattern.init(["AA", "AA"]).map({A:<tconstruct:edible:5>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <tconstruct:slimesling:5>, RecipePattern.init(["ABA", "C C", " C "]).map({A:<minecraft:string>, B:<tconstruct:slime_congealed:5>, C:<tconstruct:edible:5>}).ingredients, null, null);
	HiiragiUtils.addCraftingShaped(true, <tconstruct:slime_boots:5>, RecipePattern.init(["A A", "B B"]).map({A:<tconstruct:edible:5>, B:<tconstruct:slime_congealed:5>}).ingredients, null, null);

	//Tool Forgeのレシピの統合
	recipes.remove(<tconstruct:toolforge>);
	HiiragiUtils.addCraftingShaped(false, jei.toolForge, RecipePattern.init(["AAA", "BCB", "B B"]).map({A:<ore:blockSeared>, B:<dcs_climate:dcs_ore_heatingmetal:2>, C:<tconstruct:tooltables:3>}).ingredients, null, null);
	//Tool Forgeの見た目を変えるレシピ
	HiiragiUtils.addCraftingShapeless(false, <tconstruct:toolforge>, [<tconstruct:toolforge>, <*>.marked("texture").reuse()], function(out, ins, cInfo) {
		var owner as string = ins.texture.definition.owner;
		var id as string = ins.texture.definition.id.split(":")[1];
		//var idMod as string = owner ~ ":" ~ id;
		var meta as int = ins.texture.metadata;
		return <tconstruct:toolforge>.withTag({textureBlock: {id: id, Count: 1 as byte, Damage: meta as short}});
	}, null);

//Castの統一
	mods.chisel.Carving.addGroup("cast");
	mods.chisel.Carving.addVariation("cast", <tconstruct:cast>);
	HiiragiUtils.addCasting("table", true, <tconstruct:cast>, null, <liquid:brass>, 144, true, 1*20);
	HiiragiUtils.addCasting("table", false, <tconstruct:cast>, null, <liquid:alubrass>, 144, true, 1*20);

	val castPattern as string[] = [
		"pick_head",
		"arrow_shaft",
		"sign_head",
		"arrow_head",
		"tool_rod",
		"large_plate",
		"bow_string",
		"binding",
		"cross_guard",
		"sharpening_kit",
		"sword_blade",
		"axe_head",
		"broad_axe_head",
		"scythe_head",
		"kama_head",
		"pan_head",
		"tough_tool_rod",
		"knife_blade",
		"bow_limb",
		"wide_guard",
		"excavator_head",
		"hammer_head",
		"large_sword_blade",
		"shovel_head",
		"hand_guard",
		"shard",
		"tough_binding"
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
	HiiragiUtils.addCasting("table", true, <enderio:item_material:11>, <ore:dustBedrock>, <liquid:steel>, 144, true, 5*20);
	HiiragiUtils.addCasting("table", true, <enderio:item_material:73>, <enderio:item_material:11>, <liquid:dark_steel>, 144, true, 5*20);
	HiiragiUtils.addCasting("table", true, <enderio:item_material:12>, <enderio:item_material:11>, <liquid:energetic_alloy>, 144, true, 5*20);
	HiiragiUtils.addCasting("table", true, <enderio:item_material:13>, <enderio:item_material:11>, <liquid:vibrant_alloy>, 144, true, 5*20);
	HiiragiUtils.addCasting("table", true, <enderio:item_material:14>, <ore:gemDiamond>, <liquid:pulsating_iron>, 144, true, 5*20);
	HiiragiUtils.addCasting("table", true, <enderio:item_material:15>, <ore:gemEmerald>, <liquid:vibrant_alloy>, 144, true, 5*20);
	HiiragiUtils.addCasting("table", false, <thermalfoundation:material:512>, <ore:plateIron>, <liquid:redstone>, 100, true, 5*20);
	HiiragiUtils.addCasting("table", false, <thermalfoundation:material:513>, <ore:plateGold>, <liquid:redstone>, 100, true, 5*20);
	HiiragiUtils.addCasting("table", false, <thermalfoundation:material:514>, <ore:plateSilver>, <liquid:redstone>, 100, true, 5*20);
	HiiragiUtils.addCasting("table", false, <thermalfoundation:material:515>, <ore:plateElectrum>, <liquid:redstone>, 100, true, 5*20);
	HiiragiUtils.addCasting("table", false, <thermalfoundation:material:640>, <thermalfoundation:material:512>, <liquid:electrum>, 144, true, 5*20);

//Meltingレシピの編集

//このscriptの読み込みの完了をログに出力
print("tconstruct.zs loaded!");
