#====================================================================
# Name   : astral.zs
# Author : Hiiragi R. Tsubasa: https://github.com/Hiiragi283
# Info   : Template for script files
#====================================================================

#priority 0

//Classのimport
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.recipes.IRecipeAction;
import crafttweaker.recipes.IRecipeFunction;
import mods.astralsorcery.Altar;
import mods.ctintegration.util.RecipePattern;
import mods.zenutils.HexHelper;
import mods.zenutils.I18n;
import scripts.grassUtils.RecipeUtils;
import scripts.HiiragiUtils;

//読み込みの開始をログに出力
print("Start loading astral.zs ...");

//
val parchment = <astralsorcery:itemcraftingcomponent:5>;
val magicMazeFocus = <twilightforest:magic_map_focus>;

//Altar
	//Remove
	val mapRemoveAltar as bool[string] = {
		"block_black_marble_arch_wall": true,
		"block_black_marble_brick_wall": true,
		"block_black_marble_chiseled_wall": true,
		"block_black_marble_engraved_wall": true,
		"block_black_marble_runed_wall": true,
		"block_black_marble_wall": true,
		"block_infused_wood_fence_gate": true,
		"block_infused_wood_fence": true,
		"block_marble_arch_wall": true,
		"block_marble_brick_wall": true,
		"block_marble_chiseled_wall": true,
		"block_marble_engraved_wall": true,
		"block_marble_runed_wall": true,
		"block_marble_wall": true,
		"block_starmetal": true,
		"infused_wood_arch": true,
		"infused_wood_column": true,
		"infused_wood_engraved": true,
		"infused_wood_planks": false,
		"ingot_starmetal": true,
		"internal/altar/black_marble_arch": true,
		"internal/altar/black_marble_bricks": true,
		"internal/altar/black_marble_chiseled": true,
		"internal/altar/black_marble_engraved": true,
		"internal/altar/black_marble_pillar": true,
		"internal/altar/black_marble_runed": true,
		"internal/altar/marble_arch": true,
		"internal/altar/marble_bricks": true,
		"internal/altar/marble_chiseled": true,
		"internal/altar/marble_engraved": true,
		"internal/altar/marble_pillar": true,
		"internal/altar/marble_runed": true,
		"marble_slab": true,
		"marble_stairs": true,
	};
	for recipe, isShaped in mapRemoveAltar {
		if(isShaped) {
			mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/" + recipe);
		} else {
			mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shapeless/" + recipe);
		}
	}
	//Add
		//Luminous Crafting Table
		mods.astralsorcery.Altar.addDiscoveryAltarRecipe("gohd:constellation/armara", <astralsorcery:itemconstellationpaper>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.armara"}}), 700, 100, [magicMazeFocus, null, null, parchment, parchment, null, parchment, parchment, null]);
		mods.astralsorcery.Altar.addDiscoveryAltarRecipe("gohd:constellation/armara", <astralsorcery:itemconstellationpaper>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.armara"}}), 700, 100, [null, magicMazeFocus, null, parchment, parchment, null, parchment, parchment, null]);
		mods.astralsorcery.Altar.addDiscoveryAltarRecipe("gohd:constellation/discidia", <astralsorcery:itemconstellationpaper>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.discidia"}}), 700, 100, [null, null, magicMazeFocus, parchment, parchment, null, parchment, parchment, null]);
		mods.astralsorcery.Altar.addDiscoveryAltarRecipe("gohd:constellation/evorsio", <astralsorcery:itemconstellationpaper>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.evorsio"}}), 700, 100, [null, null, null, parchment, parchment, magicMazeFocus, parchment, parchment, null]);
		mods.astralsorcery.Altar.addDiscoveryAltarRecipe("gohd:constellation/vicio", <astralsorcery:itemconstellationpaper>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.vicio"}}), 700, 100, [null, null, null, parchment, parchment, null, parchment, parchment, magicMazeFocus]);

//読み込みの完了をログに出力
print("astral.zs loaded!");
