# Changelog

## v0.3.3

- Mod Configuration
  - Add
    - `Born In A Barn V1.8-1.12-1.1`
      - Fix village chunk loading issue
    - `Chunk Pregenerator-V1.12-2.5.7`
      - Improve chunk generation
    - `phosphor-forge-mc1.12.2-0.2.7-universal`
      - Improve lighting system
    - `WorldGen-Block-Replacer-2.3.3+1.12.2`
      - Replace blocks in world generation
  - Update
    - `HeatAndProcessing-1.12.2-1.3.7` -> `HeatAndProcessing-1.12.2-1.3.8`
      - Fix the crash bug about Advanced Reactor
    - `SmoothFont-mc1.12.2-2.1.3` -> `SmoothFont-mc1.12.2-2.1.4`

- Disable generating other stone or dirt deposit in non-overworld dimensions
- Disable mob climate damage (for performance improvement)
- Remove `Melter` and `Alloy Tank`
- Replace some blocks in Twilight Forest
- Update Quests

## v0.3.2

- Mod Configuration
  - Add
    - `mekatweaker-1.12-1.2.0`
      - Tweak mekanism gas and infuser type
    - `Requious Frakto-0.12`
      - Useful for making modpack more comfortable
  - Update
    - `appliedenergistics2-rv6-stable-7-extended_life-v0.53.1` -> `appliedenergistics2-rv6-stable-7-extended_life-v0.53.2`
    - `HeatAndClimateLib_1.12.2-3.9.2` -> `HeatAndClimateLib_1.12.2-3.9.3`
    - `HeatAndClimateMod_1.12.2-3.9.7` -> `HeatAndClimateMod_1.12.2-3.9.8`
    - `HeatAndProcessing-1.12.2-1.3.6` -> `HeatAndProcessing-1.12.2-1.3.7`

- Add more materials for Artisan Worktables!
- Edit some recipes
- Fix incorrect translation
- Fix the amount of Manyullyn Ingot for outputs
- Fix the Minecraft Portal
- More useful JEi Tab for Scavenge is added!
  - Scavenge (added Block Output)
- **Radical restructuring of the quest!**
  - Add new quest tab: Heat And Climate
  - Restyled Main Tab
- Update translation system

## v0.3.1

- **HOTFIX**

- Mod Configuration
  - remove
    - `InitialInventory-3.0.0`
      - Replaced with FTB Utilities
  - Update
    - `HeatAndProcessing-1.12.2-1.3.5` -> `HeatAndProcessing-1.12.2-1.3.6`
- Added new debug item
- Added `Quantum Entangler`, allowing you to copy data of compact machines!
- Added tooltip for Green Cube Spell
- Change the appearance of Tool Forge into what you like!
- Changed the effect Rainbow Ingot gives
- Changed the way to give starter item
- When you soaking in some liquids you can receive certain buffs.
- Prevent HaC's INITIAL ore generation overriting dungeons
  - after the second time, this feature DOESN'T work
- **Replaced Blue Gold Ring**
  - The old one allows players to duplicate ANY STACKABLE items
  - New one gives players Freeze Resistance

## v0.3.0

### `Chemistry Madness`

- Mod Configuration
  - Add
    - `UntranslatedItems-1.12.2-1.0.0`
      - English and Japanese translation can be used at the same time
  - Update
    - `appliedenergistics2-rv6-stable-7-extended_life-v0.53.0` -> `appliedenergistics2-rv6-stable-7-extended_life-v0.53.1`
    - `CraftTweaker2-1.12-4.1.20.678` -> `CraftTweaker2-1.12-4.1.20.679`

