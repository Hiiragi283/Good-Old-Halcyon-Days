#====================================================================
# ファイル名 : RussellUtils.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Registry some functions for Content Tweaker
#        このスクリプトの一部はMorphosDaysを参考にしています
#        https://github.com/delta-nos/MorphoDays_old
#====================================================================

#priority 999
#loader contenttweaker

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.world.IBlockAccess;

//各種modからclassをimport
import mods.contenttweaker.BlockState;
import mods.contenttweaker.BlockPos;
import mods.contenttweaker.Color;
import mods.contenttweaker.IBlockAction;
import mods.contenttweaker.IBlockColorSupplier;
import mods.contenttweaker.BlockMaterial;
import mods.contenttweaker.Material;
import mods.contenttweaker.MaterialPartData;
import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.PartBuilder;
import mods.contenttweaker.PartType;
import mods.contenttweaker.ResourceLocation;
import mods.contenttweaker.SoundType;
import mods.contenttweaker.VanillaFactory;
import mods.zenutils.HexHelper;

//このscriptの読み込みの開始をログに出力
print("Start loading RussellUtils.zs ...");

//アイテムの登録処理
	function addItem (id as string) {
		mods.contenttweaker.VanillaFactory.createItem(id).register();
	}

	function addItemColored (id  as string, color as string, texture as string) {
		var item = mods.contenttweaker.VanillaFactory.createItem(id);
		item.itemColorSupplier = function(item, tintindex) {
				return Color.fromHex(color);
			};
			item.textureLocation = ResourceLocation.create(texture);
			item.register();
	}

	function addItemShimmer (id as string) {
		var itemShimmer = mods.contenttweaker.VanillaFactory.createItem(id);
		itemShimmer.glowing = true;
		itemShimmer.register();
	}

//ブロックの登録処理
	function addBlock (id as string, material as BlockMaterial, hardness as float, resistance as float, tool as string, toolLevel as int, sound as SoundType, isFull as bool) {
		var block = VanillaFactory.createBlock(id, material);
		block.setBlockHardness(hardness);
		block.setBlockResistance(resistance);
		block.setToolClass(tool);
		block.setToolLevel(toolLevel);
		block.setBlockSoundType(sound);
		block.fullBlock = isFull;
		block.register();
	}

	function addBlockColored (id as string, material as BlockMaterial, hardness as float, resistance as float, tool as string, toolLevel as int, sound as SoundType, color as string) {
		var block = VanillaFactory.createBlock(id, material);
		block.setBlockHardness(hardness);
		block.setBlockResistance(resistance);
		block.setToolClass(tool);
		block.setToolLevel(toolLevel);
		block.setBlockSoundType(sound);
		block.blockColorSupplier = function(state as BlockState, access as IBlockAccess, pos as BlockPos, tintIndex as int) as Color {
			return Color.fromHex(color);
		};
		block.itemColorSupplier = function(item, tintindex) {
			return Color.fromHex(color);
		};
		block.register();
	}

	function addDustBlock (id as string, material as BlockMaterial, hardness as float, resistance as float, tool as string, toolLevel as int, sound as SoundType) {
		var block = VanillaFactory.createBlock(id, material);
		block.setBlockHardness(hardness);
		block.setBlockResistance(resistance);
		block.setToolClass(tool);
		block.setToolLevel(toolLevel);
		block.setBlockSoundType(sound);
		/*block.onRandomTick = function(world, blockPos, blockState){
		//	return true;
		};*/
		block.register();
	}

//このscriptの読み込みの完了をログに出力
print("RussellUtils.zs loaded!");
