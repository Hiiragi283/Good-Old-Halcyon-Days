#======================================================================
# name : materials.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : scripts for registring gregtech material
#======================================================================

#priority 1000
#loader gregtech

//crafttweakerからclassをimport

//各種modからclassをimport
import mods.gregtech.material.Elements;
import mods.gregtech.material.Material;
import mods.gregtech.material.MaterialBuilder;
import mods.gregtech.material.MaterialRegistry;

//scriptのimport

//このscriptの読み込みの開始をログに出力
print("Start loading materials.zs ...");

//変数の定義
    //Aluminum: アルミナム
        val elem_aluminum = Elements.add(13, 13, -1, null, "Aluminum", "An", false);

    //Dilithium: ダイリチウム/ジリチウム
        val elem_dilithium = Elements.add(3, 4, -1, null, "Dilithium", "Dt", false);

    //Thaumic: 魔導
        val elem_thaumic = Elements.add(0, 0, -1, null, "Thaumic", "⬢", false);

    //Mana: マナ
        val elem_mana = Elements.add(0, 0, -1, null, "Mana", "◆", false);

    //Terra: 大地
        val elem_terra = Elements.add(0, 0, -1, null, "Terra", "☗", false);

    //Elemental: 四属性
        val elem_elemental = Elements.add(0, 0, -1, null, "Elemental", "◆+", false);

    //Demonic: 悪魔
        val elem_demonic = Elements.add(0, 0, -1, null, "Demonic", "▲", false);

    //Evil: 邪悪
        val elem_evil = Elements.add(0, 0, -1, null, "Evil", "▼", false);

    //Star: 星
        val elem_star = Elements.add(0, 0, -1, null, "Star", "★", false);

//素材の登録

    //元素: 32000 ~ 32099
        val thaumic = MaterialBuilder(32000, "thaumic").element("Thaumic").build();
        val mana = MaterialBuilder(32001, "mana").element("Mana").build();
        val terra = MaterialBuilder(32002, "terra").element("Terra").build();
        val elemental = MaterialBuilder(32003, "elemental").element("Elemental").build();
        val demonic = MaterialBuilder(32004, "demonic").element("Demonic").build();
        val evil = MaterialBuilder(32005, "evil").element("Evil").build();
        val star = MaterialBuilder(32006, "star").element("Star").build();

    //工業系: 32100 ~ 32199
    //Cryolite: 氷晶石
        val cryolite = MaterialBuilder(32100, "cryolite")
            .gem().ore(1,1)
            .color(0xffffff).iconSet("FINE")
            .addOreByproducts(<material:ice>)
            .flags(["crystallizable"])
            .components([<material:sodium>*3, <material:aluminium>*1, <material:fluorine>*6])
            .build();

    //Fluorite: 蛍石
        val fluorite = MaterialBuilder(32101, "fluorite")
            .gem().ore(2,1)
            .color(0x94c6c1).iconSet("FINE")
            .addOreByproducts(<material:cryolite>)
            .flags(["crystallizable"])
            .components([<material:calcium>*1, <material:fluorine>*2])
            .build();

    //Alumina: アルミナ，酸化アルミニウム
        val alumina = MaterialBuilder(32102, "alumina")
            .dust()
            .color(0xd2d2e6)
            .flags(["disable_decomposition"])
            .components([<material:aluminium>*2, <material:oxygen>*3])
            .build();

    //Alumina Solution: テトラヒドロキシアルミン酸ナトリウム水溶液
        val alumina_solution = MaterialBuilder(32103, "alumina_solution")
            .fluid()
            .color(0xd2d2e6)
            .flags(["disable_decomposition"])
            .components([<material:alumina>*1, <material:water>*3, <material:sodium_hydroxide>*1])
            .build();

    //Silane: シラン
        val silane = MaterialBuilder(32104, "silane")
            .fluid("gas")
            .colorAverage()
            .flags(["disable_decomposition"])
            .components([<material:silicon>*1, <material:hydrogen>*4])
            .build();

    //refined Silicon: 精製シリコン
        val refined_silicon = MaterialBuilder(32105, "silicon_refined")
            .dust().fluid()
            .colorAverage().iconSet("SHINY")
            .fluidTemp(1687)
            .flags(["disable_decomposition"])
            .components([<material:silicon>*1])
            .build();

    //Aluminum: アルミナム
        val aluminum = MaterialBuilder(32106, "aluminum")
            .ingot().fluid().ore()
            .color(0x80c8f0).iconSet("METALLIC")
            .addOreByproducts(<material:aluminium>).fluidTemp(1700)
            .flags(["generate_plate",
                    "generate_foil",
                    "generate_rod",
                    "generate_gear"])
            .element("Aluminum")
            .build();

    //Titanium Aluminide: Ti-An合金
        val titanium_aluminide = MaterialBuilder(32107, "titanium_aluminide")
            .ingot().fluid()
            .color(0xabc1db).iconSet("METALLIC")
            .fluidTemp(1422)
            .flags(["generate_plate",
                    "generate_rod",
                    "generate_gear"])
            .components([<material:aluminum>*7, <material:titanium>*3])
            .build();

    //Titanium Iridium: Ti-Ir合金
        val titanium_iridium = MaterialBuilder(32108, "titanium_iridium")
            .ingot().fluid()
            .color(0xd5dce1).iconSet("METALLIC")
            .fluidTemp(3220)
            .flags(["generate_plate",
                    "generate_rod",
                    "generate_gear"])
            .components([<material:titanium>*1, <material:iridium>*1])
            .build();

    //Dilithium: ダイリチウム
        val dilithium = MaterialBuilder(32109, "dilithium")
            .gem().ore()
            .color(0xdecfcc).iconSet("QUARTZ")
            .addOreByproducts(<material:lithium>)
            .flags(["generate_plate",
                    "generate_lens",
                    "crystallizable"])
            .element("Dilithium")
            .build();

    //魔術系: 32200 ~ 32299
    //Manasteel: マナスチール
        val manasteel = MaterialBuilder(32200, "manasteel")
            .ingot().fluid()
            .color(0x0073ff).iconSet("SHINY")
            .fluidTemp(1200).cableProperties(128, 1, 0)
            .toolStats(1.2, 6.0, 300, 20)
            .flags(["disable_decomposition",
                    "generate_plate",
                    "generate_rod",
                    "generate_gear",
                    "generate_ring"])
            .components([<material:iron>*1, <material:mana>*1])
            .build();
