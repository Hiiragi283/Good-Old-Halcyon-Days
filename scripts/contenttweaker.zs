#priority 100
#loader contenttweaker reloadableevents

import mods.contenttweaker.VanillaFactory;

//Register simple items

val items as string[] = [
    "unfired_seared_brick"
];

for i in items {
    var itemRegistry = mods.contenttweaker.VanillaFactory.createItem(i);
    itemRegistry.register();
}

//Register custom items

val flintSaw = mods.contenttweaker.VanillaFactory.createItem("saw_flint");
flintSaw.maxDamage = 16;
flintSaw.maxStackSize = 1;
flintSaw.register();
