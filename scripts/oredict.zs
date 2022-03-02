#======================================================================
# name : oredict.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : scripts for adding and removing ore dictionary
#======================================================================

#priority 90

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

//各種modからclassをimport

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading oredict.zs ...");

//変数の定義

//レシピの編集

//鉱石辞書の削除

//鉱石辞書の追加
<ore:blockGrout>.add(<tconstruct:soil:0>);
<ore:dustGrout>.add(<contenttweaker:grout_dust>);
<ore:ingotGrout>.add(<contenttweaker:grout_ingot>);

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

//このscriptの読み込みの完了をログに出力
print("oredict.zs loaded!");
