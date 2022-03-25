#======================================================================
# name : materials.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : scripts for registring gregtech material
#======================================================================

#priority 1000
#loader gregtech

//crafttweakerからclassをimport

//各種modからclassをimport
import mods.gregtech.material.Material;
import mods.gregtech.material.MaterialBuilder;
import mods.gregtech.material.MaterialRegistry;

//scriptのimport

//このscriptの読み込みの開始をログに出力
print("Start loading materials.zs ...");

//変数の定義

//素材の登録
    //Cryolite:氷晶石
        val cryolite = MaterialBuilder(32000, "cryolite")
            .gem().ore(1,1)
            .color(0xffffff).iconSet("FINE")
            .addOreByproducts(<material:ice>)
            .flags(["crystallizable"])
            .components([<material:sodium>*3, <material:aluminium>*1, <material:fluorine>*6])
            .build();
    //Fluorite:蛍石
        val fluorite = MaterialBuilder(32001, "fluorite")
            .gem().ore(2,1)
            .color(0x94c6c1).iconSet("FINE")
            .addOreByproducts(<material:cryolite>)
            .flags(["crystallizable"])
            .components([<material:calcium>*1, <material:fluorine>*2])
            .build();
    //Alumina:アルミナ，酸化アルミニウム
        val alumina = MaterialBuilder(32002, "alumina")
            .dust()
            .color(0xd2d2e6)
            .flags(["disable_decomposition"])
            .components([<material:aluminium>*2, <material:oxygen>*3])
            .build();
    //Alumina Solution:テトラヒドロキシアルミン酸ナトリウム水溶液
        val alumina_solution = MaterialBuilder(32003, "alumina_solution")
            .fluid()
            .color(0xd2d2e6)
            .flags(["disable_decomposition"])
            .components([<material:alumina>*1, <material:water>*3, <material:sodium_hydroxide>*1])
            .build();
    //Silane:シラン
        val silane = MaterialBuilder(32010, "silane")
            .fluid("gas")
            .colorAverage()
            .flags(["disable_decomposition"])
            .components([<material:silicon>*1, <material:hydrogen>*4])
            .build();
    //refined Silicon:精製シリコン，多結晶シリコン
        val refined_silicon = MaterialBuilder(32011, "silicon_refined")
            .dust().fluid()
            .colorAverage().iconSet("SHINY")
            .fluidTemp(1687)
            .flags(["disable_decomposition"])
            .components([<material:silicon>*1])
            .build();

    //Manasteel:マナスチール
        val manasteel = MaterialBuilder(32100, "manasteel")
            .ingot().fluid()
            .color(0x0073ff).iconSet("SHINY")
            .fluidTemp(1200).cableProperties(128, 1, 0)
            .toolStats(1.2, 6.0, 300, 20)
            .flags(["disable_decomposition",
                    "generate_plate",
                    "generate_rod",
                    "generate_gear",
                    "generate_ring"])
            .build();
    /*
    //Mana Pearl:マナパール
        val mana_pearl = MaterialBuilder(32101, "mana_pearl")
            .dust()
            .color(0x0073ff)
            .cableProperties(128, 1, 0)
            .flags(["disable_decomposition",
                    "generate_plate",
                    "generate_rod",
                    "generate_gear",
                    "generate_ring"])
            .build();
    */
    //Mana Diamond:マナダイヤモンド
        val mana_diamodn = MaterialBuilder(32102, "mana_diamond")
            .gem()
            .color(0xb4faff).iconSet("DIAMOND")
            .flags(["disable_decomposition",
                    "generate_plate"])
            .build();
    //Terrasteel:テラスチール
        val terrasteel = MaterialBuilder(32103, "terrasteel")
            .ingot().fluid()
            .color(0xa8fd55).iconSet("SHINY")
            .fluidTemp(1200).cableProperties(512, 1, 0)
            .toolStats(1.2, 7.0, 2300, 26)
            .flags(["disable_decomposition",
                    "generate_plate"])
            .build();
    //Elementium:エレメンチウム
        val elementium = MaterialBuilder(32104, "elven_elementium")
            .ingot().fluid()
            .color(0xef5cd0).iconSet("SHINY")
            .fluidTemp(1200).cableProperties(8192, 1, 0)
            .toolStats(1.2, 6.0, 720, 20)
            .flags(["disable_decomposition",
                    "generate_plate"])
            .build();

//登録済みの素材の編集
    //アルミナ溶液の化学式を変更
        MaterialRegistry.get("alumina_solution").setFormula("Na[Al(OH)4]");

//鉱石辞書の調整

//このscriptの読み込みの完了をログに出力
print("materials.zs loaded!");
