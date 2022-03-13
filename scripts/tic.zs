#======================================================================
# name : tic.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : scripts for Tinker's Construct/Complement
#======================================================================
#priority 0

#crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

#各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.chisel.Carving as chisel;
import mods.ctintegration.util.RecipePattern;
import mods.gregtech.recipe.RecipeMap;
import mods.tconstruct.Casting as casting;
import mods.zenutils.I18n;

#scriptのimport
import scripts.HiiragiUtils;

#このscriptの読み込みの開始をログに出力
print("Start loading tic.zs ...");

#変数の定義

#作業台レシピの編集
##削除
val removeCrafting as IItemStack[] = [
    <tcomplement:materials:1>,
    <tcomplement:scorched_channel>,
    <tcomplement:scorched_casting:*>,
    <tconstruct:pattern>,
    <tconstruct:smeltery_controller>,
    <tconstruct:channel>,
    <tconstruct:casting:0>,
    <tconstruct:casting:1>
];
for i in removeCrafting {
    HiiragiUtils.removeCrafting(i);
}
mods.jei.JEI.addItem(<tconstruct:toolforge>.withTag({textureBlock: {id: "chisel:iron", Count: 1 as byte, Damage: 14 as short}}));
##上書き
HiiragiUtils.addCrafting(false, true, <tcomplement:melter:0>, RecipePattern.init(["ABA", "ACA", "ADA"]).map({A:<tconstruct:materials:0>, B:<minecraft:hopper>, C:<tconstruct:seared_tank:*>, D:<minecraft:iron_ingot>}).ingredients);
HiiragiUtils.addCrafting(true, true, <tcomplement:scorched_faucet>*2, [[<tcomplement:scorched_channel>, <ore:GT.tool.saw>]]);
HiiragiUtils.addCrafting(true, true, <tconstruct:faucet>*2, [[<tconstruct:channel>, <ore:GT.tool.saw>]]);
HiiragiUtils.addCrafting(false, true, <tconstruct:tinker_tank_controller>, RecipePattern.init(["ABA", "ACA", "ABA"]).map({A:<tconstruct:materials:0>, B:<tconstruct:seared_tank:*>, C:<minecraft:bucket>}).ingredients);

recipes.replaceAllOccurences(<minecraft:furnace>, <primal_tech:clay_kiln>, <tconstruct:seared_furnace_controller>);
##新規
HiiragiUtils.addCrafting(true, false, <contenttweaker:grout_ingot>, [[HiiragiUtils.gregItem(348).reuse(), <tconstruct:soil:0>]]);
HiiragiUtils.addCrafting(false, false, <contenttweaker:unfired_seared_channel>, RecipePattern.init(["   ", "A A", "AAA"]).map({A:<contenttweaker:grout_ingot>}).ingredients);
HiiragiUtils.addCrafting(false, false, <contenttweaker:unfired_casting_table>, RecipePattern.init(["AAA", "A A", "A A"]).map({A:<contenttweaker:grout_ingot>}).ingredients);
HiiragiUtils.addCrafting(false, false, <contenttweaker:unfired_casting_basin>, RecipePattern.init(["A A", "A A", "AAA"]).map({A:<contenttweaker:grout_ingot>}).ingredients);
HiiragiUtils.addCrafting(true, false, <tcomplement:scorched_block:3>, [[<tcomplement:materials:1>, <tcomplement:materials:1>, <tcomplement:materials:1>, <tcomplement:materials:1>]]);
HiiragiUtils.addCrafting(false, false, <tconstruct:toolforge>.withTag({textureBlock: {id: "chisel:iron", Count: 1 as byte, Damage: 14 as short}}), RecipePattern.init(["AAA", "BCB", "B B"]).map({A:<tconstruct:seared:*>, B:<ore:plateDoubleWroughtIron>, C:<tconstruct:tooltables:3>}).ingredients);
HiiragiUtils.addCrafting(true, false, <tconstruct:seared:3>, [[<tconstruct:materials:0>, <tconstruct:materials:0>, <tconstruct:materials:0>, <tconstruct:materials:0>]]);

#かまどレシピの編集
##削除
val removeFurnace as IItemStack[] = [
    <tcomplement:scorched_block:0>,
    <tcomplement:scorched_block:4>,
    <tconstruct:materials:0>,
    <tconstruct:seared:4>
];
for i in removeFurnace {
    HiiragiUtils.removeFurnace(i);
}
##新規
val addFurnace as IIngredient[IItemStack] = {
    <tconstruct:materials:0> : <contenttweaker:grout_ingot>,
    <tconstruct:channel> : <contenttweaker:unfired_seared_channel>,
    <tconstruct:casting:0> : <contenttweaker:unfired_casting_table>,
    <tconstruct:casting:1> : <contenttweaker:unfired_casting_basin>
};
for output, input in addFurnace {
    HiiragiUtils.addFurnace(false, output, input);
}

