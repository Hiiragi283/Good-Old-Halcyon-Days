#======================================================================
# ファイル名 : dcs_climate-machine.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : このファイルについて書く
#======================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading dcs_climate-machine.zs ...");

//変数の定義

//作業台レシピの編集
    //削除
        val removeCrafting as IItemStack[] = [
			<dcs_climate:dcs_device_shaft_s>,
			<dcs_climate:dcs_device_shaft_l>,
			<dcs_climate:dcs_device_shaft_ta>,
			<dcs_climate:dcs_device_shaft_tb>,
			<dcs_climate:dcs_device_shaft_x>,
			<dcs_climate:dcs_device_handcrank>,
			<dcs_climate:dcs_device_shaft_s_steel>,
			<dcs_climate:dcs_device_shaft_l_steel>,
			<dcs_climate:dcs_device_shaft_ta_steel>,
			<dcs_climate:dcs_device_shaft_tb_steel>,
			<dcs_climate:dcs_device_shaft_x_steel>,
			<dcs_climate:dcs_device_shaft_s_sus>,
			<dcs_climate:dcs_device_shaft_l_sus>,
			<dcs_climate:dcs_device_shaft_ta_sus>,
			<dcs_climate:dcs_device_shaft_tb_sus>,
			<dcs_climate:dcs_device_shaft_x_sus>,
			<hap:shaft_straight_steel>,
			<hap:shaft_l_shaped_steel>,
			<hap:shaft_bifurcated_steel>,
			<hap:shaft_perpendicular_steel>,
			<hap:shaft_t_shaped_steel>,
			<hap:shaft_x_shaped_steel>,
			<hap:shaft_straight_sus>,
			<hap:shaft_l_shaped_sus>,
			<hap:shaft_bifurcated_sus>,
			<hap:shaft_perpendicular_sus>,
			<hap:shaft_t_shaped_sus>,
			<hap:shaft_x_shaped_sus>,
		];
        for i in removeCrafting {
            HiiragiUtils.removeCrafting(i);
        }
    //上書き
		HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_bellow>, RecipePattern.init(["ABA", "CDC", "ABA"]).map({A:<ore:stickIron>, B:<ore:itemLeather>, C:<ore:plateIron>, D:<ore:craftingPiston>}).ingredients);
		HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_chamber>, RecipePattern.init(["AAA", "ABA", "ACA"]).map({A:<tconstruct:seared:0>, B:<minecraft:blaze_rod>, C:<dcs_climate:dcs_cont_log:6>}).ingredients);
		HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_spinning_machine>, RecipePattern.init(["AAB", "CCB", "DDD"]).map({A:<ore:plateIron>, B:<ore:gearBrass>, C:<ore:stickIron>, D:<ore:plankWood>}).ingredients);
		HiiragiUtils.addCrafting(false, true, <dcs_climate:dcs_device_fan>, RecipePattern.init(["ABA", "ACD", "ABA"]).map({A:<ore:plateIron>, B:<minecraft:iron_bars>, C:<libvulpes:productfan:6>, D:<ore:gearBrass>}).ingredients);
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
		RecipeBuilder.get("basic")
			.setShaped(RecipePattern.init(["  A  ", "  A  ", "AABAA", "  A  ", "  A  "]).map({A:<ore:plateWood>, B:<dcs_climate:dcs_device_windmill>}).ingredients)
		.addOutput(<dcs_climate:dcs_device_windmill_l>)
		.create();
		//Brass Shaft
		RecipeBuilder.get("basic")
			.setShaped([
				[<ore:platebrass>],
				[<ore:gearBrass>],
				[<ore:platebrass>]])
			.setSecondaryIngredients([<ore:dyeRed>, <ore:dyeBlue>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<dcs_climate:dcs_device_shaft_s> * 8)
			.create();
		RecipeBuilder.get("basic")
			.setShaped([
				[null, <ore:platebrass>],
				[<ore:platebrass>, <ore:gearBrass>]])
			.setSecondaryIngredients([<ore:dyeRed>, <ore:dyeBlue>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<dcs_climate:dcs_device_shaft_l> * 8)
			.create();
		RecipeBuilder.get("basic")
			.setShaped([
				[null, <ore:platebrass>],
				[<ore:platebrass>, <ore:gearBrass>],
				[null, <ore:platebrass>]])
			.setSecondaryIngredients([<ore:dyeRed>*2, <ore:dyeBlue>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<dcs_climate:dcs_device_shaft_ta> * 8)
			.create();
		RecipeBuilder.get("basic")
			.setShaped([
				[null, <ore:platebrass>, null],
				[<ore:platebrass>, <ore:gearBrass>, <ore:platebrass>]])
			.setSecondaryIngredients([<ore:dyeRed>*2, <ore:dyeBlue>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<dcs_climate:dcs_device_shaft_tb> * 8)
			.create();
		RecipeBuilder.get("basic")
			.setShaped([
				[null, <ore:platebrass>, null],
				[<ore:platebrass>, <ore:gearBrass>, <ore:platebrass>],
				[null, <ore:platebrass>, null]])
			.setSecondaryIngredients([<ore:dyeRed>*3, <ore:dyeBlue>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<dcs_climate:dcs_device_shaft_x> * 8)
			.create();
		RecipeBuilder.get("basic")
			.setShaped([
				[<ore:itemLeather>],
				[<appliedenergistics2:crank>],
				[<ore:gearBrass>]])
			.setSecondaryIngredients([<ore:dyeRed>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<dcs_climate:dcs_device_handcrank>)
			.create();
		//Steel Shaft
		RecipeBuilder.get("basic")
			.setShaped([
				[<ore:plateSteel>],
				[<ore:gearSteel>],
				[<ore:plateSteel>]])
			.setSecondaryIngredients([<ore:dyeRed>, <ore:dyeBlue>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<dcs_climate:dcs_device_shaft_s_steel> * 8)
			.create();
		RecipeBuilder.get("basic")
			.setShaped([
				[null, <ore:plateSteel>],
				[<ore:plateSteel>, <ore:gearSteel>]])
			.setSecondaryIngredients([<ore:dyeRed>, <ore:dyeBlue>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<dcs_climate:dcs_device_shaft_l_steel> * 8)
			.create();
		RecipeBuilder.get("basic")
			.setShaped([
				[null, <ore:plateSteel>],
				[<ore:plateSteel>, <ore:gearSteel>],
				[null, <ore:plateSteel>]])
			.setSecondaryIngredients([<ore:dyeRed>*2, <ore:dyeBlue>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<dcs_climate:dcs_device_shaft_ta_steel> * 8)
			.create();
		RecipeBuilder.get("basic")
			.setShaped([
				[null, <ore:plateSteel>, null],
				[<ore:plateSteel>, <ore:gearSteel>, <ore:plateSteel>]])
			.setSecondaryIngredients([<ore:dyeRed>*2, <ore:dyeBlue>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<dcs_climate:dcs_device_shaft_tb_steel> * 8)
			.create();
		RecipeBuilder.get("basic")
			.setShaped([
				[null, <ore:plateSteel>, null],
				[<ore:plateSteel>, <ore:gearSteel>, <ore:plateSteel>],
				[null, <ore:plateSteel>, null]])
			.setSecondaryIngredients([<ore:dyeRed>*3, <ore:dyeBlue>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<dcs_climate:dcs_device_shaft_x_steel> * 8)
			.create();
		//Stainless Steel Shaft
		RecipeBuilder.get("basic")
			.setShaped([
				[<ore:plateStainlessSteel>],
				[<ore:gearToolSteel>],
				[<ore:plateStainlessSteel>]])
			.setSecondaryIngredients([<ore:dyeRed>, <ore:dyeBlue>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<dcs_climate:dcs_device_shaft_s_sus> * 8)
			.create();
		RecipeBuilder.get("basic")
			.setShaped([
				[null, <ore:plateStainlessSteel>],
				[<ore:plateStainlessSteel>, <ore:gearToolSteel>]])
			.setSecondaryIngredients([<ore:dyeRed>, <ore:dyeBlue>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<dcs_climate:dcs_device_shaft_l_sus> * 8)
			.create();
		RecipeBuilder.get("basic")
			.setShaped([
				[null, <ore:plateStainlessSteel>],
				[<ore:plateStainlessSteel>, <ore:gearToolSteel>],
				[null, <ore:plateStainlessSteel>]])
			.setSecondaryIngredients([<ore:dyeRed>*2, <ore:dyeBlue>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<dcs_climate:dcs_device_shaft_ta_sus> * 8)
			.create();
		RecipeBuilder.get("basic")
			.setShaped([
				[null, <ore:plateStainlessSteel>, null],
				[<ore:plateStainlessSteel>, <ore:gearToolSteel>, <ore:plateStainlessSteel>]])
			.setSecondaryIngredients([<ore:dyeRed>*2, <ore:dyeBlue>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<dcs_climate:dcs_device_shaft_tb_sus> * 8)
			.create();
		RecipeBuilder.get("basic")
			.setShaped([
				[null, <ore:plateStainlessSteel>, null],
				[<ore:plateStainlessSteel>, <ore:gearToolSteel>, <ore:plateStainlessSteel>],
				[null, <ore:plateStainlessSteel>, null]])
			.setSecondaryIngredients([<ore:dyeRed>*3, <ore:dyeBlue>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<dcs_climate:dcs_device_shaft_x_sus> * 8)
			.create();
		//Lossless Steel Shaft
		RecipeBuilder.get("basic")
			.setShaped([
				[<ore:plateSteel>],
				[<ore:gearSteel>],
				[<ore:plateSteel>]])
			.setSecondaryIngredients([<ore:dyeRed>, <ore:dyeBlue>, <ore:dustMolybdenum>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<hap:shaft_straight_steel> * 8)
			.create();
		RecipeBuilder.get("basic")
			.setShaped([
				[null, <ore:plateSteel>],
				[<ore:plateSteel>, <ore:gearSteel>]])
			.setSecondaryIngredients([<ore:dyeRed>, <ore:dyeBlue>, <ore:dustMolybdenum>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<hap:shaft_l_shaped_steel> * 8)
			.create();
		RecipeBuilder.get("basic")
			.setShaped([
				[null, <ore:plateSteel>],
				[<ore:plateSteel>, <ore:gearSteel>],
				[null, <ore:plateSteel>]])
			.setSecondaryIngredients([<ore:dyeRed>*2, <ore:dyeBlue>, <ore:dustMolybdenum>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<hap:shaft_bifurcated_steel> * 8)
			.create();
		RecipeBuilder.get("basic")
			.setShaped([
				[null, <ore:plateSteel>, null],
				[<ore:plateSteel>, <ore:gearSteel>, <ore:plateSteel>]])
			.setSecondaryIngredients([<ore:dyeRed>*2, <ore:dyeBlue>, <ore:dustMolybdenum>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<hap:shaft_t_shaped_steel> * 8)
			.create();
		RecipeBuilder.get("basic")
			.setShaped([
				[null, <ore:plateSteel>, null],
				[<ore:plateSteel>, <ore:gearSteel>, <ore:plateSteel>],
				[null, <ore:plateSteel>, null]])
			.setSecondaryIngredients([<ore:dyeRed>*3, <ore:dyeBlue>, <ore:dustMolybdenum>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<hap:shaft_x_shaped_steel> * 8)
			.create();
		RecipeBuilder.get("basic")
			.setShaped([
				[<ore:plateSteel>, <ore:plateSteel>],
				[<ore:plateSteel>, <ore:gearSteel>]])
			.setSecondaryIngredients([<ore:dyeRed>*3, <ore:dyeBlue>, <ore:dustMolybdenum>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<hap:shaft_perpendicular_steel> * 8)
			.create();
		//Lossless Stainless Steel Shaft
		RecipeBuilder.get("basic")
			.setShaped([
				[<ore:plateStainlessSteel>],
				[<ore:gearToolSteel>],
				[<ore:plateStainlessSteel>]])
			.setSecondaryIngredients([<ore:dyeRed>, <ore:dyeBlue>, <hap:coating_molybdenum>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<hap:shaft_straight_sus> * 8)
			.create();
		RecipeBuilder.get("basic")
			.setShaped([
				[null, <ore:plateStainlessSteel>],
				[<ore:plateStainlessSteel>, <ore:gearToolSteel>]])
			.setSecondaryIngredients([<ore:dyeRed>, <ore:dyeBlue>, <hap:coating_molybdenum>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<hap:shaft_l_shaped_sus> * 8)
			.create();
		RecipeBuilder.get("basic")
			.setShaped([
				[null, <ore:plateStainlessSteel>],
				[<ore:plateStainlessSteel>, <ore:gearToolSteel>],
				[null, <ore:plateStainlessSteel>]])
			.setSecondaryIngredients([<ore:dyeRed>*2, <ore:dyeBlue>, <hap:coating_molybdenum>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<hap:shaft_bifurcated_sus> * 8)
			.create();
		RecipeBuilder.get("basic")
			.setShaped([
				[null, <ore:plateStainlessSteel>, null],
				[<ore:plateStainlessSteel>, <ore:gearToolSteel>, <ore:plateStainlessSteel>]])
			.setSecondaryIngredients([<ore:dyeRed>*2, <ore:dyeBlue>, <hap:coating_molybdenum>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<hap:shaft_t_shaped_sus> * 8)
			.create();
		RecipeBuilder.get("basic")
			.setShaped([
				[null, <ore:plateStainlessSteel>, null],
				[<ore:plateStainlessSteel>, <ore:gearToolSteel>, <ore:plateStainlessSteel>],
				[null, <ore:plateStainlessSteel>, null]])
			.setSecondaryIngredients([<ore:dyeRed>*3, <ore:dyeBlue>, <hap:coating_molybdenum>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<hap:shaft_x_shaped_sus> * 8)
			.create();
		RecipeBuilder.get("basic")
			.setShaped([
				[<ore:plateStainlessSteel>, <ore:plateStainlessSteel>],
				[<ore:plateStainlessSteel>, <ore:gearToolSteel>]])
			.setSecondaryIngredients([<ore:dyeRed>*3, <ore:dyeBlue>, <ore:dustMolybdenum>])
			.addTool(<ore:artisansFile>, 1)
			.addTool(<ore:artisansSolderer>, 1)
			.addOutput(<hap:shaft_perpendicular_sus> * 8)
			.create();

//このscriptの読み込みの完了をログに出力
print("dcs_climate-machine.zs loaded!");
