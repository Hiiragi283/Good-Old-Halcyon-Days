#======================================================================
# name : tic.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : scripts for Tinker's Construct/Complement
#======================================================================
#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.chisel.Carving as chisel;
import mods.ctintegration.util.RecipePattern;
import mods.tconstruct.Casting as casting;
import mods.zenutils.I18n;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading tic.zs ...");

//変数の定義
//val castChiselHead as IItemStack = <tconstruct:cast>.withTag({PartType:"tcomplement:chisel_head"});
//val castClayChiselHead as IItemStack = <tconstruct:clay_cast>.withTag({PartType:"tcomplement:chisel_head"});

//JEIからアイテムを隠す
val toHide as IItemStack[] = [];
for i in toHide {
    HiiragiUtils.hideFromJEI(i);
}

//JEIからアイテムを隠しレシピを削除する
val toRemove as IItemStack[] = [
    <tcomplement:materials:10>,
    <tcomplement:materials:20>,
    <tcomplement:melter:8>,
    <tcomplement:storage:*>,
    <tconstruct:ore:0>
];
for i in toRemove {
    HiiragiUtils.removeFromJEI(i);
}

//レシピの編集
recipes.remove(<tconstruct:smeltery_controller>);

HiiragiUtils.addCrafting(false, true, <tcomplement:melter:0>, RecipePattern.init(["AAA", "ABA", "CCC"]).map({A:<ore:blockGlass>, B:<tconstruct:seared_tank:*>, C:<tconstruct:materials:0>}).ingredients);

recipes.replaceAllOccurences(<minecraft:furnace>, null, <tconstruct:seared_furnace_controller>);

//アイテムにtooltipsを追加する

<tconstruct:pattern>.addTooltip(I18n.format("gohd.tooltip.wooden_pattern.name"));
<gregtech:meta_item_1:347>.addTooltip(I18n.format("gohd.tooltip.wooden_form.name"));
<tconstruct:cast>.addTooltip(I18n.format("gohd.tooltip.cast_chisel.name"));
<tconstruct:smeltery_controller>.addTooltip(I18n.format("gohd.tooltip.smeltery_controller.name"));
<tconstruct:seared_slab:*>.addTooltip(I18n.format("tile.tconstruct.seared.tooltip"));
<tconstruct:seared_slab2:*>.addTooltip(I18n.format("tile.tconstruct.seared.tooltip"));

//Brass CastおよびClay Castの改変
chisel.addGroup("cast");
chisel.addVariation("cast", <tconstruct:cast>);
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
//  "chisel_head",
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

/*
for i in castPattern {
    //Clay Castの無効化
    var CastPatternName as string = "tconstruct:" + i;
    var castClay as IItemStack = <tconstruct:clay_cast>.withTag({PartType: CastPatternName});
    HiiragiUtils.removeFromJEI(castClay);
    casting.removeTableRecipe(castClay);
    //Brass Castを全てchiselから作るように改変
    var castBrass as IItemStack = <tconstruct:cast>.withTag({PartType: CastPatternName});
    casting.removeTableRecipe(castBrass);
    chisel.addVariation("cast", castBrass);
} */
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

//各種建材をchiselでのみ加工できるようにする

//Scorched Block
for i in 0 to 11 {
    recipes.remove(<tcomplement:scorched_block>.definition.makeStack(i));
}

//Scorched Block Slab
chisel.addGroup("scorched_slab");
for i in 0 to 7 {
    chisel.addVariation("scorched_slab", <tcomplement:scorched_slab>.definition.makeStack(i));
}
for i in 0 to 3 {
    chisel.addVariation("scorched_slab", <tcomplement:scorched_slab2>.definition.makeStack(i));
}

//Seared Block
for i in 0 to 11 {
    if (i!=3) {
        recipes.remove(<tconstruct:seared>.definition.makeStack(i));
    }
}

//Seared Block slab
chisel.addGroup("seared_slab");
for i in 0 to 7 {
    chisel.addVariation("seared_slab", <tconstruct:seared_slab>.definition.makeStack(i));
}
for i in 0 to 3 {
    chisel.addVariation("seared_slab", <tconstruct:seared_slab2>.definition.makeStack(i));
}

//Brownstone Block
chisel.addGroup("brownstone_slab");
for i in 0 to 11 {
    if (i!=1) {
        recipes.remove(<tconstruct:brownstone>.definition.makeStack(i));
    }
}

//Brownstone Block Slab
for i in 0 to 7 {
    chisel.addVariation("brownstone_slab", <tconstruct:brownstone_slab>.definition.makeStack(i));
}
for i in 0 to 3 {
    chisel.addVariation("brownstone_slab", <tconstruct:brownstone_slab2>.definition.makeStack(i));
}

//このscriptの読み込みの完了をログに出力
print("tic.zs loaded!");
