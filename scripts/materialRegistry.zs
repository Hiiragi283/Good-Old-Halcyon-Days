#====================================================================
# ファイル名 : materialRegistry.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : 素材の登録
#        このスクリプトの一部はSevtech-Agesを参考にしています
#        https://github.com/DarkPacks/SevTech-Ages
#====================================================================

//norun
#loader contenttweaker
#priority 100

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.contenttweaker.BlockState;
import mods.contenttweaker.BlockPos;
import mods.contenttweaker.Color;
import mods.contenttweaker.IBlockColorSupplier;
import mods.contenttweaker.Material;
import mods.contenttweaker.MaterialPartData;
import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.PartBuilder;
import mods.contenttweaker.PartType;
import mods.contenttweaker.ResourceLocation;
import mods.contenttweaker.VanillaFactory;
import mods.zenutils.HexHelper;

//scriptのimport
import scripts.RussellUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading materialRegistry.zs ...");

//関数の定義
	function funcRegisterMaterial(id as string, color as string) as Material {
		return MaterialSystem.getMaterialBuilder().setName(id).setColor(HexHelper.toDecInteger(color)).build();
	}

	function funcRegisterParts(id as string, partType as string, prefix as string) {
		return mods.contenttweaker.MaterialSystem.getPartBuilder().setName(id).setPartType(MaterialSystem.getPartType(partType)).setOreDictName(prefix).build();
	}

//素材とその色の定義
		val materialSilicon = funcRegisterMaterial("Silicon", "3C3C50");
		val materialAluminum = funcRegisterMaterial("Aluminum", "E2D1CE");
		val materialTitaniumAlloy = funcRegisterMaterial("Titanium Alloy", "AE9169");
		val materialTitaniumTetrachloride = funcRegisterMaterial("titanium_tetrachloride", "D40D5C"); //TiCl4
		val materialMangalloy = funcRegisterMaterial("Mangalloy", "BEA0A4");
		val materialIron = funcRegisterMaterial("Iron", "C8C8C8");
		val materialStainlessSteel = funcRegisterMaterial("Stainless Steel", "D6D6D9"); //Fe6Ni2Mn
		val materialSteel = funcRegisterMaterial("Steel", "808080");
		val materialToolSteel = funcRegisterMaterial("Tool Steel", "919990");
		val materialCobalt = funcRegisterMaterial("Cobalt", "5050FA");
		val materialNickelSilver = funcRegisterMaterial("Nickelsilver", "AABFBF"); //CoAsS
		val materialCopper = funcRegisterMaterial("Copper", "FF6400");
		val materialBrass = funcRegisterMaterial("Brass", "FFB400"); //Cu3Zn
		val materialBronze = funcRegisterMaterial("Bronze", "FF8000"); //Cu3Sn
		val materialTin = funcRegisterMaterial("Tin", "DCDCDC");
		val materialOsmium = funcRegisterMaterial("Osmium", "B4BDD3");
		val materialPlatinum = funcRegisterMaterial("Platinum", "C2D0D8");
		val materialGold = funcRegisterMaterial("Gold", "FFE650");
		val materialElectrum = funcRegisterMaterial("Electrum", "BE9A45");
		val materialCinnabar = funcRegisterMaterial("Cinnabar", "960000"); //HgS
		val materialLead = funcRegisterMaterial("Lead", "605E6A");
		val materialGalena = funcRegisterMaterial("Galena", "643C64"); //AgPb
		val materialRuby = funcRegisterMaterial("Ruby", "FF6464");
		val materialSapphire = funcRegisterMaterial("Sapphire", "6464C8");
		//val materialGrout = funcRegisterMaterial("Grout", "D0D1D6");
		val materialRedstone = funcRegisterMaterial("Redstone", "C80000");
		val materialManasteel = funcRegisterMaterial("Manasteel", "0073FF");
		val materialTerrasteel = funcRegisterMaterial("Terrasteel", "A8FD55");
		val materialElementium = funcRegisterMaterial("Elementium", "EF5CD0");
		val materialRedAlloy = funcRegisterMaterial("Redstone Alloy", "C80000");
		val materialDarkSteel = funcRegisterMaterial("Dark Steel", "3A3A3A");
		val materialSoularium = funcRegisterMaterial("Soularium", "8A745C");
		val materialEndSteel = funcRegisterMaterial("End Steel", "D5CF9B");
		val materialIronwood = funcRegisterMaterial("Ironwood", "857648");
		val materialFiery = funcRegisterMaterial("Fiery", "391D1E");
		val materialKnightmetal = funcRegisterMaterial("Knightmetal", "C7D6AF");
		val materialFrostbite = funcRegisterMaterial("Frostbite", "1D2C39");

//部品の新規登録

//部品の登録
	//Dust, Small Dust
		val materialDust as Material[] = [
			//materialSilicon,
			materialMangalloy,
			materialStainlessSteel,
			materialToolSteel,
			materialNickelSilver,
		];

		for i in materialDust {
			i.registerPart("dust" as string);
		}

	//Ingot, Molten
		val materialMetal as Material[] = [];
		for i in materialMetal {
			i.registerParts(["ingot", "molten"] as string[]);
		}

	//Ore (Block)
		val materialOreBlock as Material[] = [];
		for i in materialOreBlock {
			i.registerPart("ore" as string);
		}

	//Dust Block
		val materialBlockDust as Material[string] = {
			"cobalt": materialCobalt,
			//"tungstensteel": materialTungstensteel,
			"platinum": materialPlatinum,
			"electrum": materialElectrum,
			"lead": materialLead,
		};

	for i, j in materialBlockDust {
		RussellUtils.addBlockColored("dustblock_" ~ i, <blockmaterial:rock>, 1.5, 15.0, "shovel", 0, <soundtype:stone>, HexHelper.toHexString(j.getColor()));
	}

	//Liquid
		val materialLiquid as Material[] = [
			materialTitaniumTetrachloride,
		];

		for i in materialLiquid {
			var liquid = mods.contenttweaker.VanillaFactory.createFluid(i.getName(), i.getColor());
			liquid.register();
		}

//このscriptの読み込みの完了をログに出力
print("materialRegistry.zs loaded!");
