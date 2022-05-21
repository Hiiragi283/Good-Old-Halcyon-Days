#======================================================================
# name : misc.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : scripts for mics
#======================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import mods.gregtech.recipe.RecipeMap;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading misc.zs ...");

//変数の定義

//作業台レシピの編集
    //削除
        val removeCrafting as IItemStack[] = [];
        for i in removeCrafting {
            HiiragiUtils.removeCrafting(i);
        }
    //上書き
    //新規

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

//GTレシピの編集
    //削除
    //上書き
    //新規

//tooltipの編集
    <tconstruct:pattern>.addTooltip(I18n.format("gohd.tooltip.wooden_pattern.name"));
    <gregtech:meta_item_1:347>.addTooltip(I18n.format("gohd.tooltip.wooden_form.name"));
    <tconstruct:cast>.addTooltip(I18n.format("gohd.tooltip.cast_chisel.name"));
    <tconstruct:smeltery_controller>.addTooltip(I18n.format("gohd.tooltip.smeltery_controller.name"));
    <tconstruct:seared_slab:*>.addTooltip(I18n.format("tile.tconstruct.seared.tooltip"));
    <tconstruct:seared_slab2:*>.addTooltip(I18n.format("tile.tconstruct.seared.tooltip"));

//Slabのレシピを抜本的に改変
    val mapSlabs as IItemStack[IItemStack] = {
        <minecraft:stone_slab:0>: <minecraft:stone:0>,
        <minecraft:stone_slab:1>: <minecraft:sandstone:0>,
        <minecraft:stone_slab:3>: <minecraft:cobblestone>,
        <minecraft:stone_slab:4>: <minecraft:brick_block>,
        <minecraft:stone_slab:5>: <minecraft:stonebrick:0>,
        <minecraft:stone_slab:6>: <minecraft:nether_brick>,
        <minecraft:stone_slab:7>: <minecraft:quartz_block:0>,
        <minecraft:wooden_slab:0>: <minecraft:planks:0>,
        <minecraft:wooden_slab:1>: <minecraft:planks:1>,
        <minecraft:wooden_slab:2>: <minecraft:planks:2>,
        <minecraft:wooden_slab:3>: <minecraft:planks:3>,
        <minecraft:wooden_slab:4>: <minecraft:planks:4>,
        <minecraft:wooden_slab:5>: <minecraft:planks:5>,
        <minecraft:stone_slab2:0>: <minecraft:red_sandstone:0>,
        <minecraft:purpur_slab>: <minecraft:purpur_block>,
        <appliedenergistics2:sky_stone_slab>: <appliedenergistics2:sky_stone_block>,
        <appliedenergistics2:smooth_sky_stone_slab>: <appliedenergistics2:smooth_sky_stone_block>,
        <appliedenergistics2:sky_stone_brick_slab>: <appliedenergistics2:sky_stone_brick>,
        <appliedenergistics2:sky_stone_small_brick_slab>: <appliedenergistics2:sky_stone_small_brick>,
        <appliedenergistics2:fluix_slab>: <appliedenergistics2:fluix_block>,
        <appliedenergistics2:quartz_slab>: <appliedenergistics2:quartz_block>,
        <appliedenergistics2:chiseled_quartz_slab>: <appliedenergistics2:chiseled_quartz_block>,
        <appliedenergistics2:quartz_pillar_slab>: <appliedenergistics2:quartz_pillar>,
        <astralsorcery:blockmarbleslab>: <astralsorcery:blockmarble:1>,
        <biomesoplenty:other_slab>: <biomesoplenty:mud_brick_block>,
        <biomesoplenty:other_slab:1>: <biomesoplenty:white_sandstone>,
        <biomesoplenty:wood_slab_0:0>: <biomesoplenty:planks_0:0>,
        <biomesoplenty:wood_slab_0:1>: <biomesoplenty:planks_0:1>,
        <biomesoplenty:wood_slab_0:2>: <biomesoplenty:planks_0:2>,
        <biomesoplenty:wood_slab_0:3>: <biomesoplenty:planks_0:3>,
        <biomesoplenty:wood_slab_0:4>: <biomesoplenty:planks_0:4>,
        <biomesoplenty:wood_slab_0:5>: <biomesoplenty:planks_0:5>,
        <biomesoplenty:wood_slab_0:6>: <biomesoplenty:planks_0:6>,
        <biomesoplenty:wood_slab_0:7>: <biomesoplenty:planks_0:7>,
        <biomesoplenty:wood_slab_1:0>: <biomesoplenty:planks_0:8>,
        <biomesoplenty:wood_slab_1:1>: <biomesoplenty:planks_0:9>,
        <biomesoplenty:wood_slab_1:2>: <biomesoplenty:planks_0:10>,
        <biomesoplenty:wood_slab_1:3>: <biomesoplenty:planks_0:11>,
        <biomesoplenty:wood_slab_1:4>: <biomesoplenty:planks_0:12>,
        <biomesoplenty:wood_slab_1:5>: <biomesoplenty:planks_0:13>,
        <biomesoplenty:wood_slab_1:6>: <biomesoplenty:planks_0:14>,
        <biomesoplenty:wood_slab_1:7>: <biomesoplenty:planks_0:15>,
        <botania:livingwood0slab>: <botania:livingwood:0>,
        <botania:livingwood1slab>: <botania:livingwood:1>,
        <botania:livingrock0slab>: <botania:livingrock:0>,
        <botania:livingrock1slab>: <botania:livingrock:1>,
        <botania:dreamwood0slab>: <botania:dreamwood:0>,
        <botania:dreamwood1slab>: <botania:dreamwood:1>,
        <botania:quartzslabdarkhalf>: <botania:quartztypedark>,
        <botania:quartzslabmanahalf>: <botania:quartztypemana>,
        <botania:quartzslabblazehalf>: <botania:quartztypeblaze>,
        <botania:quartzslablavenderhalf>: <botania:quartztypelavender>,
        <botania:quartzslabredhalf>: <botania:quartztypered>,
        <botania:quartzslabelfhalf>: <botania:quartztypeelf>,
        <botania:quartzslabsunnyhalf>: <botania:quartztypesunny>,
        <botania:biomestonea0slab>: <botania:biomestonea:0>,
        <botania:biomestonea1slab>: <botania:biomestonea:1>,
        <botania:biomestonea2slab>: <botania:biomestonea:2>,
        <botania:biomestonea3slab>: <botania:biomestonea:3>,
        <botania:biomestonea4slab>: <botania:biomestonea:4>,
        <botania:biomestonea5slab>: <botania:biomestonea:5>,
        <botania:biomestonea6slab>: <botania:biomestonea:6>,
        <botania:biomestonea7slab>: <botania:biomestonea:7>,
        <botania:biomestonea8slab>: <botania:biomestonea:8>,
        <botania:biomestonea9slab>: <botania:biomestonea:9>,
        <botania:biomestonea10slab>: <botania:biomestonea:10>,
        <botania:biomestonea11slab>: <botania:biomestonea:11>,
        <botania:biomestonea12slab>: <botania:biomestonea:12>,
        <botania:biomestonea13slab>: <botania:biomestonea:13>,
        <botania:biomestonea14slab>: <botania:biomestonea:14>,
        <botania:biomestonea15slab>: <botania:biomestonea:15>,
        <botania:biomestoneb0slab>: <botania:biomestoneb:0>,
        <botania:biomestoneb1slab>: <botania:biomestoneb:1>,
        <botania:biomestoneb2slab>: <botania:biomestoneb:2>,
        <botania:biomestoneb3slab>: <botania:biomestoneb:3>,
        <botania:biomestoneb4slab>: <botania:biomestoneb:4>,
        <botania:biomestoneb5slab>: <botania:biomestoneb:5>,
        <botania:biomestoneb6slab>: <botania:biomestoneb:6>,
        <botania:biomestoneb7slab>: <botania:biomestoneb:7>,
        <botania:pavement0slab>: <botania:pavement:0>,
        <botania:pavement1slab>: <botania:pavement:1>,
        <botania:pavement2slab>: <botania:pavement:2>,
        <botania:pavement3slab>: <botania:pavement:3>,
        <botania:pavement4slab>: <botania:pavement:4>,
        <botania:pavement5slab>: <botania:pavement:5>,
        <botania:shimmerrock0slab>: <botania:shimmerrock>,
        <botania:shimmerwoodplanks0slab>: <botania:shimmerwoodplanks>,
        <thaumcraft:slab_arcane_stone>: <thaumcraft:stone_arcane>,
        <thaumcraft:slab_arcane_brick>: <thaumcraft:stone_arcane_brick>,
        <thaumcraft:slab_ancient>: <thaumcraft:stone_ancient>,
        <thaumcraft:slab_eldritch>: <thaumcraft:stone_eldritch_tile>,
        <thaumcraft:slab_greatwood>: <thaumcraft:plank_greatwood>,
        <thaumcraft:slab_silverwood>: <thaumcraft:plank_silverwood>,
        <thaumicaugmentation:slab>: <thaumcraft:stone_ancient_tile>,
        <twilightforest:aurora_slab>: <twilightforest:aurora_block>,
        <twilightforest:twilight_oak_slab>: <twilightforest:twilight_oak_planks:0>,
        <twilightforest:canopy_slab>: <twilightforest:canopy_planks:0>,
        <twilightforest:mangrove_slab>: <twilightforest:mangrove_planks:0>,
        <twilightforest:dark_slab>: <twilightforest:dark_planks:0>,
        <twilightforest:time_slab>: <twilightforest:time_planks:0>,
        <twilightforest:trans_slab>: <twilightforest:trans_planks:0>,
        <twilightforest:mine_slab>: <twilightforest:mine_planks:0>,
        <twilightforest:sort_slab>: <twilightforest:sort_planks:0>,
        <tcomplement:scorched_slab:0>: <tcomplement:scorched_block:0>,
        <tcomplement:scorched_slab:1>: <tcomplement:scorched_block:1>,
        <tcomplement:scorched_slab:2>: <tcomplement:scorched_block:2>,
        <tcomplement:scorched_slab:3>: <tcomplement:scorched_block:3>,
        <tcomplement:scorched_slab:4>: <tcomplement:scorched_block:4>,
        <tcomplement:scorched_slab:5>: <tcomplement:scorched_block:5>,
        <tcomplement:scorched_slab:6>: <tcomplement:scorched_block:6>,
        <tcomplement:scorched_slab:7>: <tcomplement:scorched_block:7>,
        <tcomplement:scorched_slab2:0>: <tcomplement:scorched_block:8>,
        <tcomplement:scorched_slab2:1>: <tcomplement:scorched_block:9>,
        <tcomplement:scorched_slab2:2>: <tcomplement:scorched_block:10>,
        <tcomplement:scorched_slab2:3>: <tcomplement:scorched_block:11>,
        <tconstruct:deco_ground_slab>: <tconstruct:deco_ground>,
        <tconstruct:firewood_slab:0>: <tconstruct:firewood:0>,
        <tconstruct:firewood_slab:1>: <tconstruct:firewood:1>,
        <tconstruct:seared_slab:0>: <tconstruct:seared:0>,
        <tconstruct:seared_slab:1>: <tconstruct:seared:1>,
        <tconstruct:seared_slab:2>: <tconstruct:seared:2>,
        <tconstruct:seared_slab:3>: <tconstruct:seared:3>,
        <tconstruct:seared_slab:4>: <tconstruct:seared:4>,
        <tconstruct:seared_slab:5>: <tconstruct:seared:5>,
        <tconstruct:seared_slab:6>: <tconstruct:seared:6>,
        <tconstruct:seared_slab:7>: <tconstruct:seared:7>,
        <tconstruct:seared_slab2:0>: <tconstruct:seared:8>,
        <tconstruct:seared_slab2:1>: <tconstruct:seared:9>,
        <tconstruct:seared_slab2:2>: <tconstruct:seared:10>,
        <tconstruct:seared_slab2:3>: <tconstruct:seared:11>,
        <tconstruct:dried_clay_slab:0>: <tconstruct:dried_clay:0>,
        <tconstruct:dried_clay_slab:1>: <tconstruct:dried_clay:1>,
        <tconstruct:brownstone_slab:0>: <tconstruct:brownstone:0>,
        <tconstruct:brownstone_slab:1>: <tconstruct:brownstone:1>,
        <tconstruct:brownstone_slab:2>: <tconstruct:brownstone:2>,
        <tconstruct:brownstone_slab:3>: <tconstruct:brownstone:3>,
        <tconstruct:brownstone_slab:4>: <tconstruct:brownstone:4>,
        <tconstruct:brownstone_slab:5>: <tconstruct:brownstone:5>,
        <tconstruct:brownstone_slab:6>: <tconstruct:brownstone:6>,
        <tconstruct:brownstone_slab:7>: <tconstruct:brownstone:7>,
        <tconstruct:brownstone_slab2:0>: <tconstruct:brownstone:8>,
        <tconstruct:brownstone_slab2:1>: <tconstruct:brownstone:9>,
        <tconstruct:brownstone_slab2:2>: <tconstruct:brownstone:10>,
        <tconstruct:brownstone_slab2:3>: <tconstruct:brownstone:11>,
        <wizardry:wisdom_wood_slab>: <wizardry:wisdom_wood_planks>,
    };

    for slab, full in mapSlabs {
        HiiragiUtils.addCrafting(false, true, slab*2, RecipePattern.init(["AB"]).map({A:<ore:GT.tool.saw>, B:full}).ingredients);
        HiiragiUtils.addCrafting(false, true, full, RecipePattern.init(["A", "A"]).map({A:slab}).ingredients);
        if (full.definition.owner != "minecraft") {
            <recipemap:cutter>.recipeBuilder()
                .inputs([full])
                .fluidInputs([<liquid:lubricant>*1])
                .outputs(slab*2)
                .duration(1.25*20)
                .EUt(7)
                .buildAndRegister();
            <recipemap:cutter>.recipeBuilder()
                .inputs([full])
                .fluidInputs([<liquid:distilled_water>*3])
                .outputs(slab*2)
                .duration(1.85*20)
                .EUt(7)
                .buildAndRegister();
            <recipemap:cutter>.recipeBuilder()
                .inputs([full])
                .fluidInputs([<liquid:water>*4])
                .outputs(slab*2)
                .duration(2.50*20)
                .EUt(7)
                .buildAndRegister();
            <recipemap:compressor>.recipeBuilder()
                .inputs([slab*2])
                .outputs(full)
                .duration(1.50*20)
                .EUt(7)
                .buildAndRegister();
        }
    }
    //重複したレシピの削除
    val removeChiseled as IItemStack[IItemStack] = {
        <minecraft:sandstone:1>: <minecraft:sandstone:0>,
        <minecraft:stonebrick:3>: <minecraft:stonebrick:0>,
        <minecraft:quartz_block:1>: <minecraft:quartz_block:0>,
        <minecraft:red_sandstone:1>: <minecraft:red_sandstone:0>,
        <biomesoplenty:white_sandstone:1>: <biomesoplenty:white_sandstone:0>,
        <botania:quartztypedark:1>: <botania:quartztypedark:0>,
        <botania:quartztypemana:1>: <botania:quartztypemana:0>,
        <botania:quartztypeblaze:1>: <botania:quartztypeblaze:0>,
        <botania:quartztypelavender:1>: <botania:quartztypelavender:0>,
        <botania:quartztypered:1>: <botania:quartztypered:0>,
        <botania:quartztypeelf:1>: <botania:quartztypeelf:0>,
        <botania:quartztypesunny:1>: <botania:quartztypesunny:0>,
    };
    for chiseled, full in removeChiseled {
        HiiragiUtils.addCrafting(false, true, chiseled, RecipePattern.init(["AB"]).map({A:HiiragiUtils.toolInput(<chisel:chisel_iron>, 1), B:full}).ingredients);
        HiiragiUtils.addCrafting(true, false, full, [[chiseled]]);
    }

    val removePillar as IItemStack[IItemStack] = {
        <minecraft:quartz_block:2>: <minecraft:quartz_block:0>,
        <minecraft:purpur_pillar>: <minecraft:purpur_block>,
        <appliedenergistics2:quartz_pillar>: <appliedenergistics2:quartz_block>,
        <botania:quartztypedark:2>: <botania:quartztypedark:0>,
        <botania:quartztypemana:2>: <botania:quartztypemana:0>,
        <botania:quartztypeblaze:2>: <botania:quartztypeblaze:0>,
        <botania:quartztypelavender:2>: <botania:quartztypelavender:0>,
        <botania:quartztypered:2>: <botania:quartztypered:0>,
        <botania:quartztypeelf:2>: <botania:quartztypeelf:0>,
        <botania:quartztypesunny:2>: <botania:quartztypesunny:0>,
        <thaumicaugmentation:stone:8>: <thaumcraft:stone_ancient>,
        <twilightforest:aurora_pillar>: <twilightforest:aurora_block>,
    };
    for pillar, full in removePillar {
        HiiragiUtils.addCrafting(false, true, pillar, RecipePattern.init(["A", "B"]).map({A:HiiragiUtils.toolInput(<chisel:chisel_iron>, 1), B:full}).ingredients);
        HiiragiUtils.addCrafting(true, false, full, [[pillar]]);
    }

