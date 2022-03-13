#======================================================================
# name : oredict.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : scripts for adding and removing ore dictionary
#======================================================================

#priority 98

#crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

#各種modからclassをimport

#scriptのimport
import scripts.HiiragiUtils;

#このscriptの読み込みの開始をログに出力
print("Start loading oredict.zs ...");

#変数の定義

#鉱石辞書の削除

#鉱石辞書の追加

#GTCEu製のツール類に鉱石辞書を割り振りなおす
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

#各種鉱石をグループ分けする
val oreGroup as IItemStack[string] = {
    "Aluminium" : <gregtech:ore_aluminium_0:*>,
    "Beryllium" : <gregtech:ore_beryllium_0:*>,
    "Cobalt" : <gregtech:ore_cobalt_0:*>,
    "Copper" : <gregtech:ore_copper_0:*>,
    "Gold" : <gregtech:ore_gold_0:*>,
    "Iron" : <gregtech:ore_iron_0:*>,
    "Lead" : <gregtech:ore_lead_0:*>,
    "Lithium" : <gregtech:ore_lithium_0:*>,
    "Molybdenium" : <gregtech:ore_molybdenum_0:*>,
    "Neodymium" : <gregtech:ore_neodymium_0:*>,
    "Nickel" : <gregtech:ore_nickel_0:*>,
    "Palladium" : <gregtech:ore_palladium_0:*>,
    "Platinum" : <gregtech:ore_platinum_0:*>,
    "Plutonium" : <gregtech:ore_plutonium_0:*>,
    "Silver" : <gregtech:ore_silver_0:*>,
    "Sulfur" : <gregtech:ore_sulfur_0:*>,
    "Thorium" : <gregtech:ore_thorium_0:*>,
    "Tin" : <gregtech:ore_tin_0:*>
};

for name, item in oreGroup {
    var oreDict as IOreDictEntry = oreDict.get("oreGroup" ~ name);
    oreDict.add(item);
}

#このscriptの読み込みの完了をログに出力
print("oredict.zs loaded!");
