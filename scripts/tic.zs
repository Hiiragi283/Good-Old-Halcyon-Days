#====================================================================
# ファイル名 : tic.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Tikers Contructおよびそのアドオンの改変
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.chisel.Carving;
import mods.ctintegration.util.RecipePattern;
import mods.tconstruct.Casting;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading tic.zs ...");

//変数の定義
	mods.jei.JEI.addItem(<tconstruct:edible:5>);
	mods.jei.JEI.addItem(<tconstruct:slime:5>);
	mods.jei.JEI.addItem(<tconstruct:slime_congealed:5>);
	mods.jei.JEI.addItem(<tconstruct:slimesling:5>);
	mods.jei.JEI.addItem(<tconstruct:slime_boots:5>);

//作業台レシピの編集
	//削除
		val removeCrafting as IItemStack[] = [
			<tconstruct:faucet>,
			<tconstruct:channel>,
			<tconstruct:casting:*>,
		];
		for i in removeCrafting {
			HiiragiUtils.removeCrafting(i);
		}
	//上書き
		HiiragiUtils.addCraftingShaped(true, <tcomplement:melter>, RecipePattern.init(["ABA", "ACA", "ADA"]).map({A:<tconstruct:materials:0>, B:<minecraft:hopper>, C:<tconstruct:seared_tank:*>, D:<ore:ingotIron>}).ingredients, null, null);
		HiiragiUtils.addCraftingShaped(true, <tconstruct:smeltery_controller>, RecipePattern.init(["ABA", "ACA", "ADA"]).map({A:<tconstruct:materials:0>, B:<tcomplement:alloy_tank>, C:<tcomplement:melter>, D:<dcs_climate:dcs_device_chamber>}).ingredients, null, null);
	//新規
		HiiragiUtils.addCraftingShaped(false, <tconstruct:seared:3>, RecipePattern.init(["AA", "AA"]).map({A:<tconstruct:materials:0>}).ingredients, null, null);

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
		RecipeBuilder.get("basic")
			.setShapeless([<tconstruct:channel>])
			.addTool(<ore:artisansHandsaw>, 1)
			.addOutput(<tconstruct:faucet>*2)
			.create();

//Castの統一
	mods.chisel.Carving.addGroup("cast");
	mods.chisel.Carving.addVariation("cast", <tconstruct:cast>);
	mods.tconstruct.Casting.removeTableRecipe(<tconstruct:cast>);
	mods.tconstruct.Casting.addTableRecipe(<tconstruct:cast>, null, <liquid:brass>, 3*20);
	mods.tconstruct.Casting.addTableRecipe(<tconstruct:cast>, null, <liquid:alubrass>, 3*20);
	mods.chisel.Carving.addVariation("cast", HiiragiUtils.castBrass("chisel_head"));

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
		HiiragiUtils.removeFromJEI(HiiragiUtils.castClay(i));
		mods.tconstruct.Casting.removeTableRecipe(HiiragiUtils.castClay(i));
		//Brass Castを全てchiselから作るように改変
		mods.tconstruct.Casting.removeTableRecipe(HiiragiUtils.castBrass(i));
		mods.chisel.Carving.addVariation("cast", HiiragiUtils.castBrass(i));
	}

	mods.tconstruct.Casting.removeTableRecipe(HiiragiUtils.castBrass("chisel_head"));
	mods.tconstruct.Casting.removeTableRecipe(HiiragiUtils.castClay("chisel_head"));
	HiiragiUtils.removeFromJEI(HiiragiUtils.castClay("chisel_head"));

//Castingレシピの追加
	HiiragiUtils.addCasting("table", false, <dcs_climate:dcs_device_pail>, <minecraft:bucket>, <liquid:tin>, 288, true, 5*20);
	HiiragiUtils.addCasting("table", true, <enderio:item_material:11>, <ore:dustBedrock>, <liquid:steel>, 144, true, 5*20);
	HiiragiUtils.addCasting("table", true, <enderio:item_material:73>, <enderio:item_material:11>, <liquid:dark_steel>, 144, true, 5*20);
	HiiragiUtils.addCasting("table", true, <enderio:item_material:12>, <enderio:item_material:73>, <liquid:energetic_alloy>, 144, true, 5*20);
	HiiragiUtils.addCasting("table", true, <enderio:item_material:13>, <enderio:item_material:12>, <liquid:vibrant_alloy>, 144, true, 5*20);
	HiiragiUtils.addCasting("table", true, <enderio:item_material:14>, <ore:gemDiamond>, <liquid:pulsating_iron>, 144, true, 5*20);
	HiiragiUtils.addCasting("table", true, <enderio:item_material:15>, <ore:gemEmerald>, <liquid:vibrant_alloy>, 144, true, 5*20);

//このscriptの読み込みの完了をログに出力
print("tic.zs loaded!");
