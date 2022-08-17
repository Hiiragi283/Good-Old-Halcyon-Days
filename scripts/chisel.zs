#====================================================================
# ファイル名 : chisel.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Script for Chisel
#====================================================================

#priority 97

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;

//各種modからclassをimport
import mods.ctintegration.util.RecipePattern;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading chisel.zs ...");

//変数の定義
	//chisel（道具）に鉱石辞書を付与する
	<ore:artisansChisel>.add([
		<chisel:chisel_iron>,
		<chisel:chisel_diamond>,
		<chisel:chisel_hitech>,
	]);

//作業台レシピの編集
	//削除
	val removeCrafting as IItemStack[] = [];
	for i in removeCrafting {
		HiiragiUtils.removeCrafting(i);
	}
	//上書き
	//新規

//AWレシピの編集
	//import
	//新規

//OreDict
	val chiselOreDict as IItemStack[][string] = {
		//blocks
		"block_titanium": <ore:blockTitanium>.items,
		"block_peridot": <ore:blockPeridot>.items,
		"block_ruby": <ore:blockRuby>.items,
		"block_sapphire": <ore:blockSapphire>.items,
		//items
		"item_peridot": <ore:gemPeridot>.items,
		"item_ruby": <ore:gemRuby>.items,
		"item_sapphire": <ore:gemSapphire>.items,
		"item_copper": <ore:ingotCopper>.items,
		"item_tin": <ore:ingotTin>.items,
		"item_silver": <ore:ingotSilver>.items,
		"item_lead": <ore:ingotLead>.items,
		"item_aluminum": <ore:ingotAluminum>.items,
		"item_nickel": <ore:ingotNickel>.items,
		"item_steel": <ore:ingotSteel>.items,
		"item_bronze": <ore:ingotBronze>.items,
	};
	for i, j in chiselOreDict {
		mods.chisel.Carving.addGroup(i);
		for k in j {
			mods.chisel.Carving.addVariation(i, k);
		}
	}

//Minecraft
	//Bedrock
	mods.chisel.Carving.addGroup("bedrock");
	val bedrock as IItemStack[] = [
		<minecraft:bedrock>,
		<extrautils2:decorativebedrock:0>,
		<extrautils2:decorativebedrock:1>,
		<extrautils2:decorativebedrock:2>,
		<dcs_climate:dcs_ore_gemblock:12>,
		<dcs_climate:dcs_build_bricks:3>,
	];
	for i in bedrock {
		HiiragiUtils.removeCrafting(i);
		mods.chisel.Carving.addVariation("bedrock", i);
	}

