#priority 100
#loader contenttweaker

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

