#======================================================================
# ファイル名 : materials.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : 素材の登録
#        このスクリプトの一部はSevtech-Agesを参考にしています
#        https://github.com/DarkPacks/SevTech-Ages
#======================================================================

#loader contenttweaker
#priority 1000

//crafttweakerからclassをimport
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//各種modからclassをimport
import mods.contenttweaker.Color;
import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.Material;
import mods.contenttweaker.PartBuilder;
import mods.contenttweaker.PartType;
import mods.contenttweaker.ResourceLocation;
import mods.contenttweaker.VanillaFactory;
import mods.zenutils.HexHelper;

//このscriptの読み込みの開始をログに出力
print("Start loading materials.zs ...");

//関数の定義
    function funcRegisterMaterial(id as string, color as string) as Material {
        return MaterialSystem.getMaterialBuilder().setName(id).setColor(HexHelper.toDecInteger(color)).build();
    }

    function funcRegisterParts(id as string, partType as string, prefix as string) {
        return mods.contenttweaker.MaterialSystem.getPartBuilder().setName(id).setPartType(MaterialSystem.getPartType(partType)).setOreDictName(prefix).build();
    }

//素材とその色の定義
    //気体元素
        //val materialHydrogen = funcRegisterMaterial("hydrogen", "0000B5");
        val materialHydroFluoricAcid = funcRegisterMaterial("hydrogen_fluoride", "0088AA");
        val materialHydrochloricAcid = funcRegisterMaterial("hydrogen_chloride", "8B9895");
        val materialHydrogenSulfide = funcRegisterMaterial("hydrogen_sulfide", "C94404");
        val materialAmmonia = funcRegisterMaterial("ammonia", "3F3480");
        //val materialDeuterium = funcRegisterMaterial("Deuterium", "");
        //val materialTritium = funcRegisterMaterial("Tritium", "");
        //val materialHelium = funcRegisterMaterial("Helium", "");
        //val materialHelium3 = funcRegisterMaterial("Helium", "");
        //val materialOxygen = funcRegisterMaterial("Oxygen", "4CC3FF");
        //val materialNitrogen = funcRegisterMaterial("Nitrogen", "00BFC1");
        val materialFluorine = funcRegisterMaterial("fluorine", "FF6400");
        val materialChlorine = funcRegisterMaterial("chlorine", "2B7F7F");

    //非金属
        val materialGraphite = funcRegisterMaterial("Graphite", "808080");
        val materialSilicon = funcRegisterMaterial("Silicon", "3C3C50");
        val materialPhosphorus = funcRegisterMaterial("Phosphorus", "FFFF00");
        //val materialPhosphate = funcRegisterMaterial("Phosphate", "FFFF00");
        val materialSulfur = funcRegisterMaterial("Silver", "C8C800");
        val materialGallium = funcRegisterMaterial("Gallium", "434343");
        val materialGalliumArsenide = funcRegisterMaterial("Gallium Arsenide", "A0A0A0"); //GaAs
        val materialArsenic = funcRegisterMaterial("Arsenic", "676756");
        val materialIndium = funcRegisterMaterial("Indium", "400080");
        val materialIndiumGalliumPhosphide = funcRegisterMaterial("Indium Gallium Phosphide", "A08CBE"); //InGaP

    //遷移金属
        val materialAluminum = funcRegisterMaterial("Aluminum", "FDFDFD");
        val materialBauxite = funcRegisterMaterial("Bauxite", "C86400"); //Al2O3 nH2O
        val materialAlumina = funcRegisterMaterial("Alumina", "FDFDFD"); //Al2O3
        val materialTitanium = funcRegisterMaterial("Titanium", "DCA0F0");
        val materialTitaniumTetrachloride = funcRegisterMaterial("Titanium Tetrachloride", "D40D5C"); //TiCl4
        val materialRutile  = funcRegisterMaterial("Rutile", "D40D5C"); //TiO2
        val materialIllumenite = funcRegisterMaterial("Illumenite", "463732"); //FeTiO3
        //val materialChrome = funcRegisterMaterial("Chrome", "EAC4D8");
        val materialChromite = funcRegisterMaterial("Chromite", "3140F"); //FeCr2O4
        val materialIron = funcRegisterMaterial("Iron", "C8C8C8");
        val materialIron3Chloride = funcRegisterMaterial("Iron Chloride (III)", "0088AA"); //FeCl3
        val materialStainlessSteel = funcRegisterMaterial("Stainless Steel", "C8C8DC"); //Fe6Ni2Mn
        val materialSteel = funcRegisterMaterial("Steel", "808080");
        val materialWroughtIron = funcRegisterMaterial("Wrought Iron", "C8B4B4");
        val materialMagnetite = funcRegisterMaterial("Magnetite", "1E1E1E");
        val materialCobalt = funcRegisterMaterial("Cobalt", "5050FA");
        val materialCobaltite = funcRegisterMaterial("Cobaltite", "5050FA"); //CoAsS
        val materialCopper = funcRegisterMaterial("Copper", "FF6400");
        val materialBrass = funcRegisterMaterial("Brass", "FFB400"); //Cu3Zn
        val materialBronze = funcRegisterMaterial("Bronze", "FF8000"); //Cu3Sn
        //val materialZirconium = funcRegisterMaterial("Zirconium", "C8FFFF");
        val materialTin = funcRegisterMaterial("Tin", "DCDCDC");
        val materialHafnium = funcRegisterMaterial("Gold", "99999A");
        val materialTantalum = funcRegisterMaterial("Silver", "78788c");
        val materialTantalumPentoxide = funcRegisterMaterial("Tantalum Pentoxide", "060B0B"); //Ta2O5
        val materialTantalite = funcRegisterMaterial("Tantalite", "915028"); //HfTa2O6
        val materialTungsten = funcRegisterMaterial("Tungsten", "677680");
        val materialTungstenCarbide = funcRegisterMaterial("Tungsten Carbide", "330066"); //WC
        val materialTungstensteel = funcRegisterMaterial("Tungstensteel", "667680"); //WC
        val materialTungstate = funcRegisterMaterial("Tungstate", "373223"); //Li2WO4
        val materialOsmium = funcRegisterMaterial("Osmium", "3232FF");
        val materialGold = funcRegisterMaterial("Gold", "FFE650");
        val materialElectrum = funcRegisterMaterial("Electrum", "FFFF64");
        val materialLead = funcRegisterMaterial("Lead", "6F6B77");
        val materialUraninite = funcRegisterMaterial("Uraninite", "232323"); //UO2

    //アルカリ金属
        val materialSalt = funcRegisterMaterial("Salt", "FAFAFA"); //NaCl
        val materialRockSalt = funcRegisterMaterial("Rock Salt", "F0C8C8"); //KCl

    //アルカリ土類金属
        val materialBeryllium = funcRegisterMaterial("Beryllium", "64B464");
        val materialMagnalium = funcRegisterMaterial("Magnalium", "C8BEFF"); //MgAl8
        val materialMagnesia = funcRegisterMaterial("Magnesia", "887878"); //MgO

    //宝石類
        val materialNetherQuartz = funcRegisterMaterial("Quartz", "E6D2D2");
        val materialCertusQuartz = funcRegisterMaterial("Certus Quartz", "D2D2E6");

    //酸
        val materialNitricAcid = funcRegisterMaterial("nitric_acid", "e7deab"); //HNO3

    //有機物質

    //未分類
        val materialGrout = funcRegisterMaterial("Grout", "878b92");

    //架空素材
        val materialRedstone = funcRegisterMaterial("Redstone", "C80000");
        val materialRedAlloy = funcRegisterMaterial("Redstone Alloy", "C80000");

