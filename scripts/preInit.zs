#====================================================================
# ファイル名 : preInit.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Script loaded in preInit
#====================================================================

#loader preinit
#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import extrautilities2.Tweaker.IMachine;
import extrautilities2.Tweaker.IMachineRegistry;
import extrautilities2.Tweaker.IMachineSlot;

//scriptのimport

//このscriptの読み込みの開始をログに出力
print("Start loading preInit.zs ...");

//Assemblerの登録
	extrautilities2.Tweaker.IMachineRegistry.createNewMachine(
		"assembler",
		50000,
		80,
		[
			extrautilities2.Tweaker.IMachineSlot.newItemStackSlot("input1"),
			extrautilities2.Tweaker.IMachineSlot.newItemStackSlot("input2")
		],
		[
			extrautilities2.Tweaker.IMachineSlot.newItemStackSlot("output")
		],
		"extrautils2:machine/assembler_off",
		"extrautils2:machine/assembler_on"
	);

//Apiaryの登録
	extrautilities2.Tweaker.IMachineRegistry.createNewMachine(
		"apiary",
		0,
		0,
		[extrautilities2.Tweaker.IMachineSlot.newItemStackSlot("input"),],
		[extrautilities2.Tweaker.IMachineSlot.newItemStackSlot("output")],
		"extrautils2:machine/apiary_off",
		"extrautils2:machine/apiary_on"
	);

//このscriptの読み込みの完了をログに出力
print("preInit.zs loaded!");
