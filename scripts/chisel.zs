#====================================================================
# ファイル名 : chisel.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Chiselの改変
#====================================================================

#priority 0

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

//OreDict
	val chiselOreDict as IItemStack[][string] = {
		//blocks
			"block_peridot": <ore:blockPeridot>.items,
			"block_ruby": <ore:blockRuby>.items,
			"block_sapphire": <ore:blockSapphire>.items,
		//items
			"item_peridot": <ore:gemPeridot>.items,
			"item_ruby": <ore:gemRuby>.items,
			"item_sapphire": <ore:gemSapphire>.items,
	};
		for i, j in chiselOreDict {
			mods.chisel.Carving.addGroup(i);
			for k in j {
				mods.chisel.Carving.addVariation(i, k);
			}
		}

//Ender IO
	//Decoration
		mods.chisel.Carving.addGroup("enderio_decoration");
		for i in 0 to 15 {
			recipes.remove(<enderio:block_decoration1>.definition.makeStack(i));
			mods.chisel.Carving.addVariation("enderio_decoration", <enderio:block_decoration1>.definition.makeStack(i));
			recipes.remove(<enderio:block_decoration2>.definition.makeStack(i));
			mods.chisel.Carving.addVariation("enderio_decoration", <enderio:block_decoration2>.definition.makeStack(i));
		}
		for i in 0 to 4 {
			recipes.remove(<enderio:block_decoration3>.definition.makeStack(i));
			mods.chisel.Carving.addVariation("enderio_decoration", <enderio:block_decoration3>.definition.makeStack(i));
		}

//HaC
	//Desktop Accessories
		mods.chisel.Carving.addGroup("desktop_accessories");
		for i in 0 to 8 {
			mods.chisel.Carving.addVariation("desktop_accessories", <dcs_climate:dcs_desktop_accessories>.definition.makeStack(i));
		}

	//Marble
		mods.chisel.Carving.addVariation("marble", <dcs_climate:dcs_ore_gemblock:6>);
		mods.chisel.Carving.addVariation("marble", <dcs_climate:dcs_build_bricks:1>);

	//Brass Shaft
		mods.chisel.Carving.addGroup("shaft_brass");
		mods.chisel.Carving.addVariation("shaft_brass", <dcs_climate:dcs_device_shaft_s>);
		mods.chisel.Carving.addVariation("shaft_brass", <dcs_climate:dcs_device_shaft_l>);
		mods.chisel.Carving.addVariation("shaft_brass", <dcs_climate:dcs_device_shaft_ta>);
		mods.chisel.Carving.addVariation("shaft_brass", <dcs_climate:dcs_device_shaft_tb>);
		mods.chisel.Carving.addVariation("shaft_brass", <dcs_climate:dcs_device_shaft_x>);
		mods.chisel.Carving.addVariation("shaft_brass", <dcs_climate:dcs_device_shaft_switch>);

	//Steel Shaft
		mods.chisel.Carving.addGroup("shaft_steel");
		mods.chisel.Carving.addVariation("shaft_steel", <dcs_climate:dcs_device_shaft_s_steel>);
		mods.chisel.Carving.addVariation("shaft_steel", <dcs_climate:dcs_device_shaft_l_steel>);
		mods.chisel.Carving.addVariation("shaft_steel", <dcs_climate:dcs_device_shaft_ta_steel>);
		mods.chisel.Carving.addVariation("shaft_steel", <dcs_climate:dcs_device_shaft_tb_steel>);
		mods.chisel.Carving.addVariation("shaft_steel", <dcs_climate:dcs_device_shaft_x_steel>);
		mods.chisel.Carving.addVariation("shaft_steel", <dcs_climate:dcs_device_shaft_switch_steel>);

	//Stainless Steel Shaft
		mods.chisel.Carving.addGroup("shaft_sus");
		mods.chisel.Carving.addVariation("shaft_sus", <dcs_climate:dcs_device_shaft_s_sus>);
		mods.chisel.Carving.addVariation("shaft_sus", <dcs_climate:dcs_device_shaft_l_sus>);
		mods.chisel.Carving.addVariation("shaft_sus", <dcs_climate:dcs_device_shaft_ta_sus>);
		mods.chisel.Carving.addVariation("shaft_sus", <dcs_climate:dcs_device_shaft_tb_sus>);
		mods.chisel.Carving.addVariation("shaft_sus", <dcs_climate:dcs_device_shaft_x_sus>);
		//mods.chisel.Carving.addVariation("shaft_sus", <dcs_climate:dcs_device_shaft_switch_sus>);

	//Steel Shaft (Lossless)
		mods.chisel.Carving.addGroup("shaft_steel_lossless");
		mods.chisel.Carving.addVariation("shaft_steel_lossless", <hap:shaft_straight_steel>);
		mods.chisel.Carving.addVariation("shaft_steel_lossless", <hap:shaft_l_shaped_steel>);
		mods.chisel.Carving.addVariation("shaft_steel_lossless", <hap:shaft_bifurcated_steel>);
		mods.chisel.Carving.addVariation("shaft_steel_lossless", <hap:shaft_perpendicular_steel>);
		mods.chisel.Carving.addVariation("shaft_steel_lossless", <hap:shaft_t_shaped_steel>);
		mods.chisel.Carving.addVariation("shaft_steel_lossless", <hap:shaft_x_shaped_steel>);

	//Stainless Steel Shaft (Lossless)
		mods.chisel.Carving.addGroup("shaft_sus_lossless");
		mods.chisel.Carving.addVariation("shaft_sus_lossless", <hap:shaft_straight_sus>);
		mods.chisel.Carving.addVariation("shaft_sus_lossless", <hap:shaft_l_shaped_sus>);
		mods.chisel.Carving.addVariation("shaft_sus_lossless", <hap:shaft_bifurcated_sus>);
		mods.chisel.Carving.addVariation("shaft_sus_lossless", <hap:shaft_perpendicular_sus>);
		mods.chisel.Carving.addVariation("shaft_sus_lossless", <hap:shaft_t_shaped_sus>);
		mods.chisel.Carving.addVariation("shaft_sus_lossless", <hap:shaft_x_shaped_sus>);

