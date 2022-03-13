#======================================================================
# name : trophies.zs
# auther : Hiiragi Russell Tsubasa;URL -> https://github.com/Hiiragi283
# info : Entry triphies to JEI
#======================================================================

#priority 0

#crafttweakerからclassをimport
import crafttweaker.data.IData;
import crafttweaker.formatting.IFormattedText;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

#各種modからclassをimport
import mods.zenutils.I18n;

#scriptのimport
import scripts.HiiragiUtils;

#このscriptの読み込みの開始をログに出力
print("Start loading trophies.zs ...");

#変数の定義

val headMinecraft as IItemStack = <minecraft:skull:3>.withTag({SkullOwner: {Id: "fe02ba7c-6fb4-458d-af7d-85a72a7e8163",Properties: {textures: [{Value: "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMzQ5YzYzYmM1MDg3MjMzMjhhMTllNTk3ZjQwODYyZDI3YWQ1YzFkNTQ1NjYzYWMyNDQ2NjU4MmY1NjhkOSJ9fX0="}]}}});

#レシピの編集

#Simple Trophiesのトロフィーを自動的に作成

function addTrophies (name as string, variant as string, color as int[], showTooltip as byte, item as IItemStack) as IItemStack {
    var id as string = item.definition.id;
    var meta as short = item.metadata;
#トロフィーに表示するアイテムがNBTタグを持っている場合
    if (!isNull(item.tag)) {
        var nbtTag as IData = item.tag;
        return <simple_trophies:trophy>
        .withTag({
            TrophyName: name,
            TrophyVariant: variant,
            TrophyColorRed: color[0],
            TrophyColorGreen: color[1],
            TrophyColorBlue: color[2],
            TrophyShowsTooltip: showTooltip,
            TrophyItem: {
                id: id,
                Count: 1 as byte,
                Damage: meta,
                tag:nbtTag
            }
        });
    } else {
#トロフィーに表示するアイテムがNBTタグを持っていない場合
        return <simple_trophies:trophy>
        .withTag({
            TrophyName: name,
            TrophyVariant: variant,
            TrophyColorRed: color[0],
            TrophyColorGreen: color[1],
            TrophyColorBlue: color[2],
            TrophyShowsTooltip: showTooltip,
            TrophyItem: {
                id: id,
                Count: 1 as byte,
                Damage: meta,
            }
        });
    }
}

/*<simple_trophies:trophy>.withTag({TrophyVariant: "classic",
    TrophyColorGreen: 205,
    TrophyShowsTooltip: 1 as byte,
    TrophyItem: {id: "minecraft:diamond_axe",Count: 1 as byte, Damage: 0 as short},
    TrophyColorBlue: 52,
    TrophyName: "Add your own troph
*/

#トロフィーをJEIに登録

mods.jei.JEI.addItem(addTrophies(I18n.format("gohd.item.escape_from_minecroft.name"),"classic",[65, 205, 52],1, headMinecraft));

#このscriptの読み込みの完了をログに出力
print("trophies.zs loaded!");
