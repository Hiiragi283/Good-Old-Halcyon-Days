#====================================================================
# Name   : zenScroll.zs
# Author : Hiiragi R. Tsubasa: https://github.com/Hiiragi283
# Info   : Scripts for Zen Scroll
#====================================================================

#priority 0

//Classのimport
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.recipes.IRecipeAction;
import crafttweaker.recipes.IRecipeFunction;
import mods.ctintegration.util.RecipePattern;
import mods.zenscroll.ScrollGroup;
import mods.zenscroll.ZenScroll;
import mods.zenutils.HexHelper;
import mods.zenutils.I18n;
import scripts.grassUtils.RecipeUtils;
import scripts.HiiragiUtils;

//読み込みの開始をログに出力
print("Start loading zenScroll.zs ...");

//ScrollのGroupの登録
	ZenScroll.add(<appliedenergistics2:quartz_block>, <appliedenergistics2:quartz_pillar>, <appliedenergistics2:chiseled_quartz_block>);
	ZenScroll.add(<biomesoplenty:white_sandstone:*>);
	ZenScroll.add(<botania:custombrick:*>);
	ZenScroll.add(<botania:dreamwood:1>, <botania:dreamwood:2>, <botania:dreamwood:3>, <botania:dreamwood:4>);
	ZenScroll.add(<botania:livingrock:*>);
	ZenScroll.add(<botania:livingwood:1>, <botania:livingwood:2>, <botania:livingwood:3>, <botania:livingwood:4>);
	ZenScroll.add(<botania:quartztypeblaze:*>);
	ZenScroll.add(<botania:quartztypedark:*>);
	ZenScroll.add(<botania:quartztypeelf:*>);
	ZenScroll.add(<botania:quartztypelavender:*>);
	ZenScroll.add(<botania:quartztypemana:*>);
	ZenScroll.add(<botania:quartztypered:*>);
	ZenScroll.add(<botania:quartztypesunny:*>);
	ZenScroll.add(<dcs_climate:dcs_desktop_accessories:*>);
	/*ZenScroll.add(<dcs_climate:dcs_layer_skarn:0>, <dcs_climate:dcs_build_bricks:5>);
	ZenScroll.add(<dcs_climate:dcs_layer_skarn:1>, <dcs_climate:dcs_build_bricks:6>);
	ZenScroll.add(<dcs_climate:dcs_layer_skarn:2>, <dcs_climate:dcs_build_bricks:7>);
	ZenScroll.add(<dcs_climate:dcs_layer_stone_new:1>, <dcs_climate:dcs_build_bricks:2>);
	ZenScroll.add(<dcs_climate:dcs_ore_gemblock:3>, <dcs_climate:dcs_build_bricks:0>);
	ZenScroll.add(<dcs_climate:dcs_ore_gemblock:5>, <dcs_climate:dcs_build_bricks:4>);
	ZenScroll.add(<dcs_climate:dcs_ore_gemblock:6>, <dcs_climate:dcs_build_bricks:1>);*/
	ZenScroll.add(<enderio:block_decoration1:*>, <enderio:block_decoration2:*>, <enderio:block_decoration3:*>);
	ZenScroll.add(<enderio:block_self_resetting_lever5>, <enderio:block_self_resetting_lever10>, <enderio:block_self_resetting_lever30>, <enderio:block_self_resetting_lever60>, <enderio:block_self_resetting_lever300>, <enderio:block_self_resetting_lever5i>, <enderio:block_self_resetting_lever10i>, <enderio:block_self_resetting_lever30i>, <enderio:block_self_resetting_lever60i>, <enderio:block_self_resetting_lever300i>);
	ZenScroll.add(<enderio:item_material:60>, <enderio:item_redstone_not_filter>, <enderio:item_redstone_or_filter>, <enderio:item_redstone_and_filter>, <enderio:item_redstone_nor_filter>, <enderio:item_redstone_nand_filter>, <enderio:item_redstone_xor_filter>, <enderio:item_redstone_xnor_filter>, <enderio:item_redstone_toggle_filter>, <enderio:item_redstone_counting_filter>, <enderio:item_redstone_sensor_filter>, <enderio:item_redstone_timer_filter>);
	ZenScroll.add(<mia:packed_paper:*>);
	ZenScroll.add(<minecraft:bedrock>, <dcs_climate:dcs_ore_gemblock:12>, <dcs_climate:dcs_build_bricks:3>);
	//ZenScroll.add(<minecraft:end_stone>, <minecraft:end_bricks>);
	ZenScroll.add(<minecraft:glass>, <tconstruct:clear_glass>);
	ZenScroll.add(<minecraft:prismarine:*>);
	ZenScroll.add(<minecraft:purpur_block>, <minecraft:purpur_pillar>);
	ZenScroll.add(<minecraft:quartz_block:*>);
	ZenScroll.add(<minecraft:red_sandstone:*>);
	ZenScroll.add(<minecraft:sandstone:*>);
	ZenScroll.add(<minecraft:stone:1>, <railcraft:granite:*>);
	ZenScroll.add(<minecraft:stone:3>, <railcraft:diorite:*>);
	ZenScroll.add(<minecraft:stone:5>, <railcraft:andesite:*>);
	ZenScroll.add(<minecraft:stone>, <minecraft:stonebrick:*>, <twilightforest:stone_twist>, <twilightforest:stone_twist_thin>);
	ZenScroll.add(<ore:blockAluminum>);
	ZenScroll.add(<ore:blockBrass>, <railcraft:metal:9>);
	ZenScroll.add(<ore:blockBronze>, <railcraft:metal:5>);
	ZenScroll.add(<ore:blockCopper>, <railcraft:metal:0>);
	ZenScroll.add(<ore:blockInvar>, <railcraft:metal:7>);
	ZenScroll.add(<ore:blockLead>, <railcraft:metal:2>);
	ZenScroll.add(<ore:blockNickel>, <railcraft:metal:6>);
	ZenScroll.add(<ore:blockPeridot>);
	ZenScroll.add(<ore:blockSapphire>);
	ZenScroll.add(<ore:blockSilver>, <railcraft:metal:4>);
	ZenScroll.add(<ore:blockSlimeDirt>);
	ZenScroll.add(<ore:blockSlimeGrass>);
	ZenScroll.add(<ore:blockSteel>, <railcraft:metal:3>);
	ZenScroll.add(<ore:blockTin>, <railcraft:metal:1>);
	ZenScroll.add(<ore:blockZinc>, <railcraft:metal:8>);
	ZenScroll.add(<ore:dustAluminum>);
	ZenScroll.add(<ore:dustCoal>);
	ZenScroll.add(<ore:dustCopper>);
	ZenScroll.add(<ore:dustGold>);
	ZenScroll.add(<ore:dustIron>);
	ZenScroll.add(<ore:dustLead>);
	ZenScroll.add(<ore:dustNickel>);
	ZenScroll.add(<ore:dustObsidian>);
	ZenScroll.add(<ore:dustSilver>);
	ZenScroll.add(<ore:dustSteel>);
	ZenScroll.add(<ore:dustTin>);
	ZenScroll.add(<ore:dustWood>);
	ZenScroll.add(<ore:gearBrass>);
	ZenScroll.add(<ore:gearInvar>);
	ZenScroll.add(<ore:gearIron>);
	ZenScroll.add(<ore:gearSteel>);
	ZenScroll.add(<ore:gearStone>);
	ZenScroll.add(<ore:gearWood>);
	ZenScroll.add(<ore:gemAmethyst>);
	ZenScroll.add(<ore:gemMalachite>);
	ZenScroll.add(<ore:gemPeridot>);
	ZenScroll.add(<ore:gemRuby>);
	ZenScroll.add(<ore:gemSapphire>);
	ZenScroll.add(<ore:gemTopaz>);
	ZenScroll.add(<ore:ingotAluminum>);
	ZenScroll.add(<ore:ingotBrass>);
	ZenScroll.add(<ore:ingotBronze>);
	ZenScroll.add(<ore:ingotCopper>);
	ZenScroll.add(<ore:ingotLead>);
	ZenScroll.add(<ore:ingotNickel>);
	ZenScroll.add(<ore:ingotSilver>);
	ZenScroll.add(<ore:ingotSteel>);
	ZenScroll.add(<ore:ingotTin>);
	ZenScroll.add(<ore:ingotZinc>);
	ZenScroll.add(<ore:nuggetBronze>);
	ZenScroll.add(<ore:nuggetCopper>);
	ZenScroll.add(<ore:nuggetLead>);
	ZenScroll.add(<ore:nuggetNickel>);
	ZenScroll.add(<ore:nuggetSilver>);
	ZenScroll.add(<ore:nuggetSteel>);
	ZenScroll.add(<ore:nuggetTin>);
	ZenScroll.add(<ore:plateBronze>);
	ZenScroll.add(<ore:plateCopper>);
	ZenScroll.add(<ore:plateGold>);
	ZenScroll.add(<ore:plateIron>);
	ZenScroll.add(<ore:plateLead>);
	ZenScroll.add(<ore:plateNickel>);
	ZenScroll.add(<ore:plateSilver>);
	ZenScroll.add(<ore:plateSteel>);
	ZenScroll.add(<ore:plateTin>);
	ZenScroll.add(<railcraft:badlands:*>);
	ZenScroll.add(<railcraft:bleachedbone:*>);
	ZenScroll.add(<railcraft:bloodstained:*>);
	ZenScroll.add(<railcraft:frostbound:*>);
	ZenScroll.add(<railcraft:infernal:*>);
	ZenScroll.add(<railcraft:jaded:*>);
	ZenScroll.add(<railcraft:nether:*>);
	ZenScroll.add(<railcraft:pearlized:*>);
	ZenScroll.add(<railcraft:red_nether:*>);
	ZenScroll.add(<railcraft:sandy:*>);
	ZenScroll.add(<tconstruct:brownstone:*>);
	ZenScroll.add(<tconstruct:seared:*>);
	ZenScroll.add(<tconstruct:soil:0>, <gohd_tweaks:grout_formed:*>);
	ZenScroll.add(<twilightforest:castle_brick:*>, <twilightforest:castle_pillar:*>);
	ZenScroll.add(<twilightforest:deadrock:*>);
	ZenScroll.add(<twilightforest:maze_stone:*>);
	ZenScroll.add(<twilightforest:miniature_structure:*>);
	ZenScroll.add(<twilightforest:naga_stone:*>, <twilightforest:etched_nagastone>, <twilightforest:nagastone_pillar>, <twilightforest:etched_nagastone_mossy>, <twilightforest:etched_nagastone_weathered>, <twilightforest:nagastone_pillar_weathered>);
	ZenScroll.add(<twilightforest:terrorcotta_circle>, <twilightforest:terrorcotta_diagonal>);
	ZenScroll.add(<twilightforest:tower_wood:*>);
	ZenScroll.add(<twilightforest:underbrick:*>);

//読み込みの完了をログに出力
print("zenScroll.zs loaded!");
