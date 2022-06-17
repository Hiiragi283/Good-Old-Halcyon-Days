#======================================================================
# ファイル名 : materialRegistry.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : 素材の登録
#        このスクリプトの一部はSevtech-Agesを参考にしています
#        https://github.com/DarkPacks/SevTech-Ages
#======================================================================

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
	//気体元素
		val materialHydrogenSulfide = funcRegisterMaterial("hydrogen_sulfide", "C94404");
		val materialHalogen = funcRegisterMaterial("halogen", "2B7F7F");

	//非金属
		val materialGraphite = funcRegisterMaterial("Graphite", "808080");
		val materialSilicon = funcRegisterMaterial("Silicon", "3C3C50");
		//val materialPhosphorus = funcRegisterMaterial("Phosphorus", "FFFF00");
		//val materialPhosphate = funcRegisterMaterial("Phosphate", "FFFF00");
		//val materialSulfur = funcRegisterMaterial("Sulfur", "C8C800");
		//val materialGallium = funcRegisterMaterial("Gallium", "434343");
		//val materialGalliumArsenide = funcRegisterMaterial("Gallium Arsenide", "A0A0A0"); //GaAs
		//val materialArsenic = funcRegisterMaterial("Arsenic", "676756");
		//val materialIndium = funcRegisterMaterial("Indium", "400080");
		//val materialIndiumGalliumPhosphide = funcRegisterMaterial("Indium Gallium Phosphide", "A08CBE"); //InGaP

	//遷移金属
		val materialAluminum = funcRegisterMaterial("Aluminum", "E2D1CE");
		//val materialAlumina = funcRegisterMaterial("Alumina", "FDFDFD"); //Al2O3
		val materialTitanium = funcRegisterMaterial("Titanium", "F0F0F0");
		val materialTitaniumAlloy = funcRegisterMaterial("Titanium Alloy", "AE9169");
		val materialTitaniumTetrachloride = funcRegisterMaterial("titanium_tetrachloride", "D40D5C"); //TiCl4
		val materialRutile  = funcRegisterMaterial("Rutile", "FFEE40"); //TiO2
		val materialMangalloy = funcRegisterMaterial("Mangalloy", "BEA0A4");
		val materialIron = funcRegisterMaterial("Iron", "C8C8C8");
		//val materialIron3Chloride = funcRegisterMaterial("Iron Chloride (III)", "0088AA"); //FeCl3
		val materialStainlessSteel = funcRegisterMaterial("Stainless Steel", "D6D6D9"); //Fe6Ni2Mn
		val materialSteel = funcRegisterMaterial("Steel", "808080");
		val materialToolSteel = funcRegisterMaterial("Tool Steel", "919990");
		//val materialMagnetite = funcRegisterMaterial("Magnetite", "1E1E1E");
		val materialCobalt = funcRegisterMaterial("Cobalt", "5050FA");
		//val materialCobaltite = funcRegisterMaterial("Cobaltite", "5050FA"); //CoAsS
		val materialNickelSilver = funcRegisterMaterial("Nickelsilver", "AABFBF"); //CoAsS
		val materialCopper = funcRegisterMaterial("Copper", "FF6400");
		val materialBrass = funcRegisterMaterial("Brass", "FFB400"); //Cu3Zn
		val materialBronze = funcRegisterMaterial("Bronze", "FF8000"); //Cu3Sn
		val materialTin = funcRegisterMaterial("Tin", "DCDCDC");
		val materialTungsten = funcRegisterMaterial("Tungsten", "677680");
		val materialTungstensteel = funcRegisterMaterial("Tungstensteel", "667680"); //WC
		val materialTungstate = funcRegisterMaterial("Tungstate", "373223"); //Li2WO4
		val materialOsmium = funcRegisterMaterial("Osmium", "B4BDD3");
		val materialPlatinum = funcRegisterMaterial("Platinum", "C2D0D8");
		val materialSheldonite = funcRegisterMaterial("Sheldonite", "c0dc89");
		val materialGold = funcRegisterMaterial("Gold", "FFE650");
		val materialElectrum = funcRegisterMaterial("Electrum", "BE9A45");
		val materialCinnabar = funcRegisterMaterial("Cinnabar", "960000"); //HgS
		val materialLead = funcRegisterMaterial("Lead", "605E6A");
		val materialGalena = funcRegisterMaterial("Galena", "643C64"); //AgPb
		val materialUraninite = funcRegisterMaterial("Uraninite", "232323"); //UO2

	//アルカリ金属
		//val materialSalt = funcRegisterMaterial("Salt", "FAFAFA"); //NaCl
		//val materialRockSalt = funcRegisterMaterial("Rock Salt", "F0C8C8"); //KCl

	//アルカリ土類金属
		val materialBeryllium = funcRegisterMaterial("Beryllium", "64B464");
		val materialMagnalium = funcRegisterMaterial("Magnalium", "C8BEFF"); //MgAl8
		val materialMagnesia = funcRegisterMaterial("Magnesia", "887878"); //MgO

	//宝石類
		val materialCertusQuartz = funcRegisterMaterial("Certus Quartz", "D2D2E6");
		val materialNetherQuartz = funcRegisterMaterial("Quartz", "E6D2D2");
		val materialRuby = funcRegisterMaterial("Ruby", "FF6464");
		val materialSapphire = funcRegisterMaterial("Sapphire", "6464C8");

	//酸
		val materialHydrogenHalide = funcRegisterMaterial("hydrogen_halide", "0088AA");

	//有機物質

	//未分類
		val materialGrout = funcRegisterMaterial("Grout", "D0D1D6");

	//架空素材
		val materialRedstone = funcRegisterMaterial("Redstone", "C80000");

		val materialManasteel = funcRegisterMaterial("Manasteel", "0073FF");
		val materialTerrasteel = funcRegisterMaterial("Terrasteel", "A8FD55");
		val materialElementium = funcRegisterMaterial("Elementium", "EF5CD0");

		val materialRedAlloy = funcRegisterMaterial("Redstone Alloy", "C80000");
		val materialDarkSteel = funcRegisterMaterial("Dark Steel", "3A3A3A");
		val materialSoularium = funcRegisterMaterial("Soularium", "8A745C");
		val materialEndSteel = funcRegisterMaterial("End Steel", "D5CF9B");

		//val materialEnergium = funcRegisterMaterial("Energium", "FF6464");

		val materialIronwood = funcRegisterMaterial("Ironwood", "857648");
		val materialFiery = funcRegisterMaterial("Fiery", "391D1E");
		val materialKnightmetal = funcRegisterMaterial("Knightmetal", "C7D6AF");

		val materialFrostbite = funcRegisterMaterial("Frostbite", "1D2C39");