#AWレシピの編集
##import
##新規

#GTレシピの編集
##削除
##上書き
##新規
<recipemap:alloy_smelter>.recipeBuilder()
    .inputs([<tconstruct:soil:0>])
    .notConsumable(HiiragiUtils.gregItem(18))
    .outputs(<tconstruct:materials:0>*4)
    .duration(0.25*20)
    .EUt(28)
    .buildAndRegister();

#castingレシピの編集
val removeCasting as IItemStack[] = [
    <tconstruct:materials:0>,
    <tconstruct:materials:1>
];
for i in removeCasting {
    casting.removeTableRecipe(i);
}

##Brass CastおよびClay Castの改変
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
##Clay Castの無効化
    HiiragiUtils.removeFromJEI(HiiragiUtils.castClay(i));
    casting.removeTableRecipe(HiiragiUtils.castClay(i));

##Brass Castを全てchiselから作るように改変
    casting.removeTableRecipe(HiiragiUtils.castBrass(i));
    chisel.addVariation("cast", HiiragiUtils.castBrass(i));
}

casting.removeTableRecipe(HiiragiUtils.castBrass("chisel_head"));
casting.removeTableRecipe(HiiragiUtils.castClay("chisel_head"));
HiiragiUtils.removeFromJEI(HiiragiUtils.castClay("chisel_head"));

#各種建材をchiselでのみ加工できるようにする
##Scorched Block
for i in 0 to 11 {
    recipes.remove(<tcomplement:scorched_block>.definition.makeStack(i));
}
##Scorched Block Slab
chisel.addGroup("scorched_slab");
for i in 0 to 7 {
    chisel.addVariation("scorched_slab", <tcomplement:scorched_slab>.definition.makeStack(i));
}
for i in 0 to 3 {
    chisel.addVariation("scorched_slab", <tcomplement:scorched_slab2>.definition.makeStack(i));
}
##Seared Block
for i in 0 to 11 {
    recipes.remove(<tconstruct:seared>.definition.makeStack(i));
}
##Seared Block slab
chisel.addGroup("seared_slab");
for i in 0 to 7 {
    chisel.addVariation("seared_slab", <tconstruct:seared_slab>.definition.makeStack(i));
}
for i in 0 to 3 {
    chisel.addVariation("seared_slab", <tconstruct:seared_slab2>.definition.makeStack(i));
}
##Brownstone Block
chisel.addGroup("brownstone_slab");
for i in 0 to 11 {
    if (i!=1) {
        recipes.remove(<tconstruct:brownstone>.definition.makeStack(i));
    }
}
##Brownstone Block Slab
for i in 0 to 7 {
    chisel.addVariation("brownstone_slab", <tconstruct:brownstone_slab>.definition.makeStack(i));
}
for i in 0 to 3 {
    chisel.addVariation("brownstone_slab", <tconstruct:brownstone_slab2>.definition.makeStack(i));
}

#不要なToolforgeをJEIから削除する
val toolForge as short[][string] = {
    "enderio:blocl_alloy": [0,1,2,3,4,5,6,7,8,9],
    "twilightforest:block_storage": [1,2],
    "minecraft:iron_block": [0],
    "tconstruct:metal": [0,1,2,3,4,5],
    "libvulpes:metal0": [4,5,6,9],
    "gregtech:meta_block_compressed_16": [4],
    "gregtech:meta_block_compressed_3": [7],
    "gregtech:meta_block_compressed_6": [4],
    "gregtech:meta_block_compressed_17": [5],
    "gregtech:meta_block_compressed_4": [5],
    "gregtech:meta_block_compressed_7": [10],
    "minecraft:gold_block": [0],
    "thaumcraft:metal_brass": [0],
    "minecraft:glowstone": [0],
    "minecraft:redstone_block": [0]

};
for id, damage in toolForge {
    for i in damage {
        HiiragiUtils.removeFromJEI(<tconstruct:toolforge>.withTag({textureBlock: {id: id, Count: 1 as byte, Damage: i}}));
    }
}

#このscriptの読み込みの完了をログに出力
print("tic.zs loaded!");
