#====================================================================
# ファイル名 : requiousFrakto.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts forr Requious Frakto
#====================================================================

#priority 0

//crafttweakerからclassをimport
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

//各種modからclassをimport
import mods.ctintegration.util.RecipePattern;
import mods.requious.AssemblyRecipe;
import mods.requious.ComponentFace;
import mods.requious.SlotVisual;

//scriptのimport
import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading requiousFrakto.zs ...");

val itemEmpty = <openblocks:generic:10>.withTag({display: {Name: "Empty"}});

//Scavengeのレシピをより見やすくする
	//スロットの指定
		//Input
		<assembly:info_scavenge>.setItemSlot(1, 1, ComponentFace.all(), 1)
			.setAccess(false, false)
			.setGroup("iconLeft");
		<assembly:info_scavenge>.setItemSlot(3, 1, ComponentFace.all(), 1)
			.setAccess(false, false)
			.setGroup("iconRight");
		<assembly:info_scavenge>.setItemSlot(1, 2, ComponentFace.all(), 1)
			.setAccess(false, false)
			.setGroup("itemOff");
		<assembly:info_scavenge>.setItemSlot(2, 2, ComponentFace.all(), 1)
			.setAccess(false, false)
			.setGroup("blockFrom");
		<assembly:info_scavenge>.setItemSlot(3, 2, ComponentFace.all(), 1)
			.setAccess(false, false)
			.setGroup("itemMain");
		//Output
		<assembly:info_scavenge>.setItemSlot(2, 4, ComponentFace.all(), 1)
			.setAccess(false, false)
			.setGroup("blockTo");
		for i in 5 to 8 {
			for j in 1 to 5 {
				<assembly:info_scavenge>.setItemSlot(i, j, ComponentFace.all(), 1)
					.setAccess(false, false)
					.setGroup("itemDrop_" ~ i ~ "_" ~ j);
			}
		}
	//JEI上のスロットの登録
		//Input
		<assembly:info_scavenge>.setJEIItemSlot(1, 1, "iconLeft");
		<assembly:info_scavenge>.setJEIItemSlot(3, 1, "iconRight");
		<assembly:info_scavenge>.setJEIItemSlot(1, 2, "itemOff");
		<assembly:info_scavenge>.setJEIItemSlot(2, 2, "blockFrom");
		<assembly:info_scavenge>.setJEIItemSlot(3, 2, "itemMain");
		//Output
		<assembly:info_scavenge>.setJEIItemSlot(2, 4, "blockTo");
		for i in 5 to 8 {
			for j in 1 to 5 {
				<assembly:info_scavenge>.setJEIItemSlot(i, j, "itemDrop_" ~ i ~ "_" ~ j);
			}
		}
		//GUI上の画像とか
		var arrowDown = SlotVisual.create(1, 1).addPart("requious:textures/gui/assembly_gauges.png", 2, 8);
		<assembly:info_scavenge>.setJEIDurationSlot(2, 3, "arrowDown", arrowDown);
	//JEI上のレシピの登録
		var unfiredTable = AssemblyRecipe.create(function(container) {
				container.addItemOutput("blockTo", <contenttweaker:unfired_casting_table>);
			}).requireItem("iconLeft", <openblocks:glyph:76>)
			.requireItem("iconRight", <openblocks:glyph:82>)
			.requireItem("itemMain", <minecraft:stick>)
			.requireItem("blockFrom", <tconstruct:soil:0>)
			.requireItem("itemDrop_5_1", <contenttweaker:grout_ball>);
		<assembly:info_scavenge>.addJEIRecipe(unfiredTable);

		var unfiredBasin = AssemblyRecipe.create(function(container) {
				container.addItemOutput("blockTo", <contenttweaker:unfired_casting_basin>);
			}).requireItem("iconLeft", <openblocks:glyph:76>)
			.requireItem("iconRight", <openblocks:glyph:82>)
			.requireItem("itemMain", <minecraft:stick>)
			.requireItem("blockFrom", <contenttweaker:unfired_casting_table>)
			.requireItem("itemDrop_5_1", <contenttweaker:grout_ball>);
		<assembly:info_scavenge>.addJEIRecipe(unfiredBasin);

var unfiredChannel = AssemblyRecipe.create(function(container) {
				container.addItemOutput("blockTo", <contenttweaker:unfired_casting_channel>);
			}).requireItem("iconLeft", <openblocks:glyph:76>)
			.requireItem("iconRight", <openblocks:glyph:82>)
			.requireItem("itemMain", <minecraft:stick>)
			.requireItem("blockFrom", <contenttweaker:unfired_casting_basin>)
			.requireItem("itemDrop_5_1", <contenttweaker:grout_ball>);
		<assembly:info_scavenge>.addJEIRecipe(unfiredChannel);

var unfiredFinish = AssemblyRecipe.create(function(container) {
				container.addItemOutput("blockTo", <contenttweaker:grout_ball>);
			}).requireItem("iconLeft", <openblocks:glyph:76>)
			.requireItem("iconRight", <openblocks:glyph:82>)
			.requireItem("itemMain", <minecraft:stick>)
			.requireItem("blockFrom", <contenttweaker:unfired_casting_channel>);
		<assembly:info_scavenge>.addJEIRecipe(unfiredFinish);

//このscriptの読み込みの完了をログに出力
print("requiousFrakto.zs loaded!");