- Added `resources/gohd/lang/ja_jp.lang`
  - Thanks to [MrKono](https://github.com/MrKono)!
  - and I did other japanese translation
- Added new items and recipes!
- Added new Chisel Groups for ingots
- Changed the base block for obtaining Grains of Infinity
- Changed the rank of some items
- Disabled the recipes for Building Spell (Only looted from Loot Crate)
- Fixed the recipe of Enchanted Ingot / Magical Apple / Magical Wood
- Fixed Orechid Terrestris
- Forced players to use  more Dust Blocks instead of Dusts
- Make the recipe of Tool Steel Sword harder
- Now plants from BOP is exchanged with Mana Infusion!
- Removed unused scripts
- Updated Quests
  - added Chemistry Tab!
  - new custom tool: `Musket of the Gun Devil`

## v0.2.0

### `Magician's Dream`

- Mod Configuration
  - Add
    - `appliedenergistics2-rv6-stable-7-extended_life-v0.53.0`
      - Fork of AE2
    - `lazy-ae2-1.12.2-1.1.26`
      - Addon for AE2 to make it more confortable
  - Remove
    - `appliedenergistics2-rv6-stable-7`
      - replaced with AE2 Unofficial
  - Update
    - `HadEnoughItems_1.12.2-4.22.0` -> `HadEnoughItems_1.12.2-4.23.0`

- Added Magic Quest tab
- Added new items!
- Added new recipes
- Added tooltip for Bedrock
- Botania Update
  - added `Elven Pearl` & `Ephemerald`
  - added new agglomeration recipe for `Terrasteel Ingpt`
  - change the directories for `Dreaming Daisy` & `Orechid Terrestris`
  - tweak recipes for
    - `Dragon Stone`
    - `Elementium Ingot`
    - `Mana Lens`
    - `Orechid Terrestris`
    - `Pixie Dust`
  - fix `Livingwood` purification
  - update credit for license
- Changed the appearance and the recipe of `Workbench Plus`
- Disabled `Soulbound (Cofh Core)` Enchantment
- Disabled `Orechid`
- Moved some scripts in `unification.zs` to `oreDict.zs`
- Removed exchange recipe for `Mythic Ticket` -> `Legendary Ticket`
- Update Quests

## v0.1.2

- Mod Configuration
  - Add
    - `BuildingGadgets-2.8.4`
      - More comfortable to build!
    - `justenoughdimensions-1.12.2-1.6.0-dev.20211009.214847`
      - Alternative way to add new dimensions
    - `modnametooltip_1.12.2-1.10.1`
    - `NotEnoughEnergistics-1.12.2-1.2.4`
      - Better than JEE (Just Enought Energistics)

- Disabled Railcraft's ore generation and plate registry
- Disabled Suffocation Damage
- Fix Nether Portal can't open
- Fix oredict for Rutile Quartz
- Plant Origin trees in Minecraft
- Remove unused resources
- Script Update
  - add a new way to craft Diamond from Coal/Charcoal
  - add a easier way to get Ender Pearl
  - add new color cubes (WIP)
  - change the recipes for end game
  - change the recipe for Locomotives
  - disable randomTick from Dust Blocks
  - fix the amount of Destabilized Redstone needed for TE Parts
  - fix the casting Recipe of Blank Cast
  - make the recipe of Terrestrial Agglomeration Plate harder
  - nerf the recipe for Device Frame
  - registry new oredict
  - resolve recipe conflicts
  - revert the recipe of pail
- Update Quests

## v0.1.1

- **hotfix**
- Mod Configuration
  - Add
    - `HadEnoughItems_1.12.2-4.22.2`
      - Fork of JEI
    - `VanillaFix-1.0.10-150`
      - For FPS improvement
  - Remove
    - `infinityeditor-0.15`
      - This is for the developers so players don't need it
    - `jei_1.12.2-4.16.1.302`
      - Replaced with HadEnoughItems (HEI)
  - Update
    - `HeatAndClimateMod_1.12.2-3.9.6` -> `HeatAndClimateMod_1.12.2-3.9.7`

- Exclude `config/jei/*`
- Remove unrelated credits

## v0.1.0

### `Beginning of The Reminiscence`

### Changes

- The initial release!
