#======================================================================
# name : primal_tech.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Write about this script file
#======================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.gregtech.recipe.RecipeMap;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading primal_tech.zs ...");

//変数の定義
    val removeFromJEI as IItemStack[] = [
        <primal_tech:fibre_torch>,
        <primal_tech:fibre_torch_lit>,
        <primal_tech:work_stump>,
        <primal_tech:stone_grill>,
        <primal_tech:work_stump_upgraded>,
        <primal_tech:fire_sticks>,
        <primal_tech:bone_pickaxe>,
        <primal_tech:bone_axe>,
        <primal_tech:bone_shovel>,
        <primal_tech:bone_shears>,
        <primal_tech:bone_sword>,
        <primal_tech:bone_knife>
    ];
    for i in removeFromJEI {
        HiiragiUtils.removeFromJEI(i);
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

//GTレシピの編集
    //削除
    //上書き
    //新規

/*
<recipemap:name>.recipeBuilder()
    .inputs([])
    .outputs()
    .duration()
    .EUt()
    .buildAndRegister();
*/

//このscriptの読み込みの完了をログに出力
print("primal_tech.zs loaded!");
