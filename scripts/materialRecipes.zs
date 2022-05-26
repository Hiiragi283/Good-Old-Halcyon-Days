#======================================================================
# ファイル名 : materialRecipes.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : このファイルについて書く
#======================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDict;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import mods.techreborn.plateBendingMachine;
import mods.techreborn.rollingMachine;
import mods.techreborn.wireMill;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading materialRecipes.zs ...");

//変数の定義

//作業台レシピの編集
    //Small Dust
        val listDustSmall as string[] = [
            "Graphite",
            "GalliumArsenide",
            "Arsenic",
            "Indium",
            "IndiumGalliumPhosphide",
            "Alumina",
            "Rutile",
            "Illumenite",
            "Chromite",
            "StainlessSteel",
            "Magnetite",
            "Cobalt",
            "Cobaltite",
            "Hafnium",
            "Tantalum",
            "TantalumPentoxide",
            "Tantalite",
            "TungstenCarbide",
            "Tungstate",
            "Osmium",
            "Uraninite",
            "RockSalt",
            "Beryllium",
            "Magnalium",
            "Magnesia",
            "CertusQuartz",
            "Quartz",
            "RedstoneAlloy"
        ];
        for i in listDustSmall {
            if(!isNull(oreDict["dust" ~ i].firstItem) && !isNull(oreDict["dustSmall" ~ i].firstItem)) {
                HiiragiUtils.addCrafting(false, false, oreDict["dust" ~ i].firstItem, RecipePattern.init(["AA", "AA"]).map({A:oreDict["dustSmall" ~ i]}).ingredients);
                HiiragiUtils.addCrafting(true, false, oreDict["dustSmall" ~ i].firstItem*4, [[oreDict["dust" ~ i]]]);
            }
        }

    //Dust Block
        HiiragiUtils.addCrafting(false, false, <contenttweaker:dustblock_tantalum_hafnium_carbide>, RecipePattern.init(["AAA", "BBB", "CCC"]).map({A:<ore:dustTantalum>, B:<ore:dustHafnium>, C:<ore:dustCoal>}).ingredients);

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

    //Cable, Wire
        mods.techreborn.wireMill.removeAll();
        val listWire as string[] = [
            "Copper",
            "Aluminum",
            "Tin",
            "Gold",
        ];
        for i in listWire {
            if(!isNull(oreDict["cable" ~ i].firstItem) && !isNull(oreDict["ingot" ~ i].firstItem)) {
                mods.techreborn.wireMill.addRecipe(oreDict["cable" ~ i].firstItem*3, oreDict["ingot" ~ i], 2*20, HiiragiUtils.voltageTier[0]);
            }
        }

    //Casing
        val listCasing as string[] = [
            "Aluminum",
            "Titanium",
            "Iron",
            "StainlessSteel",
            "Steel",
            //"WroughtIron",
            "Copper",
            "Bronze",
            "Tin",
            "Tungstensteel",
            "Gold",
            "Lead"
        ];
        for i in listCasing {
            if(!isNull(oreDict["casing" ~ i].firstItem) && !isNull(oreDict["plate" ~ i].firstItem)) {
                mods.techreborn.plateBendingMachine.addRecipe(oreDict["casing" ~ i].firstItem*2, oreDict["plate" ~ i], 2*20, HiiragiUtils.voltageTier[0]);
            }
        }

    //Ingot, Nugget, Block
        val listIngot as string[] = [
            "StainlessSteel",
            //"WroughtIron",
            "TungstenCarbide",
            "Beryllium",
            "Magnalium",
            "RedstoneAlloy"
        ];
        for i in listIngot {
            if(!isNull(oreDict["ingot" ~ i].firstItem) && !isNull(oreDict["nugget" ~ i].firstItem) && !isNull(oreDict["block" ~ i].firstItem)) {
                HiiragiUtils.addCrafting(false, false, oreDict["ingot" ~ i].firstItem, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:oreDict["nugget" ~ i]}).ingredients);
                HiiragiUtils.addCrafting(true, false, oreDict["nugget" ~ i].firstItem*9, [[oreDict["ingot" ~ i]]]);
                HiiragiUtils.addCrafting(false, false, oreDict["block" ~ i].firstItem, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:oreDict["ingot" ~ i]}).ingredients);
                HiiragiUtils.addCrafting(true, false, oreDict["ingot" ~ i].firstItem*9, [[oreDict["block" ~ i]]]);
            }
        }

    //Plate
        val listBending as string[] = [
            "TitaniumAluminide",
            "TitaniumIridium",
            "StainlessSteel",
            "WroughtIron",
            "TungstenCarbide",
            "RedstoneAlloy",
        ];
        for i in listBending {
            if(!isNull(oreDict["plate" ~ i].firstItem) && !isNull(oreDict["ingot" ~ i].firstItem)) {
                mods.techreborn.plateBendingMachine.addRecipe(oreDict["plate" ~ i].firstItem, oreDict["ingot" ~ i], 2*20, HiiragiUtils.voltageTier[0]);
            }
        }

    //Rod
        val listStick as string[] = [
            "TitaniumAluminide",
            "TitaniumIridium",
            "Aluminum",
            "Titanium",
            "Iron",
            "StainlessSteel",
            "Steel",
            //"WroughtIron",
            "Copper",
            "Bronze",
            "Tungstensteel",
            "Gold",
            "Manasteel",
            "Terrasteel",
            "Elementium",
            "Iridium"
        ];
        for i in listStick {
            if(!isNull(oreDict["stick" ~ i].firstItem) && !isNull(oreDict["ingot" ~ i].firstItem)) {
                mods.techreborn.rollingMachine.addShaped(oreDict["stick" ~ i].firstItem*4, RecipePattern.init(["A", "A"]).map({A:oreDict["ingot" ~ i]}).ingredients);
            }
            if(!isNull(oreDict["ring" ~ i].firstItem) && !isNull(oreDict["stick" ~ i].firstItem)) {
                mods.techreborn.plateBendingMachine.addRecipe(oreDict["ring" ~ i].firstItem, oreDict["stick" ~ i], 2*20, HiiragiUtils.voltageTier[0]);
            }
        }

//このscriptの読み込みの完了をログに出力
print("materialRecipes.zs loaded!");
