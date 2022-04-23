#======================================================================
# name : oredict.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : scripts for adding and removing ore dictionary
#======================================================================

#priority 98

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

//各種modからclassをimport
import mods.chisel.Carving as chisel;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading oredict.zs ...");

//変数の定義

//鉱石辞書の削除
    <ore:dustIron>.remove(<bloodmagic:component:19>);
    <ore:dustGold>.remove(<bloodmagic:component:20>);
    <ore:dustCoal>.remove(<bloodmagic:component:21>);
    <ore:dustSulfur>.remove(<bloodmagic:component:23>);
    <ore:dustSaltpeter>.remove(<bloodmagic:component:24>);

    //<ore:gearDark>.remove(<enderio:item_material:73>);

    <ore:blockStone>.remove(<evilcraft:bloody_cobblestone>);
    <ore:dyeRed>.remove(<evilcraft:hardened_blood_shard>);
    <ore:stickWood>.remove(<evilcraft:dark_stick>);

    <ore:circuitLv>.remove(<metaitem:circuit.microprocessor>);
    <ore:circuitExtreme>.remove(<metaitem:circuit.workstation>);
    //<ore:gemManaDiamond>.remove(<metaitem:gemManaDiamond>);
    <ore:stickLivingwood>.remove(<metaitem:stickLivingwood>);
    <ore:stickDreamrock>.remove(<metaitem:stickDreamwood>);

    <ore:chest>.remove(<minecraft:ender_chest>);

//鉱石辞書の追加
    <ore:fanSteel>.add(<metaitem:rotorSteel>);

    <ore:gemManaPearl>.add(<botania:manaresource:1>);
    <ore:gemManaDiamond>.add(<botania:manaresource:2>);
    <ore:stickLivingwood>.add(<botania:manaresource:3>);
    <ore:gemDragonStone>.add(<botania:manaresource:9>);
    <ore:stickDreamwood>.add(<botania:manaresource:13>);
    <ore:blockManasteel>.add(<botania:storage:0>);
    <ore:blockTerrasteel>.add(<botania:storage:1>);
    <ore:blockElvenElementium>.add(<botania:storage:2>);
    <ore:blockManaDiamond>.add(<botania:storage:3>);
    <ore:blockDragonStone>.add(<botania:storage:4>);
    <ore:blockLivingwood>.add(<botania:livingwood:0>);
    <ore:blockLivingrock>.add(<botania:livingrock:0>);
    <ore:blockDreamwood>.add(<botania:dreamwood:0>);
    <ore:blockDreamrock>.add(<botanicadds:dreamrock:0>);

    <ore:livingwoodTwig>.add(<metaitem:stickLivingwood>);
    <ore:dreamwoodTwig>.add(<metaitem:stickDreamwood>);

//ASの大理石の鉱石辞書を改変
chisel.addGroup("marble_astral");
for i in 0 to 6 {
    var marbleAstral as IItemStack = <astralsorcery:blockmarble>.definition.makeStack(i);
    HiiragiUtils.removeCrafting(marbleAstral);
    HiiragiUtils.removeOreDict(marbleAstral);
    <ore:blockMarbleAstral>.add(marbleAstral);
    chisel.removeVariation("marble", marbleAstral);
    chisel.addVariation("marble_astral", marbleAstral);
}

//GTCEuの素材一覧から登録を外す
val toRemove as IItemStack[] = [
    <metaitem:ingotManasteel>,
    <metaitem:nuggetManasteel>,
    <metaitem:blockManasteel>,
    <metaitem:ingotTerrasteel>,
    <metaitem:nuggetTerrasteel>,
    <metaitem:blockTerrasteel>,
    <metaitem:ingotElvenElementium>,
    <metaitem:nuggetElvenElementium>,
    <metaitem:blockElvenElementium>,
    <metaitem:gemDark>,
    <metaitem:gemDarkPower>,
    <metaitem:gemAquamarine>,
    <metaitem:ingotAstralStarmetal>,
    <metaitem:dustAstralStarmetal>,
];

for i in toRemove {
    HiiragiUtils.removeOreDict(i);
    HiiragiUtils.removeFromJEI(i);
}

