#====================================================================
# ファイル名 : RussellUtils.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Registry some functions for Content Tweaker
#        このスクリプトの一部はMorphosDaysを参考にしています
#        https://github.com/delta-nos/MorphoDays_old
#====================================================================

#norun
#priority 999
#loader contenttweaker

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.world.IBlockAccess;

//各種modからclassをimport
import mods.contenttweaker.AxisAlignedBB;
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

//このscriptの読み込みの完了をログに出力
print("RussellUtils.zs loaded!");