//部品の新規登録
    val partWire = funcRegisterParts("wire", "item", "wire");
    val partCable = funcRegisterParts("cable", "item", "cable");

//部品の登録
    //Dust, Small Dust
        val materialDust as Material[] = [
            materialGraphite,
            materialGalliumArsenide,
            materialArsenic,
            materialIndium,
            materialIndiumGalliumPhosphide,

            materialAlumina,
            materialTitanium,
            materialRutile,
            materialIllumenite,
            materialChromite,
            materialStainlessSteel,
            materialWroughtIron,
            materialMagnetite,
            materialCobalt,
            materialCobaltite,
            materialHafnium,
            materialTantalum,
            materialTantalumPentoxide,
            materialTantalite,
            materialTungstenCarbide,
            materialTungstate,
            materialOsmium,
            materialUraninite,

            materialSalt,
            materialRockSalt,

            materialBeryllium,
            materialMagnalium,
            materialMagnesia,

            materialNetherQuartz,
            materialCertusQuartz,

            materialRedAlloy,
        ];

        for i in materialDust {
            i.registerParts(["dust", "small_dust"] as string[]);
        }

    //Plate
        val materialPlate as Material[] = [
            materialTitanium,
            materialStainlessSteel,
            materialWroughtIron,
            materialCobalt,
            materialTungstenCarbide,
            materialOsmium,
            materialBeryllium,
            materialNetherQuartz,
            materialCertusQuartz,
            materialRedAlloy,
        ];

        for i in materialPlate {
            i.registerPart("plate");
        }

    //Casing
        val materialCasing as Material[] = [
            materialAluminum,
            materialTitanium,
            materialIron,
            materialStainlessSteel,
            materialSteel,
            materialWroughtIron,
            materialCopper,
            materialBronze,
            materialTin,
            materialTungstensteel,
            materialGold,
            materialLead,
        ];

    for i in materialCasing {
        i.registerPart("casing");
    }

    //gear
        val materialGear as Material[] = [
            materialTitanium,
            materialStainlessSteel,
            materialWroughtIron,
            materialTungstensteel,
        ];

        for i in materialGear {
            var gear = mods.contenttweaker.VanillaFactory.createItem("gear_" ~ i.getName());
            gear.itemColorSupplier = function(item, tintindex) {
                return Color.fromInt(i.getColor());
            };
            gear.textureLocation = ResourceLocation.create("thermalfoundation:items/material/gear_iron");
            gear.register();
        }

    //wire
        val materialWire as Material[] = [
            materialRedAlloy,
        ];

        for i in materialWire {
            var wire = mods.contenttweaker.VanillaFactory.createItem("wire_" ~ i.getName());
            wire.itemColorSupplier = function(item, tintindex) {
                return Color.fromInt(i.getColor());
            };
            wire.textureLocation = ResourceLocation.create("immersiveengineering:items/material_wire_aluminum");
            wire.register();
        }

    //cable
        val materialCable as Material[] = [
            materialAluminum,
            materialSteel,
            materialElectrum,
            materialRedAlloy,
        ];

        for i in materialCable {
            var cable = mods.contenttweaker.VanillaFactory.createItem("cable_" ~ i.getName());
            cable.itemColorSupplier = function(item, tintindex) {
                return Color.fromInt(i.getColor());
            };
            cable.textureLocation = ResourceLocation.create("techreborn:items/cables/hv");
            cable.register();
        }

    //Ingot, Nugget, Block, molten
        val materialMetal as Material[] = [
            materialTitanium,
            materialStainlessSteel,
            materialWroughtIron,
            materialCobalt,
            materialTungstenCarbide,
            materialOsmium,
            materialBeryllium,
            materialMagnalium,
            materialRedAlloy,
        ];

        for i in materialMetal {
            i.registerParts(["ingot", "nugget", "block", "molten"] as string[]);
        }

        materialGrout.registerPart("ingot");

    //Ore (Item)
        val materialOre as Material[] = [
            materialGraphite,
            materialBauxite,
            materialIllumenite,
            materialChromite,
            materialMagnetite,
            materialCobaltite,
            materialTantalite,
            materialTungstate,
            materialUraninite,
            materialSalt,
            materialRockSalt,
            materialMagnesia,
        ];

        for i in materialOre {
            i.registerParts([
                "crushed_ore",
                "purified_ore",
                "centrifuged_ore",
                "ore",
                "ore_sample"
            ] as string[]);
        }

    //Liquid
        val materialLiquid as Material[] = [
            materialHydroFluoricAcid,
            materialHydrochloricAcid,
            materialHydrogenSulfide,
            materialAmmonia,
            materialFluorine,
            materialChlorine,
            materialTitaniumTetrachloride,
            materialNitricAcid,
        ];

        for i in materialLiquid {
            var liquid = mods.contenttweaker.VanillaFactory.createFluid(i.getName(), i.getColor());
            liquid.register();
        }

//このscriptの読み込みの完了をログに出力
print("materials.zs loaded!");
