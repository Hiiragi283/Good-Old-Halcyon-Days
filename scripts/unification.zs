#======================================================================
# ファイル名 : unification.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : 鉱石辞書やレシピの統一
#======================================================================

#priority 90

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.ctintegration.util.RecipePattern;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading unification.zs ...");

//変数の定義

//作業台レシピの編集
    //削除
        val removeCrafting as IItemStack[] = [
            <dcs_climate:dcs_ore_gemblock:4>,
            <techreborn:nuggets:24>,
        ];
        for i in removeCrafting {
            HiiragiUtils.removeCrafting(i);
        }

//unidict:dustiron_x1_size.1

        val removeCraftingName as string[] = [
            "unidict:dustiron_x1_size.1",
            "dcs_climate:main_container/dcs_gem_blue_1",
        ];
        for i in removeCraftingName {
            recipes.removeByRecipeName(i);
        }

        for i in 0 to 15 {
            recipes.removeByRecipeName("mekanism:balloon_" ~ i);
            recipes.removeByRecipeName("dcs_lib:balloon_" ~ i ~ "_dcs");
        }

    //上書き
        HiiragiUtils.addCrafting(true, true, <thermalfoundation:material:802>, [[<thermalfoundation:storage_resource:1>]]);
        HiiragiUtils.addCrafting(false, true, <minecraft:wooden_pressure_plate>, RecipePattern.init(["AA"]).map({A:<minecraft:planks:0>}).ingredients);
        HiiragiUtils.addCrafting(false, true, <minecraft:slime>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<minecraft:slime_ball>}).ingredients);
        HiiragiUtils.addCrafting(false, true, <tconstruct:slime:5>, RecipePattern.init(["AAA", "AAA", "AAA"]).map({A:<tconstruct:edible:5>}).ingredients);
        HiiragiUtils.addCrafting(false, true, <tconstruct:slime_congealed:5>, RecipePattern.init(["AA", "AA"]).map({A:<tconstruct:edible:5>}).ingredients);
        HiiragiUtils.addCrafting(false, true, <tconstruct:slimesling:5>, RecipePattern.init(["ABA", "C C", " C "]).map({A:<minecraft:string>, B:<tconstruct:slime_congealed:5>, C:<tconstruct:edible:5>}).ingredients);
        HiiragiUtils.addCrafting(false, true, <tconstruct:slime_boots:5>, RecipePattern.init(["A A", "B B"]).map({A:<tconstruct:edible:5>, B:<tconstruct:slime_congealed:5>}).ingredients);
        HiiragiUtils.addCrafting(false, true, <minecraft:trapdoor>*2, RecipePattern.init(["AAA", "AAA"]).map({A:<minecraft:planks:0>}).ingredients);

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

//JEIからエントリを完全に削除
    val removeFromJEI as IItemStack[] = [

        //Heat And Climate
            <dcs_climate:dcs_gem:*>,
            <dcs_climate:dcs_door_marble>,
            <dcs_climate:dcs_door_greisen>,
            <dcs_climate:dcs_door_gypsum>,
            <dcs_climate:dcs_door_steel>,

    ];
    for i in removeFromJEI {
        HiiragiUtils.removeFromJEI(i);
        HiiragiUtils.removeOreDict(i);
    }

//鉱石辞書の削除
    <ore:dustWood>.remove(<dcs_climate:dcs_fooddust:7>);
    <ore:blockAluminium>.remove(<techreborn:storage:1>);
    HiiragiUtils.removeOreDict(<libvulpes:ore0:4>);
    HiiragiUtils.removeOreDict(<libvulpes:ore0:5>);
    HiiragiUtils.removeOreDict(<libvulpes:ore0:8>);
    HiiragiUtils.removeOreDict(<libvulpes:ore0:9>);
    HiiragiUtils.removeOreDict(<libvulpes:ore0:10>);

//鉱石辞書の追加
    <ore:cableTin>.add(<techreborn:cable:1>);
    <ore:cableCopper>.add(<techreborn:cable:0>);
    <ore:cableGold>.add(<techreborn:cable:2>);
    <ore:cableAluminum>.add(<techreborn:cable:3>);
    <ore:cableFiber>.add(<techreborn:cable:4>);
    <ore:cableCopperInsulated>.add(<techreborn:cable:5>);
    <ore:cableGoldInsulated>.add(<techreborn:cable:6>);
    <ore:cableAluminumInsulated>.add(<techreborn:cable:7>);
    <ore:cableSuperconductor>.add(<techreborn:cable:8>);

//このscriptの読み込みの完了をログに出力
print("unification.zs loaded!");