//Biblio Craft
	//Fancy lantern (Gold)
	mods.chisel.Carving.addGroup("biblio_fancy_lantern_gold");
	for i in 0 to 16 {
		HiiragiUtils.removeCrafting(<bibliocraft:lanterngold>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("biblio_fancy_lantern_gold", <bibliocraft:lanterngold>.definition.makeStack(i));
	}
	//Fancy lantern (Iron)
	mods.chisel.Carving.addGroup("biblio_fancy_lantern_iron");
	for i in 0 to 16 {
		HiiragiUtils.removeCrafting(<bibliocraft:lanterniron>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("biblio_fancy_lantern_iron", <bibliocraft:lanterniron>.definition.makeStack(i));
	}
	//Fancy Lamp (Gold)
	mods.chisel.Carving.addGroup("biblio_fancy_lamp_gold");
	for i in 0 to 16 {
		HiiragiUtils.removeCrafting(<bibliocraft:lampgold>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("biblio_fancy_lamp_gold", <bibliocraft:lampgold>.definition.makeStack(i));
	}
	//Fancy Lamp (Iron)
	mods.chisel.Carving.addGroup("biblio_fancy_lamp_iron");
	for i in 0 to 16 {
		HiiragiUtils.removeCrafting(<bibliocraft:lampiron>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("biblio_fancy_lamp_iron", <bibliocraft:lampiron>.definition.makeStack(i));
	}
	//Typewriter (Gold)
	mods.chisel.Carving.addGroup("biblio_typewriter");
	for i in 0 to 16 {
		HiiragiUtils.removeCrafting(<bibliocraft:typewriter>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("biblio_typewriter", <bibliocraft:typewriter>.definition.makeStack(i));
	}
	//Sword Pedestal
	mods.chisel.Carving.addGroup("biblio_sword_pedestal");
	for i in 0 to 16 {
		HiiragiUtils.removeCrafting(<bibliocraft:swordpedestal>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("biblio_sword_pedestal", <bibliocraft:swordpedestal>.definition.makeStack(i));
	}

//Botania
	//Azulejo
	mods.chisel.Carving.addGroup("botania_azulejo");
	for i in 0 to 16 {
		HiiragiUtils.removeCrafting(<botania:custombrick>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("botania_azulejo", <botania:custombrick>.definition.makeStack(i));
	}
	//cosmetic
	mods.chisel.Carving.addGroup("botania_cosmetic");
	for i in 0 to 33 {
		HiiragiUtils.removeCrafting(<botania:cosmetic>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("botania_cosmetic", <botania:cosmetic>.definition.makeStack(i));
	}

//Ender IO
	//Self-resetting Lever
	val selfResettinglever as IItemStack[] = [
		<enderio:block_self_resetting_lever5>,
		<enderio:block_self_resetting_lever10>,
		<enderio:block_self_resetting_lever30>,
		<enderio:block_self_resetting_lever60>,
		<enderio:block_self_resetting_lever300>,
		<enderio:block_self_resetting_lever5i>,
		<enderio:block_self_resetting_lever10i>,
		<enderio:block_self_resetting_lever30i>,
		<enderio:block_self_resetting_lever60i>,
		<enderio:block_self_resetting_lever300i>,
	];
	mods.chisel.Carving.addGroup("enderio_self_resetting_lever");
	for i in selfResettinglever {
		HiiragiUtils.removeCrafting(i);
		mods.chisel.Carving.addVariation("enderio_self_resetting_lever", i);
	}
	HiiragiUtils.addCraftingShapeless(false, <enderio:block_self_resetting_lever5>, [<minecraft:lever>, <ore:dustRedstone>], null, null);
	//Decoration
	mods.chisel.Carving.addGroup("enderio_decoration");
	for i in 0 to 16 {
		HiiragiUtils.removeCrafting(<enderio:block_decoration1>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("enderio_decoration", <enderio:block_decoration1>.definition.makeStack(i));
		HiiragiUtils.removeCrafting(<enderio:block_decoration2>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("enderio_decoration", <enderio:block_decoration2>.definition.makeStack(i));
	}
	for i in 0 to 5 {
		HiiragiUtils.removeCrafting(<enderio:block_decoration3>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("enderio_decoration", <enderio:block_decoration3>.definition.makeStack(i));
	}
	HiiragiUtils.addCraftingShapeless(false, <enderio:block_decoration1:0>, [<ore:itemChassiParts>, <ore:itemChassiParts>], null, null);
	//Redstone Filter
	val redstoneFilter as IItemStack[] = [
		<enderio:item_material:60>,
		<enderio:item_redstone_not_filter>,
		<enderio:item_redstone_or_filter>,
		<enderio:item_redstone_and_filter>,
		<enderio:item_redstone_nor_filter>,
		<enderio:item_redstone_nand_filter>,
		<enderio:item_redstone_xor_filter>,
		<enderio:item_redstone_xnor_filter>,
		<enderio:item_redstone_toggle_filter>,
		<enderio:item_redstone_counting_filter>,
		<enderio:item_redstone_sensor_filter>,
		<enderio:item_redstone_timer_filter>,
	];
	mods.chisel.Carving.addGroup("enderio_redstone_filter");
	for i in redstoneFilter {
		HiiragiUtils.addCraftingShapeless(true, i, [i], null, null);
		mods.chisel.Carving.addVariation("enderio_redstone_filter", i);
	}

//Extra Utilities 2
	//Stone
	for i in 0 to 6 {
		if (i !=3 && i != 4) {
			var stoneBrick as IItemStack = <extrautils2:decorativesolid>.definition.makeStack(i);
			mods.chisel.Carving.addVariation("stonebrick", stoneBrick);
			HiiragiUtils.removeCrafting(stoneBrick);
		}
	}
	//Thickened Glass
	mods.chisel.Carving.addGroup("extrautils2_thickened_glass");
	for i in 0 to 3 {
		var thickenedGlass  as IItemStack = <extrautils2:decorativeglass>.definition.makeStack(i);
		mods.chisel.Carving.addVariation("extrautils2_thickened_glass", thickenedGlass);
		HiiragiUtils.removeCrafting(thickenedGlass);
	}

//HaC
	//Desktop Accessories
	mods.chisel.Carving.addGroup("dcs_desktop_accessories");
	for i in 0 to 9 {
		mods.chisel.Carving.addVariation("dcs_desktop_accessories", <dcs_climate:dcs_desktop_accessories>.definition.makeStack(i));
	}
	//Marble
	mods.chisel.Carving.addVariation("marble", <dcs_climate:dcs_ore_gemblock:6>);
	mods.chisel.Carving.addVariation("marble", <dcs_climate:dcs_build_bricks:1>);
	//Lime
	mods.chisel.Carving.addVariation("limestone", <dcs_climate:dcs_layer_stone_new:1>);
	mods.chisel.Carving.addVariation("limestone", <dcs_climate:dcs_build_bricks:2>);
	//Brass Shaft
	mods.chisel.Carving.addGroup("dcs_shaft_brass");
	mods.chisel.Carving.addVariation("dcs_shaft_brass", <dcs_climate:dcs_device_shaft_s>);
	mods.chisel.Carving.addVariation("dcs_shaft_brass", <dcs_climate:dcs_device_shaft_l>);
	mods.chisel.Carving.addVariation("dcs_shaft_brass", <dcs_climate:dcs_device_shaft_ta>);
	mods.chisel.Carving.addVariation("dcs_shaft_brass", <dcs_climate:dcs_device_shaft_tb>);
	mods.chisel.Carving.addVariation("dcs_shaft_brass", <dcs_climate:dcs_device_shaft_x>);
	mods.chisel.Carving.addVariation("dcs_shaft_brass", <dcs_climate:dcs_device_shaft_switch>);
	//Steel Shaft
	mods.chisel.Carving.addGroup("dcs_shaft_steel");
	mods.chisel.Carving.addVariation("dcs_shaft_steel", <dcs_climate:dcs_device_shaft_s_steel>);
	mods.chisel.Carving.addVariation("dcs_shaft_steel", <dcs_climate:dcs_device_shaft_l_steel>);
	mods.chisel.Carving.addVariation("dcs_shaft_steel", <dcs_climate:dcs_device_shaft_ta_steel>);
	mods.chisel.Carving.addVariation("dcs_shaft_steel", <dcs_climate:dcs_device_shaft_tb_steel>);
	mods.chisel.Carving.addVariation("dcs_shaft_steel", <dcs_climate:dcs_device_shaft_x_steel>);
	mods.chisel.Carving.addVariation("dcs_shaft_steel", <dcs_climate:dcs_device_shaft_switch_steel>);
	//Stainless Steel Shaft
	mods.chisel.Carving.addGroup("dcs_shaft_sus");
	mods.chisel.Carving.addVariation("dcs_shaft_sus", <dcs_climate:dcs_device_shaft_s_sus>);
	mods.chisel.Carving.addVariation("dcs_shaft_sus", <dcs_climate:dcs_device_shaft_l_sus>);
	mods.chisel.Carving.addVariation("dcs_shaft_sus", <dcs_climate:dcs_device_shaft_ta_sus>);
	mods.chisel.Carving.addVariation("dcs_shaft_sus", <dcs_climate:dcs_device_shaft_tb_sus>);
	mods.chisel.Carving.addVariation("dcs_shaft_sus", <dcs_climate:dcs_device_shaft_x_sus>);
	//mods.chisel.Carving.addVariation("dcs_shaft_sus", <dcs_climate:dcs_device_shaft_switch_sus>);
	//Steel Shaft (Lossless)
	mods.chisel.Carving.addGroup("hap_shaft_steel_lossless");
	mods.chisel.Carving.addVariation("hap_shaft_steel_lossless", <hap:shaft_straight_steel>);
	mods.chisel.Carving.addVariation("hap_shaft_steel_lossless", <hap:shaft_l_shaped_steel>);
	mods.chisel.Carving.addVariation("hap_shaft_steel_lossless", <hap:shaft_bifurcated_steel>);
	mods.chisel.Carving.addVariation("hap_shaft_steel_lossless", <hap:shaft_perpendicular_steel>);
	mods.chisel.Carving.addVariation("hap_shaft_steel_lossless", <hap:shaft_t_shaped_steel>);
	mods.chisel.Carving.addVariation("hap_shaft_steel_lossless", <hap:shaft_x_shaped_steel>);
	//Stainless Steel Shaft (Lossless)
	mods.chisel.Carving.addGroup("hap_shaft_sus_lossless");
	mods.chisel.Carving.addVariation("hap_shaft_sus_lossless", <hap:shaft_straight_sus>);
	mods.chisel.Carving.addVariation("hap_shaft_sus_lossless", <hap:shaft_l_shaped_sus>);
	mods.chisel.Carving.addVariation("hap_shaft_sus_lossless", <hap:shaft_bifurcated_sus>);
	mods.chisel.Carving.addVariation("hap_shaft_sus_lossless", <hap:shaft_perpendicular_sus>);
	mods.chisel.Carving.addVariation("hap_shaft_sus_lossless", <hap:shaft_t_shaped_sus>);
	mods.chisel.Carving.addVariation("hap_shaft_sus_lossless", <hap:shaft_x_shaped_sus>);

//Railcraft
	//Abyssal
	mods.chisel.Carving.addGroup("railcraft_abyssal_stone");
	mods.chisel.Carving.addVariation("railcraft_abyssal_stone", <railcraft:abyssal_stone>);
	for i in 0 to 6 {
		HiiragiUtils.removeCrafting(<railcraft:abyssal>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("railcraft_abyssal_stone", <railcraft:abyssal>.definition.makeStack(i));
	}
	//Bleached Bone
	mods.chisel.Carving.addGroup("railcraft_bleachedbone_stone");
	for i in 0 to 6 {
		HiiragiUtils.removeCrafting(<railcraft:bleachedbone>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("railcraft_bleachedbone_stone", <railcraft:bleachedbone>.definition.makeStack(i));
	}
	//Blood Stained
	mods.chisel.Carving.addGroup("railcraft_bloodstained_stone");
	for i in 0 to 6 {
		HiiragiUtils.removeCrafting(<railcraft:bloodstained>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("railcraft_bloodstained_stone", <railcraft:bloodstained>.definition.makeStack(i));
	}
	//Frost Bound
	mods.chisel.Carving.addGroup("railcraft_frostbound_stone");
	for i in 0 to 6 {
		HiiragiUtils.removeCrafting(<railcraft:frostbound>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("railcraft_frostbound_stone", <railcraft:frostbound>.definition.makeStack(i));
	}
	//Infernal
	mods.chisel.Carving.addGroup("railcraft_infernal_stone");
	for i in 0 to 6 {
		HiiragiUtils.removeCrafting(<railcraft:infernal>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("railcraft_infernal_stone", <railcraft:infernal>.definition.makeStack(i));
	}
	//Jaded
	mods.chisel.Carving.addGroup("railcraft_jaded_stone");
	mods.chisel.Carving.addVariation("railcraft_jaded_stone", <railcraft:jaded_stone>);
	for i in 0 to 6 {
		HiiragiUtils.removeCrafting(<railcraft:jaded>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("railcraft_jaded_stone", <railcraft:jaded>.definition.makeStack(i));
	}
	//Quarried
	mods.chisel.Carving.addGroup("railcraft_quarried_stone");
	mods.chisel.Carving.addVariation("railcraft_quarried_stone", <railcraft:quarried_stone>);
	for i in 0 to 6 {
		HiiragiUtils.removeCrafting(<railcraft:quarried>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("railcraft_quarried_stone", <railcraft:quarried>.definition.makeStack(i));
	}
	//Sandy
	mods.chisel.Carving.addGroup("railcraft_sandy_stone");
	for i in 0 to 6 {
		HiiragiUtils.removeCrafting(<railcraft:sandy>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("railcraft_sandy_stone", <railcraft:sandy>.definition.makeStack(i));
	}
	//Badlands
	mods.chisel.Carving.addGroup("railcraft_badlands_stone");
	for i in 0 to 6 {
		HiiragiUtils.removeCrafting(<railcraft:badlands>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("railcraft_badlands_stone", <railcraft:badlands>.definition.makeStack(i));
	}
	//Nether
	for i in 1 to 6 {
		HiiragiUtils.removeCrafting(<railcraft:nether>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("netherbrick", <railcraft:nether>.definition.makeStack(i));
	}
	//Red Nether
	mods.chisel.Carving.addGroup("red_nether_stone");
	mods.chisel.Carving.addVariation("red_nether_stone", <minecraft:red_nether_brick>);
	for i in 1 to 6 {
		HiiragiUtils.removeCrafting(<railcraft:red_nether>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("red_nether_stone", <railcraft:red_nether>.definition.makeStack(i));
	}
	//Andesite
	for i in 0 to 6 {
		if (i != 2) {
			HiiragiUtils.removeCrafting(<railcraft:andesite>.definition.makeStack(i));
			mods.chisel.Carving.addVariation("andesite", <railcraft:andesite>.definition.makeStack(i));
		}
	}
	//Diorite
	for i in 0 to 6 {
		if (i != 2) {
			HiiragiUtils.removeCrafting(<railcraft:diorite>.definition.makeStack(i));
			mods.chisel.Carving.addVariation("diorite", <railcraft:diorite>.definition.makeStack(i));
		}
	}
	//Granite
	for i in 0 to 6 {
		if (i != 2) {
			HiiragiUtils.removeCrafting(<railcraft:granite>.definition.makeStack(i));
			mods.chisel.Carving.addVariation("granite", <railcraft:granite>.definition.makeStack(i));
		}
	}
	//Pearlized
	mods.chisel.Carving.addGroup("railcraft_pearlized_stone");
	for i in 0 to 6 {
		HiiragiUtils.removeCrafting(<railcraft:pearlized>.definition.makeStack(i));
		mods.chisel.Carving.addVariation("railcraft_pearlized_stone", <railcraft:pearlized>.definition.makeStack(i));
	}

//Tinker's Contruct / Complement
	/*//Scorched Block
	for i in 0 to 11 {
		HiiragiUtils.removeCrafting(<tcomplement:scorched_block>.definition.makeStack(i));
	}
	//Scorched Block Slab
	mods.chisel.Carving.addGroup("scorched_slab");
	for i in 0 to 7 {
		mods.chisel.Carving.addVariation("scorched_slab", <tcomplement:scorched_slab>.definition.makeStack(i));
	}
	for i in 0 to 3 {
		mods.chisel.Carving.addVariation("scorched_slab", <tcomplement:scorched_slab2>.definition.makeStack(i));
	}*/
	//Seared Block
	for i in 0 to 11 {
		HiiragiUtils.removeCrafting(<tconstruct:seared>.definition.makeStack(i));
	}
	//Seared Block slab
	mods.chisel.Carving.addGroup("tcon_seared_slab");
	for i in 0 to 8 {
		mods.chisel.Carving.addVariation("tcon_seared_slab", <tconstruct:seared_slab>.definition.makeStack(i));
	}
	for i in 0 to 4 {
		mods.chisel.Carving.addVariation("tcon_seared_slab", <tconstruct:seared_slab2>.definition.makeStack(i));
	}
	//Brownstone Block
	mods.chisel.Carving.addGroup("tcon_brownstone_slab");
	for i in 0 to 11 {
		if (i!=1) {
			HiiragiUtils.removeCrafting(<tconstruct:brownstone>.definition.makeStack(i));
		}
	}
	//Brownstone Block Slab
	for i in 0 to 8 {
		mods.chisel.Carving.addVariation("tcon_brownstone_slab", <tconstruct:brownstone_slab>.definition.makeStack(i));
	}
	for i in 0 to 4 {
		mods.chisel.Carving.addVariation("tcon_brownstone_slab", <tconstruct:brownstone_slab2>.definition.makeStack(i));
	}

//Twilight Forest
	//Stone Pillar
	mods.chisel.Carving.addVariation("stonebrick", <twilightforest:stone_twist>);
	mods.chisel.Carving.addVariation("stonebrick", <twilightforest:stone_twist_thin>);

//このscriptの読み込みの完了をログに出力
print("chisel.zs loaded!");