//GTCEu製のツール類に鉱石辞書を割り振りなおす
    val toolOredict as IItemStack[][IOreDictEntry] = {
        <ore:GT.tool.saw>:[
            <gregtech:meta_tool:5>,
            <gregtech:meta_tool:25>,
            <gregtech:meta_tool:26>,
            <gregtech:meta_tool:27>,
            <gregtech:meta_tool:32>
        ],
        <ore:GT.tool.hammer.hard>:[
            <gregtech:meta_tool:6>
        ],
        <ore:GT.tool.hammer.soft>:[
            <gregtech:meta_tool:7>
        ],
        <ore:GT.tool.wrench>:[
            <gregtech:meta_tool:8>,
            <gregtech:meta_tool:28>,
            <gregtech:meta_tool:29>,
            <gregtech:meta_tool:30>
        ],
        <ore:GT.tool.file>:[
            <gregtech:meta_tool:9>
        ],
        <ore:GT.tool.crowbar>:[
            <gregtech:meta_tool:10>
        ],
        <ore:GT.tool.screw>:[
            <gregtech:meta_tool:11>,
            <gregtech:meta_tool:31>
        ],
        <ore:GT.tool.mortar>:[
            <gregtech:meta_tool:12>
        ],
        <ore:GT.tool.wirecutter>:[
            <gregtech:meta_tool:13>
        ],
        <ore:GT.tool.knife>:[
            <gregtech:meta_tool:14>
        ]
    };

    for oredict, tool in toolOredict {
        for i in tool {
            oredict.add(i.withEmptyTag());
        }
    }

