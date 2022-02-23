#priority 1000
#loader gregtech

import mods.gregtech.material.Material;
import mods.gregtech.material.MaterialBuilder;
import mods.gregtech.material.MaterialRegistry;

val grout = MaterialBuilder(32000, "grout")
    .color(0x878b92).iconSet("DULL")
    .dust().flags(["mortar_grindable"])
    .build();
