#====================================================================
# ファイル名 : extraUtil.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : このファイルについて書く
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.artisanworktables.builder.RecipeBuilder;
import mods.ctintegration.util.RecipePattern;
import extrautilities2.Tweaker.IMachine;
import extrautilities2.Tweaker.IMachineRegistry;
import extrautilities2.Tweaker.IMachineSlot;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading extraUtil.zs ...");

//変数の定義

//作業台レシピの編集
	//削除
		val removeCrafting as IItemStack[] = [];
		for i in removeCrafting {
			HiiragiUtils.removeCrafting(i);
		}
	//上書き
	//新規
		HiiragiUtils.addCraftingShapeless(false, <extrautils2:creativeharvest>, [<extrautils2:creativeharvest>, <*>.marked("creative")], function(out, ins, cInfo) {
			var owner as string = ins.creative.definition.owner;
			var id as string = ins.creative.definition.id.split(":")[1];
			var idMod as string = owner ~ ":" ~ id;
			var meta as int = ins.creative.metadata;
			return <extrautils2:creativeharvest>.withTag({creative_block: {meta: meta, block: idMod}, display_stack: {id: idMod, Count: 1 as byte, Damage: meta as short}});
		}, null);

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

//新規機械の実装
	extrautilities2.Tweaker.IMachineRegistry.createNewMachine(
		"assembler",
		50000,
		80,
		[
			extrautilities2.Tweaker.IMachineSlot.newItemStackSlot("assembler_itemIn1"),
			extrautilities2.Tweaker.IMachineSlot.newItemStackSlot("assembler_itemIn2")
		],
		[
			extrautilities2.Tweaker.IMachineSlot.newItemStackSlot("assembler_itemOut1")
		],
		"thermalexpansion:blocks/machine/machine_face_crafter",
		"thermalexpansion:blocks/machine/machine_active_crafter"
	);

//ExU機械のレシピ
	val machineAssembler as IMachine = extrautilities2.Tweaker.IMachineRegistry.getMachine("assembler");
	machineAssembler.addRecipe({
		"paperBlack": <ore:paperBlack>,
		"ingotRedstoneAlloy": <ore:ingotRedstoneAlloy>
	},
	{
		"redstoneFilterBase": <enderio:item_material:60> % 100
	}, 5000, 10*20);

//このscriptの読み込みの完了をログに出力
print("extraUtil.zs loaded!");