//Railcraft
	//Abyssal
		mods.chisel.Carving.addGroup("abyssal_stone");
		mods.chisel.Carving.addVariation("abyssal_stone", <railcraft:abyssal_stone>);
		for i in 0 to 5 {
			recipes.remove(<railcraft:abyssal>.definition.makeStack(i));
			mods.chisel.Carving.addVariation("abyssal_stone", <railcraft:abyssal>.definition.makeStack(i));
		}
	//Bleached Bone
		mods.chisel.Carving.addGroup("bleachedbone_stone");
		for i in 0 to 5 {
			recipes.remove(<railcraft:bleachedbone>.definition.makeStack(i));
			mods.chisel.Carving.addVariation("bleachedbone_stone", <railcraft:bleachedbone>.definition.makeStack(i));
		}
	//Blood Stained
		mods.chisel.Carving.addGroup("bloodstained_stone");
		for i in 0 to 5 {
			recipes.remove(<railcraft:bloodstained>.definition.makeStack(i));
			mods.chisel.Carving.addVariation("bloodstained_stone", <railcraft:bloodstained>.definition.makeStack(i));
		}
	//Frost Bound
		mods.chisel.Carving.addGroup("frostbound_stone");
		for i in 0 to 5 {
			recipes.remove(<railcraft:frostbound>.definition.makeStack(i));
			mods.chisel.Carving.addVariation("frostbound_stone", <railcraft:frostbound>.definition.makeStack(i));
		}
	//Infernal
		mods.chisel.Carving.addGroup("infernal_stone");
		for i in 0 to 5 {
			recipes.remove(<railcraft:infernal>.definition.makeStack(i));
			mods.chisel.Carving.addVariation("infernal_stone", <railcraft:infernal>.definition.makeStack(i));
		}
	//Quarried
		mods.chisel.Carving.addGroup("quarried_stone");
		mods.chisel.Carving.addVariation("quarried_stone", <railcraft:quarried_stone>);
		for i in 0 to 5 {
			recipes.remove(<railcraft:quarried>.definition.makeStack(i));
			mods.chisel.Carving.addVariation("quarried_stone", <railcraft:quarried>.definition.makeStack(i));
		}
	//Sandy
		mods.chisel.Carving.addGroup("sandy_stone");
		for i in 0 to 5 {
			recipes.remove(<railcraft:sandy>.definition.makeStack(i));
			mods.chisel.Carving.addVariation("sandy_stone", <railcraft:sandy>.definition.makeStack(i));
		}
	//Badlands
		mods.chisel.Carving.addGroup("badlands_stone");
		for i in 0 to 5 {
			recipes.remove(<railcraft:badlands>.definition.makeStack(i));
			mods.chisel.Carving.addVariation("badlands_stone", <railcraft:badlands>.definition.makeStack(i));
		}
	//Nether
		for i in 1 to 5 {
			recipes.remove(<railcraft:nether>.definition.makeStack(i));
			mods.chisel.Carving.addVariation("netherbrick", <railcraft:nether>.definition.makeStack(i));
		}
	//Red Nether
		mods.chisel.Carving.addGroup("red_nether_stone");
		mods.chisel.Carving.addVariation("red_nether_stone", <minecraft:red_nether_brick>);
		for i in 0 to 5 {
			recipes.remove(<railcraft:red_nether>.definition.makeStack(i));
			mods.chisel.Carving.addVariation("rednether_stone", <railcraft:red_nether>.definition.makeStack(i));
		}
	//Andesite
		for i in 0 to 5 {
			recipes.remove(<railcraft:andesite>.definition.makeStack(i));
			mods.chisel.Carving.addVariation("andesite", <railcraft:andesite>.definition.makeStack(i));
		}
	//Diorite
		for i in 0 to 5 {
			recipes.remove(<railcraft:diorite>.definition.makeStack(i));
			mods.chisel.Carving.addVariation("diorite", <railcraft:diorite>.definition.makeStack(i));
		}
	//Granite
		for i in 0 to 5 {
			recipes.remove(<railcraft:granite>.definition.makeStack(i));
			mods.chisel.Carving.addVariation("granite", <railcraft:granite>.definition.makeStack(i));
		}
	//Pearlized
		mods.chisel.Carving.addGroup("pearlized_stone");
		for i in 0 to 5 {
			recipes.remove(<railcraft:pearlized>.definition.makeStack(i));
			mods.chisel.Carving.addVariation("rednether_stone", <railcraft:pearlized>.definition.makeStack(i));
		}

//Tinker's Contruct / Complement
	/*//Scorched Block
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
		}*/
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