//各種鉱石をグループ分けする
    val oreGroup as IItemStack[][string] = {
        "Aluminium" : [<gregtech:ore_aluminium_0:*>,
                    <gregtech:ore_bauxite_0:*>,
                    <gregtech:ore_green_sapphire_0:*>,
                    <gregtech:ore_sapphire_0:*>,
                    <gregtech:ore_spodumene_0:*>,
                    <gregtech:ore_lepidolite_0:*>,
                    <gregtech:ore_glauconite_sand_0:*>,
                    <gregtech:ore_mica_0:*>,
                    <gregtech:ore_alunite_0:*>,
                    <gregtech:ore_kyanite_0:*>,
                    <gregtech:ore_pollucite_0:*>,
                    <gregtech:ore_zeolite_0:*>],
        "Beryllium" : [<gregtech:ore_beryllium_0:*>,
                    <gregtech:ore_emerald_0:*>],
        "Cobalt" : [<gregtech:ore_cobalt_0:*>,
                    <gregtech:ore_cobaltite_0:*>],
        "Copper" : [<gregtech:ore_copper_0:*>,
                    <gregtech:ore_chalcopyrite_0:*>,
                    <gregtech:ore_tetrahedrite_0:*>,
                    <gregtech:ore_bornite_0:*>,
                    <gregtech:ore_chalcocite_0:*>,
                    <gregtech:ore_malachite_0:*>],
        "Iron" : [<gregtech:ore_iron_0:*>,
                <gregtech:ore_banded_iron_0:*>,
                <gregtech:ore_brown_limonite_0:*>,
                <gregtech:ore_magnetite_0:*>,
                <gregtech:ore_pyrite_0>,
                <gregtech:ore_yellow_limonite_0:*>,
                <gregtech:ore_vanadium_magnetite_0:*>,
                <gregtech:ore_diatomite_0:*>,
                <gregtech:ore_granitic_mineral_sand_0:*>,
                <gregtech:ore_basaltic_mineral_sand_0:*>],
        "Lead" : [<gregtech:ore_lead_0:*>,
                <gregtech:ore_galena_0:*>,
                <gregtech:ore_pitchblende_0:*>],
        "Lithium" : [<gregtech:ore_lithium_0:*>,
                    <gregtech:ore_spodumene_0:*>,
                    <gregtech:ore_tungstate_0:*>,
                    <gregtech:ore_lepidolite_0:*>],
        "Molybdenium" : [<gregtech:ore_molybdenum_0:*>,
                        <gregtech:ore_molybdenite_0:*>,
                        <gregtech:ore_powellite_0:*>,
                        <gregtech:ore_wulfenite_0:*>],
        "Nickel" : [<gregtech:ore_nickel_0:*>,
                    <gregtech:ore_garnierite_0:*>,
                    <gregtech:ore_pentlandite_0:*>],
        "Sulfur" : [<gregtech:ore_sulfur_0:*>,
                    <gregtech:ore_realgar_0:*>,
                    <gregtech:ore_gypsum_0:*>],
        "Tin" : [<gregtech:ore_tin_0:*>,
                <gregtech:ore_cassiterite_0:*>,
                <gregtech:ore_cassiterite_sand_0:*>],
        "Quartz" : [<gregtech:ore_certus_quartz_0:*>,
                    <gregtech:ore_nether_quartz_0:*>,
                    <gregtech:ore_quartzite_0:*>,
                    <gregtech:ore_opal_0:*>,
                    <gregtech:ore_amethyst_0:*>],
        "Garnet" : [<gregtech:ore_almandine_0:*>,
                    <gregtech:ore_grossular_0:*>,
                    <gregtech:ore_pyrope_0:*>,
                    <gregtech:ore_spessartine_0:*>,
                    <gregtech:ore_garnet_red_0:*>,
                    <gregtech:ore_garnet_yellow_0:*>,
                    <gregtech:ore_garnet_sand_0:*>],
        "Topaz" : [<gregtech:ore_blue_topaz_0:*>,
                <gregtech:ore_topaz_0:*>],
        "Fluorine" : [<gregtech:ore_blue_topaz_0:*>,
                    <gregtech:ore_topaz_0:*>,
                    <gregtech:ore_bastnasite_0>,
                    <gregtech:ore_lepidolite_0:*>],
        "Calcium" : [<gregtech:ore_calcite_0:*>,
                    <gregtech:ore_pyrochlore_0:*>,
                    <gregtech:ore_apatite_0>,
                    <gregtech:ore_tricalcium_phosphate_0:*>,
                    <gregtech:ore_gypsum_0:*>,
                    <gregtech:ore_zeolite_0:*>],
        "Coal" : [<gregtech:ore_coal_0:*>,
                <gregtech:ore_diamond_0:*>,
                <gregtech:ore_graphite_0:*>],
        "Sapphire" : [<gregtech:ore_green_sapphire_0:*>,
                    <gregtech:ore_sapphire_0:*>,
                    <gregtech:ore_diatomite_0:*>],
        "Lapis" : [<gregtech:ore_lazurite_0:*>,
                <gregtech:ore_sodalite_0:*>,
                <gregtech:ore_lapis_0:*>],
        "Magnesium" : [<gregtech:ore_asbestos_0:*>,
                    <gregtech:ore_magnesite_0:*>,
                    <gregtech:ore_glauconite_sand_0:*>,
                    <gregtech:ore_talc_0:*>,
                    <gregtech:ore_soapstone_0:*>,
                    <gregtech:ore_olivine_0:*>,
                    <gregtech:ore_bentonite_0:*>,
                    <gregtech:ore_fullers_earth_0:*>],
        "Salt" : [<gregtech:ore_rock_salt_0:*>,
                <gregtech:ore_saltpeter_0:*>,
                <gregtech:ore_trona_0:*>],
        "Tungsten" : [<gregtech:ore_scheelite_0:*>,
                    <gregtech:ore_tungstate_0:*>],
        "Antimony" : [<gregtech:ore_stibnite_0:*>,
                    <gregtech:ore_tetrahedrite_0:*>],
        "Uranium" : [<gregtech:ore_uraninite_0:*>,
                    <gregtech:ore_pitchblende_0:*>],
        "Phosphor" : [<gregtech:ore_apatite_0:*>,
                    <gregtech:ore_tricalcium_phosphate_0:*>,
                    <gregtech:ore_monazite_0:*>]
    };

    for name, item in oreGroup {
        for i in item {
            var oreDict as IOreDictEntry = oreDict.get("oreGroup" ~ name);
            oreDict.add(item);
        }
    }

//このscriptの読み込みの完了をログに出力
print("oredict.zs loaded!");
