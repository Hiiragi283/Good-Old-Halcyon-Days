#======================================================================
# name : tic-cast.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Scripts for tweaking casting recipes
#======================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.chisel.Carving as chisel;
import mods.tconstruct.Casting as casting;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading tic-cast.zs ...");

//変数の定義

////Brass CastおよびClay Castの改変
    chisel.addGroup("cast");
    chisel.addVariation("cast", <tconstruct:cast>);
	casting.removeTableRecipe(<tconstruct:cast>);
	casting.addTableRecipe(<tconstruct:cast>, null, <liquid:brass>, 3*20);
	casting.addTableRecipe(<tconstruct:cast>, null, <liquid:alubrass>, 3*20);
    chisel.addVariation("cast", HiiragiUtils.castBrass("chisel_head"));

    val castPattern as string[] = [
        "pick_head",
        "arrow_shaft",
        "sign_head",
        "arrow_head",
        "tool_rod",
        "large_plate",
        "bow_string",
        "binding",
        "cross_guard",
        "sharpening_kit",
        "sword_blade",
        "axe_head",
        "broad_axe_head",
        "scythe_head",
        "kama_head",
        "pan_head",
        "tough_tool_rod",
        "knife_blade",
        "bow_limb",
        "wide_guard",
        "excavator_head",
        "hammer_head",
        "large_sword_blade",
        "shovel_head",
        "hand_guard",
        "shard",
        "tough_binding"
    ];

    for i in 0 to 5 {
        var castBrass as IItemStack = <tconstruct:cast_custom>.definition.makeStack(i);
        castBrass.addTooltip(I18n.format("gohd.tooltip.cast_chisel.name"));
        casting.removeTableRecipe(castBrass);
        chisel.addVariation("cast", castBrass);
    }
    for i in castPattern {
        //Clay Castの無効化
        HiiragiUtils.removeFromJEI(HiiragiUtils.castClay(i));
        casting.removeTableRecipe(HiiragiUtils.castClay(i));
        //Brass Castを全てchiselから作るように改変
        casting.removeTableRecipe(HiiragiUtils.castBrass(i));
        chisel.addVariation("cast", HiiragiUtils.castBrass(i));
    }

    casting.removeTableRecipe(HiiragiUtils.castBrass("chisel_head"));
    casting.removeTableRecipe(HiiragiUtils.castClay("chisel_head"));
    HiiragiUtils.removeFromJEI(HiiragiUtils.castClay("chisel_head"));

//このscriptの読み込みの完了をログに出力
print("tic-cast.zs loaded!");
