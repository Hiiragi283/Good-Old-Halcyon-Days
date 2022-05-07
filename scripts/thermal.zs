#======================================================================
# ファイル名 : thermal.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : このファイルについて書く
#======================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.ctintegration.util.RecipePattern;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading thermal.zs ...");

//変数の定義
    val removeFromJEI as IItemStack[] = [
        <thermalfoundation:storage:*>,
        <thermalfoundation:storage_alloy:*>,
        //<thermalfoundation:material:0>,
        //<thermalfoundation:material:1>,
        //<thermalfoundation:material:22>,
        //<thermalfoundation:material:23>,
        //<thermalfoundation:material:24>,
        //<thermalfoundation:material:25>,
        //<thermalfoundation:material:26>,
        //<thermalfoundation:material:27>,
        <thermalfoundation:material:32>,
        <thermalfoundation:material:33>,
        <thermalfoundation:material:64>,
        <thermalfoundation:material:65>,
        <thermalfoundation:material:66>,
        <thermalfoundation:material:67>,
        <thermalfoundation:material:68>,
        <thermalfoundation:material:69>,
        <thermalfoundation:material:70>,
        <thermalfoundation:material:71>,
        //<thermalfoundation:material:72>, //Pulverized Mana Infused Metal
        <thermalfoundation:material:96>,
        <thermalfoundation:material:97>,
        <thermalfoundation:material:98>,
        <thermalfoundation:material:99>,
        //<thermalfoundation:material:100>, //Constantan Blend
        //<thermalfoundation:material:101>, //Signalum blend
        //<thermalfoundation:material:102>, //Lumium Blend
        //<thermalfoundation:material:103>, //Enderium Belnd
        <thermalfoundation:material:128>,
        <thermalfoundation:material:129>,
        <thermalfoundation:material:130>,
        <thermalfoundation:material:131>,
        <thermalfoundation:material:132>,
        <thermalfoundation:material:133>,
        <thermalfoundation:material:134>,
        <thermalfoundation:material:135>,
        //<thermalfoundation:material:136>, //Mana Infused Ingot
        <thermalfoundation:material:160>,
        <thermalfoundation:material:161>,
        <thermalfoundation:material:162>,
        <thermalfoundation:material:163>,
        //<thermalfoundation:material:164>, //Constantan Ingot
        //<thermalfoundation:material:165>, //Signalum Ingot
        //<thermalfoundation:material:166>, //Lumium Ingot
        //<thermalfoundation:material:167>, //Enderium Ingot
        <thermalfoundation:material:192>,
        <thermalfoundation:material:193>,
        <thermalfoundation:material:194>,
        <thermalfoundation:material:195>,
        <thermalfoundation:material:196>,
        <thermalfoundation:material:197>,
        <thermalfoundation:material:198>,
        <thermalfoundation:material:199>,
        //<thermalfoundation:material:200>, //Mana Infused Nugget
        <thermalfoundation:material:224>,
        <thermalfoundation:material:225>,
        <thermalfoundation:material:226>,
        <thermalfoundation:material:227>,
        //<thermalfoundation:material:228>, //Constantan Nugget
        //<thermalfoundation:material:229>, //Signalum Nugget
        //<thermalfoundation:material:230>, //Lumium Nugget
        //<thermalfoundation:material:231>, //Enderium Nugget
        <thermalfoundation:material:256>,
        <thermalfoundation:material:257>,
        <thermalfoundation:material:258>,
        <thermalfoundation:material:259>,
        <thermalfoundation:material:260>,
        <thermalfoundation:material:261>,
        <thermalfoundation:material:262>,
        <thermalfoundation:material:263>,
        //<thermalfoundation:material:264>, //mana Infused Gear
        <thermalfoundation:material:288>,
        <thermalfoundation:material:289>,
        <thermalfoundation:material:290>,
        <thermalfoundation:material:291>,
        //<thermalfoundation:material:292>, //Constantan Gear
        //<thermalfoundation:material:293>, //Signalum Gear
        //<thermalfoundation:material:294>, //Lumium Gear
        //<thermalfoundation:material:295>, //Enderium Gear
        <thermalfoundation:material:320>,
        <thermalfoundation:material:321>,
        <thermalfoundation:material:322>,
        <thermalfoundation:material:323>,
        <thermalfoundation:material:324>,
        <thermalfoundation:material:325>,
        <thermalfoundation:material:326>,
        <thermalfoundation:material:327>,
        //<thermalfoundation:material:328>, //Mana Infused Plate
        <thermalfoundation:material:352>,
        <thermalfoundation:material:353>,
        <thermalfoundation:material:354>,
        <thermalfoundation:material:355>,
        //<thermalfoundation:material:356>, //Constantan Plate
        //<thermalfoundation:material:357>, //Signalum Plate
        //<thermalfoundation:material:358>, //Lumium Plate
        //<thermalfoundation:material:359>, //dEnderium Plate
        <thermalfoundation:material:768>,
        <thermalfoundation:material:769>,
        <thermalfoundation:material:770>,
        <thermalfoundation:material:771>,
        <thermalfoundation:material:772>,
        //<thermalfoundation:material:800>,
        //<thermalfoundation:material:802>,
    ];
    for i in removeFromJEI {
        HiiragiUtils.removeFromJEI(i);
        HiiragiUtils.removeOreDict(i);
    }

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

//このscriptの読み込みの完了をログに出力
print("thermal.zs loaded!");
