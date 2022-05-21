#======================================================================
# ファイル名 : chisel.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Chiselの改変
#======================================================================

#priority 95

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.ctintegration.util.RecipePattern;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading chisel.zs ...");

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

//Tinker's Contruct / Complement
    //Scorched Block
        for i in 0 to 11 {
            recipes.remove(<tcomplement:scorched_block>.definition.makeStack(i));
        }
    //Scorched Block Slab
        mods.chisel.Carving.addGroup("scorched_slab");
        for i in 0 to 7 {
            mods.chisel.Carving.addVariation("scorched_slab", <tcomplement:scorched_slab>.definition.makeStack(i));
        }
        for i in 0 to 3 {
            mods.chisel.Carving.addVariation("scorched_slab", <tcomplement:scorched_slab2>.definition.makeStack(i));
        }
    //Seared Block
        for i in 0 to 11 {
            recipes.remove(<tconstruct:seared>.definition.makeStack(i));
        }
    //Seared Block slab
        mods.chisel.Carving.addGroup("seared_slab");
        for i in 0 to 7 {
            mods.chisel.Carving.addVariation("seared_slab", <tconstruct:seared_slab>.definition.makeStack(i));
        }
        for i in 0 to 3 {
            mods.chisel.Carving.addVariation("seared_slab", <tconstruct:seared_slab2>.definition.makeStack(i));
        }
    //Brownstone Block
        mods.chisel.Carving.addGroup("brownstone_slab");
        for i in 0 to 11 {
            if (i!=1) {
                recipes.remove(<tconstruct:brownstone>.definition.makeStack(i));
            }
        }
    //Brownstone Block Slab
        for i in 0 to 7 {
            mods.chisel.Carving.addVariation("brownstone_slab", <tconstruct:brownstone_slab>.definition.makeStack(i));
        }
        for i in 0 to 3 {
            mods.chisel.Carving.addVariation("brownstone_slab", <tconstruct:brownstone_slab2>.definition.makeStack(i));
        }

//このscriptの読み込みの完了をログに出力
print("chisel.zs loaded!");