/*
    //Mana Pearl:マナパール
        val mana_pearl = MaterialBuilder(32201, "mana_pearl")
            .dust()
            .color(0x0073ff)
            .cableProperties(128, 1, 0)
            .flags(["disable_decomposition",
                    "generate_plate",
                    "generate_rod",
                    "generate_gear",
                    "generate_ring"])
            .build();

    //Mana Diamond: マナダイヤモンド
        val mana_diamond = MaterialBuilder(32202, "mana_diamond")
            .gem()
            .color(0xb4faff).iconSet("DIAMOND")
            .flags(["disable_decomposition",
                    "generate_plate",
                    "crystallizable"])
            .components([<material:carbon>*1, <material:mana>*1])
            .build();
*/
    //Terrasteel: テラスチール
        val terrasteel = MaterialBuilder(32203, "terrasteel")
            .ingot().fluid()
            .color(0xa8fd55).iconSet("SHINY")
            .fluidTemp(1200).cableProperties(512, 1, 0)
            .toolStats(1.2, 7.0, 2300, 26)
            .flags(["disable_decomposition",
                    "generate_plate",
                    "generate_rod"])
            .components([<material:iron>*1, <material:terra>*1])
            .build();

    //Elementium: エレメンチウム
        val elementium = MaterialBuilder(32204, "elven_elementium")
            .ingot().fluid()
            .color(0xef5cd0).iconSet("SHINY")
            .fluidTemp(1200).cableProperties(8192, 1, 0)
            .toolStats(1.2, 6.0, 720, 20)
            .flags(["disable_decomposition",
                    "generate_plate",
                    "generate_rod",
                    "generate_gear",
                    "generate_ring"])
            .components([<material:iron>*1, <material:elemental>*1])
            .build();

    //Livingwood: リビングウッド
        val livingwood = MaterialBuilder(32205, "livingwood")
            .dust()
            .color(0x481c10).iconSet("WOOD")
            .flags(["disable_decomposition",
                    "mortar_grindable",
                    "generate_plate",
                    "generate_rod",
                    "generate_bolt_screw",
                    "frammable",
                    "generate_frame"])
            .components([<material:mana>*1])
            .build();

    //Livingrock: リビングロック
        val livingrock = MaterialBuilder(32206, "livingrock")
            .dust()
            .color(0xe4e7d6).iconSet("ROUGH")
            .flags(["disable_decomposition",
                    "no_smashing",
                    "no_smelting",
                    "generate_plate"])
            .components([<material:mana>*1])
            .build();

    //Dreamwood: ドリームウッド
        val dreamwood = MaterialBuilder(32207, "dreamwood")
            .dust(0xd3e4e1)
            .color(0xb6c8c4).iconSet("WOOD")
            .flags(["disable_decomposition",
                    "mortar_grindable",
                    "generate_plate",
                    "generate_rod",
                    "generate_bolt_screw",
                    "frammable",
                    "generate_frame"])
            .components([<material:mana>*1])
            .build();

    //Dreamrock: ドリームロック
        val dreamrock = MaterialBuilder(32208, "dreamrock")
            .dust()
            .color(0xccd8e7).iconSet("ROUGH")
            .flags(["disable_decomposition",
                    "no_smashing",
                    "no_smelting",
                    "generate_plate"])
            .components([<material:mana>*1])
            .build();

    //Dark Gem: ダークジェム
        val dark_gem = MaterialBuilder(32209, "dark")
            .gem().ore()
            .color(0x1f1f1f).iconSet("EMERALD")
            .flags(["mortar_grindable",
                    "generate_plate",
                    "generate_rod",
                    "crystallizable"])
            .components([<material:evil>*1])
            .build();

    //Dark Power Gem: ダークパワージェム
        val dark_power_gem = MaterialBuilder(32210, "dark_power")
            .gem()
            .color(0x3e1f1f).iconSet("EMERALD")
            .flags(["mortar_grindable",
                    "generate_plate",
                    "crystallizable"])
            .components([<material:evil>*1])
            .build();

    //Blood-Waxed Coal: 
        val coal_blood = MaterialBuilder(32211, "coal_blood")
            .gem()
            .color(0x3e1f1f).iconSet("LIGNITE")
            .flags(["mortar_grindable"])
            .components([<material:coal>*1, <material:evil>*1])
            .build();

    //Aquamarine: アクアマリン
        val aquamarine = MaterialBuilder(32212, "aquamarine")
            .gem().ore()
            .color(0x0cecf6).iconSet("EMERALD")
            .addOreByproducts(<material:emerald>)
            .flags(["mortar_grindable",
                    "decomposition_by_electrolyzing",
                    "crystallizable"])
            .components([<material:beryllium>*3,
                        <material:aluminium>*2,
                        <material:silicon>*6,
                        <material:oxygen>*18])
            .build();

    //Gaiasteel: 

    //Starmetal: 星鋼
        val starmetal = MaterialBuilder(32213, "astral_starmetal")
            .ingot()
            .color(0x000f78).iconSet("METALLIC")
            .cableProperties(512, 1, 0)
            .flags(["mortar_grindable"])
            .components([<material:iron>*1, <material:star>*1])
            .build();

    //Iridescent Alloy: 七色合金
        val iridescent_alloy = MaterialBuilder(32214, "iridescent")
            .ingot()
            .color(0xe5e4ee).iconSet("METALLIC")
            .cableProperties(8192, 1, 0)
            .flags([])
            .components([<material:astral_starmetal>*1, <material:iridium>*1])
            .build();

    //工魔系: 32300 ~
    //Signalum: シグナルム
        val signalum = MaterialBuilder(32300, "signalum")
            .ingot().fluid()
            .color(0xe13f05).iconSet("SHINY")
            .cableProperties(128, 1, 0)
            .flags(["disable_decomposition",
                    "generate_plate",
                    "generate_rod",
                    "generate_gear"])
            .components([<material:copper>*3, <material:silver>*1, <material:redstone>*4])
            .build();

    //Lumium: ルミウム
        val lumium = MaterialBuilder(32301, "lumium")
            .ingot().fluid()
            .color(0xedf4df).iconSet("SHINY")
            .cableProperties(512, 1, 0)
            .flags(["disable_decomposition",
                    "generate_plate",
                    "generate_rod",
                    "generate_gear"])
            .components([<material:tin>*3, <material:gold>*1, <material:glowstone>*4])
            .build();

    //Enderium: エンダリウム
        val enderium = MaterialBuilder(32302, "enderium")
            .ingot().fluid()
            .color(0x107172).iconSet("DULL")
            .blastTemp(3600, "MID", 1920, 30*20).cableProperties(2048, 1, 0)
            .flags(["disable_decomposition",
                    "generate_plate",
                    "generate_rod",
                    "generate_gear"])
            .components([<material:lead>*3, <material:platinum>*1, <material:ender_pearl>*4])
            .build();

    //Peridot: 

    //Tanzanite: 

    //Amber: 

    //Electrical Steel: 

    //Energetic Gold: 

    //Vibrant Alloy: 

    //Pulsating Iron: 

    //Dark Steel: 

    //Soularium: 

    //End Steel

//登録済みの素材の編集
    //アルミナ溶液の化学式を変更
        MaterialRegistry.get("alumina_solution").setFormula("Na[Al(OH)4]");

    MaterialRegistry.get("gold").addFlags(["generate_gear"]);
    //MaterialRegistry.get("marble").addFlags(["generate_rod"]);

//このscriptの読み込みの完了をログに出力
print("materials.zs loaded!");
