#priority 0

import crafttweaker.item.IItemStack;

import scripts.HiiragiUtils;

val chisel = loadedMods["chisel"];
for i in chisel.items {
    if (!(i.matches(<chisel:auto_chisel>)
        || i.matches(<chisel:chisel_iron>)
        || i.matches(<chisel:chisel_diamond>)
        || i.matches(<chisel:chisel_hitech>)
        || i.matches(<chisel:offsettool>))) {
            HiiragiUtils.hideFromJEI(i);
            HiiragiUtils.removeOreDict(i);
    }
}

val ucw = loadedMods["unlimitedchiselworks"];
for i in ucw.items {
        HiiragiUtils.hideFromJEI(i);
}