//Stairのレシピを抜本的に改変
    val mapStair as IItemStack[IItemStack] = {
        //<minecraft:stone_slab:0>: <minecraft:stone:0>,
        <minecraft:sandstone_stairs>: <minecraft:sandstone:0>,
        <minecraft:stone_stairs>: <minecraft:cobblestone>,
        <minecraft:brick_stairs>: <minecraft:brick_block>,
        <minecraft:stone_brick_stairs>: <minecraft:stonebrick:0>,
        <minecraft:nether_brick_stairs>: <minecraft:nether_brick>,
        <minecraft:quartz_stairs>: <minecraft:quartz_block:0>,
        <minecraft:oak_stairs>: <minecraft:planks:0>,
        <minecraft:spruce_stairs>: <minecraft:planks:1>,
        <minecraft:birch_stairs>: <minecraft:planks:2>,
        <minecraft:jungle_stairs>: <minecraft:planks:3>,
        <minecraft:acacia_stairs>: <minecraft:planks:4>,
        <minecraft:dark_oak_stairs>: <minecraft:planks:5>,
        <minecraft:red_sandstone_stairs>: <minecraft:red_sandstone:0>,
        <minecraft:purpur_stairs>: <minecraft:purpur_block>,
        <appliedenergistics2:sky_stone_stairs>: <appliedenergistics2:sky_stone_block>,
        <appliedenergistics2:smooth_sky_stone_stairs>: <appliedenergistics2:smooth_sky_stone_block>,
        <appliedenergistics2:sky_stone_brick_stairs>: <appliedenergistics2:sky_stone_brick>,
        <appliedenergistics2:sky_stone_small_brick_stairs>: <appliedenergistics2:sky_stone_small_brick>,
        <appliedenergistics2:fluix_stairs>: <appliedenergistics2:fluix_block>,
        <appliedenergistics2:quartz_stairs>: <appliedenergistics2:quartz_block>,
        <appliedenergistics2:chiseled_quartz_stairs>: <appliedenergistics2:chiseled_quartz_block>,
        <appliedenergistics2:quartz_pillar_stairs>: <appliedenergistics2:quartz_pillar>,
        <astralsorcery:blockmarblestairs>: <astralsorcery:blockmarble:1>,
        <biomesoplenty:mud_brick_stairs>: <biomesoplenty:mud_brick_block>,
        <biomesoplenty:white_sandstone_stairs>: <biomesoplenty:white_sandstone>,
        <biomesoplenty:sacred_oak_stairs>: <biomesoplenty:planks_0:0>,
        <biomesoplenty:cherry_stairs>: <biomesoplenty:planks_0:1>,
        <biomesoplenty:umbran_stairs>: <biomesoplenty:planks_0:2>,
        <biomesoplenty:fir_stairs>: <biomesoplenty:planks_0:3>,
        <biomesoplenty:ethereal_stairs>: <biomesoplenty:planks_0:4>,
        <biomesoplenty:magic_stairs>: <biomesoplenty:planks_0:5>,
        <biomesoplenty:mangrove_stairs>: <biomesoplenty:planks_0:6>,
        <biomesoplenty:palm_stairs>: <biomesoplenty:planks_0:7>,
        <biomesoplenty:redwood_stairs>: <biomesoplenty:planks_0:8>,
        <biomesoplenty:willow_stairs>: <biomesoplenty:planks_0:9>,
        <biomesoplenty:pine_stairs>: <biomesoplenty:planks_0:10>,
        <biomesoplenty:hellbark_stairs>: <biomesoplenty:planks_0:11>,
        <biomesoplenty:jacaranda_stairs>: <biomesoplenty:planks_0:12>,
        <biomesoplenty:mahogany_stairs>: <biomesoplenty:planks_0:13>,
        <biomesoplenty:ebony_stairs>: <biomesoplenty:planks_0:14>,
        <biomesoplenty:eucalyptus_stairs>: <biomesoplenty:planks_0:15>,
        <bloodmagic:demon_stairs_1:0>: <bloodmagic:demon_extras:5>,
        <bloodmagic:demon_stairs_1:1>: <bloodmagic:demon_extras:6>,
        <bloodmagic:demon_stairs_2:0>: <bloodmagic:demon_extras:7>,
        <bloodmagic:demon_stairs_2:1>: <bloodmagic:demon_extras:8>,
        <bloodmagic:demon_stairs_3:0>: <bloodmagic:demon_extras:9>,
        <botania:livingwood0stairs>: <botania:livingwood:0>,
        <botania:livingwood1stairs>: <botania:livingwood:1>,
        <botania:livingrock0stairs>: <botania:livingrock:0>,
        <botania:livingrock1stairs>: <botania:livingrock:1>,
        <botania:dreamwood0stairs>: <botania:dreamwood:0>,
        <botania:dreamwood1stairs>: <botania:dreamwood:1>,
        <botania:quartzstairsdark>: <botania:quartztypedark>,
        <botania:quartzstairsmana>: <botania:quartztypemana>,
        <botania:quartzstairsblaze>: <botania:quartztypeblaze>,
        <botania:quartzstairslavender>: <botania:quartztypelavender>,
        <botania:quartzstairsred>: <botania:quartztypered>,
        <botania:quartzstairself>: <botania:quartztypeelf>,
        <botania:quartzstairssunny>: <botania:quartztypesunny>,
        <botania:biomestonea0stairs>: <botania:biomestonea:0>,
        <botania:biomestonea1stairs>: <botania:biomestonea:1>,
        <botania:biomestonea2stairs>: <botania:biomestonea:2>,
        <botania:biomestonea3stairs>: <botania:biomestonea:3>,
        <botania:biomestonea4stairs>: <botania:biomestonea:4>,
        <botania:biomestonea5stairs>: <botania:biomestonea:5>,
        <botania:biomestonea6stairs>: <botania:biomestonea:6>,
        <botania:biomestonea7stairs>: <botania:biomestonea:7>,
        <botania:biomestonea8stairs>: <botania:biomestonea:8>,
        <botania:biomestonea9stairs>: <botania:biomestonea:9>,
        <botania:biomestonea10stairs>: <botania:biomestonea:10>,
        <botania:biomestonea11stairs>: <botania:biomestonea:11>,
        <botania:biomestonea12stairs>: <botania:biomestonea:12>,
        <botania:biomestonea13stairs>: <botania:biomestonea:13>,
        <botania:biomestonea14stairs>: <botania:biomestonea:14>,
        <botania:biomestonea15stairs>: <botania:biomestonea:15>,
        <botania:biomestoneb0stairs>: <botania:biomestoneb:0>,
        <botania:biomestoneb1stairs>: <botania:biomestoneb:1>,
        <botania:biomestoneb2stairs>: <botania:biomestoneb:2>,
        <botania:biomestoneb3stairs>: <botania:biomestoneb:3>,
        <botania:biomestoneb4stairs>: <botania:biomestoneb:4>,
        <botania:biomestoneb5stairs>: <botania:biomestoneb:5>,
        <botania:biomestoneb6stairs>: <botania:biomestoneb:6>,
        <botania:biomestoneb7stairs>: <botania:biomestoneb:7>,
        <botania:pavement0stairs>: <botania:pavement:0>,
        <botania:pavement1stairs>: <botania:pavement:1>,
        <botania:pavement2stairs>: <botania:pavement:2>,
        <botania:pavement3stairs>: <botania:pavement:3>,
        <botania:pavement4stairs>: <botania:pavement:4>,
        <botania:pavement5stairs>: <botania:pavement:5>,
        <botania:shimmerrock0stairs>: <botania:shimmerrock>,
        <botania:shimmerwoodplanks0stairs>: <botania:shimmerwoodplanks>,
        <evilcraft:undead_plank_stairs>: <evilcraft:undead_plank>,
        <evilcraft:reinforced_undead_plank_stairs>: <evilcraft:reinforced_undead_plank>,
        <evilcraft:dark_brick_stairs>: <evilcraft:dark_brick>,
        <evilcraft:dark_blood_brick_stairs>: <evilcraft:dark_blood_brick>,
        <thaumcraft:stairs_arcane>: <thaumcraft:stone_arcane>,
        <thaumcraft:stairs_arcane_brick>: <thaumcraft:stone_arcane_brick>,
        <thaumcraft:stairs_ancient>: <thaumcraft:stone_ancient>,
        <thaumicaugmentation:stairs_eldritch_tile>: <thaumcraft:stone_eldritch_tile>,
        <thaumcraft:stairs_greatwood>: <thaumcraft:plank_greatwood>,
        <thaumcraft:stairs_silverwood>: <thaumcraft:plank_silverwood>,
        <thaumicaugmentation:stairs_ancient>: <thaumcraft:stone_ancient_tile>,
        <twilightforest:castle_stairs_brick>: <twilightforest:castle_brick:0>,
        <twilightforest:castle_stairs_worn>: <twilightforest:castle_brick:1>,
        <twilightforest:castle_stairs_cracked>: <twilightforest:castle_brick:2>,
        <twilightforest:castle_stairs_mossy>: <twilightforest:castle_brick:4>,
        <twilightforest:castle_stairs:0>: <twilightforest:castle_pillar:0>,
        <twilightforest:castle_stairs:8>: <twilightforest:castle_pillar:3>,
        <twilightforest:nagastone_stairs>: <twilightforest:etched_nagastone>,
        <twilightforest:nagastone_stairs_mossy>: <twilightforest:etched_nagastone_mossy>,
        <twilightforest:nagastone_stairs_weathered>: <twilightforest:etched_nagastone_weathered>,
        //<twilightforest:aurora_slab>: <twilightforest:aurora_block>,
        <twilightforest:twilight_oak_stairs>: <twilightforest:twilight_oak_planks:0>,
        <twilightforest:canopy_stairs>: <twilightforest:canopy_planks:0>,
        <twilightforest:mangrove_stairs>: <twilightforest:mangrove_planks:0>,
        <twilightforest:dark_stairs>: <twilightforest:dark_planks:0>,
        <twilightforest:time_stairs>: <twilightforest:time_planks:0>,
        <twilightforest:trans_stairs>: <twilightforest:trans_planks:0>,
        <twilightforest:mine_stairs>: <twilightforest:mine_planks:0>,
        <twilightforest:sort_stairs>: <twilightforest:sort_planks:0>,
        <tcomplement:scorched_stairs_stone>: <tcomplement:scorched_block:0>,
        <tcomplement:scorched_stairs_cobble>: <tcomplement:scorched_block:1>,
        <tcomplement:scorched_stairs_paver>: <tcomplement:scorched_block:2>,
        <tcomplement:scorched_stairs_brick>: <tcomplement:scorched_block:3>,
        <tcomplement:scorched_stairs_brick_cracked>: <tcomplement:scorched_block:4>,
        <tcomplement:scorched_stairs_brick_fancy>: <tcomplement:scorched_block:5>,
        <tcomplement:scorched_stairs_brick_square>: <tcomplement:scorched_block:6>,
        <tcomplement:scorched_stairs_brick_triangle>: <tcomplement:scorched_block:7>,
        <tcomplement:scorched_stairs_brick_small>: <tcomplement:scorched_block:8>,
        <tcomplement:scorched_stairs_road>: <tcomplement:scorched_block:9>,
        <tcomplement:scorched_stairs_tile>: <tcomplement:scorched_block:10>,
        <tcomplement:scorched_stairs_creeper>: <tcomplement:scorched_block:11>,
        <tconstruct:mudbrick_stairs>: <tconstruct:deco_ground>,
        <tconstruct:firewood_stairs>: <tconstruct:firewood:0>,
        <tconstruct:lavawood_stairs>: <tconstruct:firewood:1>,
        <tconstruct:seared_stairs_stone>: <tconstruct:seared:0>,
        <tconstruct:seared_stairs_cobble>: <tconstruct:seared:1>,
        <tconstruct:seared_stairs_paver>: <tconstruct:seared:2>,
        <tconstruct:seared_stairs_brick>: <tconstruct:seared:3>,
        <tconstruct:seared_stairs_brick_cracked>: <tconstruct:seared:4>,
        <tconstruct:seared_stairs_brick_fancy>: <tconstruct:seared:5>,
        <tconstruct:seared_stairs_brick_square>: <tconstruct:seared:6>,
        <tconstruct:seared_stairs_brick_triangle>: <tconstruct:seared:7>,
        <tconstruct:seared_stairs_brick_small>: <tconstruct:seared:8>,
        <tconstruct:seared_stairs_road>: <tconstruct:seared:9>,
        <tconstruct:seared_stairs_tile>: <tconstruct:seared:10>,
        <tconstruct:seared_stairs_creeper>: <tconstruct:seared:11>,
        <tconstruct:dried_clay_stairs>: <tconstruct:dried_clay:0>,
        <tconstruct:dried_brick_stairs>: <tconstruct:dried_clay:1>,
        <tconstruct:brownstone_stairs_smooth>: <tconstruct:brownstone:0>,
        <tconstruct:brownstone_stairs_rough>: <tconstruct:brownstone:1>,
        <tconstruct:brownstone_stairs_paver>: <tconstruct:brownstone:2>,
        <tconstruct:brownstone_stairs_brick>: <tconstruct:brownstone:3>,
        <tconstruct:brownstone_stairs_brick_cracked>: <tconstruct:brownstone:4>,
        <tconstruct:brownstone_stairs_brick_fancy>: <tconstruct:brownstone:5>,
        <tconstruct:brownstone_stairs_brick_square>: <tconstruct:brownstone:6>,
        <tconstruct:brownstone_stairs_brick_triangle>: <tconstruct:brownstone:7>,
        <tconstruct:brownstone_stairs_brick_small>: <tconstruct:brownstone:8>,
        <tconstruct:brownstone_stairs_road>: <tconstruct:brownstone:9>,
        <tconstruct:brownstone_stairs_tile>: <tconstruct:brownstone:10>,
        <tconstruct:brownstone_stairs_creeper>: <tconstruct:brownstone:11>,
        <wizardry:wisdom_wood_stairs>: <wizardry:wisdom_wood_planks>,
    };

    <recipemap:assembler>.findRecipe(1, [<minecraft:planks:0> * 6, <metaitem:circuit.integrated>.withTag({Configuration: 7})], null).remove();
    <recipemap:assembler>.findRecipe(1, [<minecraft:mossy_cobblestone:0> * 6, <metaitem:circuit.integrated>.withTag({Configuration: 7})], null).remove();
    <recipemap:assembler>.findRecipe(1, [<minecraft:brick_block:0> * 6, <metaitem:circuit.integrated>.withTag({Configuration: 7})], null).remove();
    <recipemap:assembler>.findRecipe(1, [<minecraft:stonebrick:0> * 6, <metaitem:circuit.integrated>.withTag({Configuration: 7})], null).remove();
    <recipemap:assembler>.findRecipe(1, [<minecraft:nether_brick:0> * 6, <metaitem:circuit.integrated>.withTag({Configuration: 7})], null).remove();
    <recipemap:assembler>.findRecipe(1, [<minecraft:sandstone:0> * 6, <metaitem:circuit.integrated>.withTag({Configuration: 7})], null).remove();
    <recipemap:assembler>.findRecipe(1, [<minecraft:planks:1> * 6, <metaitem:circuit.integrated>.withTag({Configuration: 7})], null).remove();
    <recipemap:assembler>.findRecipe(1, [<minecraft:planks:2> * 6, <metaitem:circuit.integrated>.withTag({Configuration: 7})], null).remove();
    <recipemap:assembler>.findRecipe(1, [<minecraft:planks:3> * 6, <metaitem:circuit.integrated>.withTag({Configuration: 7})], null).remove();
    <recipemap:assembler>.findRecipe(1, [<minecraft:quartz_block:0> * 6, <metaitem:circuit.integrated>.withTag({Configuration: 7})], null).remove();
    <recipemap:assembler>.findRecipe(1, [<minecraft:planks:4> * 6, <metaitem:circuit.integrated>.withTag({Configuration: 7})], null).remove();
    <recipemap:assembler>.findRecipe(1, [<minecraft:planks:5> * 6, <metaitem:circuit.integrated>.withTag({Configuration: 7})], null).remove();
    <recipemap:assembler>.findRecipe(1, [<minecraft:purpur_block:0> * 6, <metaitem:circuit.integrated>.withTag({Configuration: 7})], null).remove();

    for stair, full in mapStair {
        HiiragiUtils.addCrafting(false, true, stair*4, RecipePattern.init(["AB", "AA"]).map({A:full, B:<ore:GT.tool.saw>}).ingredients);
        HiiragiUtils.addCrafting(false, true, full, RecipePattern.init(["AA", "AA"]).map({A:stair}).ingredients);
        <recipemap:assembler>.recipeBuilder()
            .inputs([full*3])
            .property("circuit", 7)
            .outputs(stair*4)
            .duration(1.25*20)
            .EUt(7)
            .buildAndRegister();
        <recipemap:compressor>.recipeBuilder()
            .inputs([stair*4])
            .outputs(full*3)
            .duration(1.25*20)
            .EUt(7)
            .buildAndRegister();
    }

//このscriptの読み込みの完了をログに出力
print("misc.zs loaded!");