//部品の新規登録

//部品の登録
	//Dust, Small Dust
		val materialDust as Material[] = [
			materialSilicon,
			//materialAlumina,
			//materialTitaniumAlloy,
			materialRutile,
			materialMangalloy,
			materialStainlessSteel,
			materialToolSteel,
			//materialCobalt,
			//materialCobaltite,
			materialNickelSilver,
			materialTungstate,
			materialUraninite,
			//materialRockSalt,
			materialBeryllium,
			//materialMagnalium,
			//materialMagnesia,
			//materialNetherQuartz,
			materialCertusQuartz,
			//materialRedAlloy,
			//materialEnergium,
		];

		for i in materialDust {
			i.registerParts(["dust", "Small_dust"] as string[]);
		}

		//materialLead.registerPart("dust");

	//Ingot, Molten
		val materialMetal as Material[] = [
			materialBeryllium,
			//materialMagnalium,
			materialFrostbite,
		];

		for i in materialMetal {
			i.registerParts(["ingot", "molten"] as string[]);
		}

		materialGrout.registerPart("ingot");

	//Ore (Block)
		val materialOreBlock as Material[] = [
			materialUraninite,
			//materialRockSalt,
			//materialMagnesia,
		];

		for i in materialOreBlock {
			i.registerPart("ore" as string);
		}

	//Dust Block
		val materialBlockDust as Material[string] = {
			"cobalt": materialCobalt,
			"tungstensteel": materialTungstensteel,
			"platinum": materialPlatinum,
			"electrum": materialElectrum,
			"lead": materialLead,
		};

	for i, j in materialBlockDust {
		RussellUtils.addBlockColored("dustblock_" ~ i, <blockmaterial:rock>, 1.5, 15.0, "shovel", 0, <soundtype:stone>, HexHelper.toHexString(j.getColor()));
	}

	//Liquid
		val materialLiquid as Material[] = [
			materialHydrogenSulfide,
			materialTitaniumTetrachloride,
		];

		for i in materialLiquid {
			var liquid = mods.contenttweaker.VanillaFactory.createFluid(i.getName(), i.getColor());
			liquid.register();
		}

//このscriptの読み込みの完了をログに出力
print("materialRegistry.zs loaded!");
