#====================================================================
# name : botania-agglo.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Write about this script file
#====================================================================

#priority 0
#norun

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.botaniatweaks.Agglomeration;
import mods.botaniatweaks.AgglomerationRecipe;
import mods.botaniatweaks.AgglomerationMultiblock;
import mods.ctintegration.util.RecipePattern;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading botania-agglo.zs ...");

//既存のレシピを削除
	Agglomeration.removeDefaultRecipe();

//祭壇の形状を作成
	var agglo_altar_mana = AgglomerationMultiblock.create().center(<contenttweaker:agglo_core_mana>).edge(<botania:storage:0>).corner(<botania:quartztypemana>);
	var agglo_altar_terra = AgglomerationMultiblock.create().center(<contenttweaker:agglo_core_terra>).edge(<botania:storage:1>).corner(<botania:quartztypeelf>);
	var agglo_altar_elem = AgglomerationMultiblock.create().center(<contenttweaker:agglo_core_elem>).edge(<botania:storage:2>).corner(<botania:quartztypelavender>);
	var agglo_altar_gaia = AgglomerationMultiblock.create().center(<contenttweaker:agglo_core_gaia>).edge(<botania:platform:2>).corner(<botania:quartztypedark>);

	var agglo_altar_raw = AgglomerationMultiblock.create().center(<bloodmagic:demon_extras:10>).edge(<bloodmagic:demon_brick_2:5>).corner(<bloodmagic:demon_brick_2:10>);
	var agglo_altar_corr = AgglomerationMultiblock.create().center(<bloodmagic:demon_extras:11>).edge(<bloodmagic:demon_brick_2:6>).corner(<bloodmagic:demon_brick_2:11>);
	var agglo_altar_dest = AgglomerationMultiblock.create().center(<bloodmagic:demon_extras:12>).edge(<bloodmagic:demon_brick_2:7>).corner(<bloodmagic:demon_brick_2:12>);
	var agglo_altar_veng = AgglomerationMultiblock.create().center(<bloodmagic:demon_extras:13>).edge(<bloodmagic:demon_brick_2:8>).corner(<bloodmagic:demon_brick_2:13>);
	var agglo_altar_stea = AgglomerationMultiblock.create().center(<bloodmagic:demon_extras:14>).edge(<bloodmagic:demon_brick_2:9>).corner(<bloodmagic:demon_brick_2:14>);

	var agglo_altar_end_portal =AgglomerationMultiblock.create().center(<contenttweaker:end_portal_altar>).centerReplace(<minecraft:end_portal_frame>).edge(<metaitem:blockEnderium>).corner(<metaitem:blockEnderPearl>);

	var agglo_altar_workshop = AgglomerationMultiblock.create().center(<artisanworktables:workstation:5>).edge(<tconstruct:seared_tank:1>).corner(<minecraft:crafting_table>);

	var agglo_altar_114514 = AgglomerationMultiblock.create().center(<minecraft:sponge:0>).edge(<biomesoplenty:blue_fire>).corner(<biomesoplenty:blue_fire>);

//レシピの登録
	//Terrasteel
		Agglomeration.addRecipe(AgglomerationRecipe.create()
			.output(<ore:ingotTerrasteel>.firstItem)
			.inputs([<ore:gemManaDiamond>, <ore:ingotManasteel>, <ore:manaPearl>])
			.multiblock(agglo_altar_mana));
		Agglomeration.addRecipe(AgglomerationRecipe.create()
			.output(<ore:ingotTerrasteel>.firstItem*2)
			.inputs([<contenttweaker:ephemerald>, <ore:ingotTerrasteel>, <contenttweaker:elven_pearl>])
			.manaCost(400000).multiblock(agglo_altar_terra));

	//Gaia ingot
		Agglomeration.addRecipe(AgglomerationRecipe.create()
			.output(<botania:manaresource:14>)
			.inputs([<botania:manaresource:7>, <botania:manaresource:8>, <botania:manaresource:9>, <botania:manaresource:5>])
			.manaCost(800000).multiblock(agglo_altar_elem));

	//Gaia steel
		Agglomeration.addRecipe(AgglomerationRecipe.create()
			.output(<botanicadds:gaiasteel_ingot>)
			.inputs([<botania:manaresource:5>, <enderio:item_alloy_ingot:6>, <twilightforest:carminite>])
			.manaCost(1000000).multiblock(agglo_altar_gaia));

	//End Portal Frame
		Agglomeration.addRecipe(AgglomerationRecipe.create()
			.output(<minecraft:ender_pearl>)
			.inputs([<minecraft:ender_eye>])
			.manaCost(800000).multiblock(agglo_altar_end_portal));

	//basic Workshop
		Agglomeration.addRecipe(AgglomerationRecipe.create()
			.output(<artisanworktables:workshop:5>)
			.inputs([<gregtech:meta_tool:13>.withTag({"GT.ToolStats": {Material: "wrought_iron"}}), <artisanworktables:toolbox>, <gregtech:meta_tool:5>.withTag({"GT.ToolStats": {Material: "wrought_iron"}})])
			.manaCost(100000).multiblock(agglo_altar_workshop));

	//Experiment 114514
		Agglomeration.addRecipe(AgglomerationRecipe.create()
			.output(<twilightforest:experiment_115>.withTag({ench: [{lvl: 1 as short, id: 26 as short}], display: {Lore: ["§7§olower body is too poor compared to the upper body."], Name: "Experiment 114514"}, AttributeModifiers: [{UUIDMost: -258948833641281218 as long, UUIDLeast: -6554265957756529324 as long, Amount: -9315.0, Slot: "mainhand", AttributeName: "generic.movementSpeed", Operation: 0, Name: "generic.movementSpeed"}]}))
			.inputs([<minecraft:cake>, <twilightforest:experiment_115>, <minecraft:anvil:*>])
			.manaCost(114514).multiblock(agglo_altar_114514));

//このscriptの読み込みの完了をログに出力
print("botania-agglo.zs loaded!");
