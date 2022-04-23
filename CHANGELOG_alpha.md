# Changelog

## For Alpha version

### **v0.0.3a**

* **modの追加**
  * BotanicAdditions-1.12.2-12.2.6
  * CoFHCore-1.12.2-4.6.6.1-universal
  * CoFHWorld-1.12.2-1.4.0.1-universal
  * infinityeditor-0.14.3
  * morechids-1.3.0
  * ThermalFoundation-1.12.2-2.6.7.1-universal

* **configの編集**
  * gregtech.cfg
    * hardToolArmorRecipesをtrueに変更
  * morechids.json
    * 以下の花を新規登録
      * Orechid Terrestris
      * Dreaming Daisy
  * twilightforest.cfg
    * portalCreationItemsをthaumcraft:curio:1に変更
    * portalLightningをtrueに変更
    * rotateTrophyHeadsGuiをfalseに変更
    * glacierPackedIceをtrueに変更
    * parryNonTwilightAttacksをtrueに変更
  * wizardry/fluid_recipes
    * 以下のアイテムのレシピを追加
      * Floral Fertilizer
      * Mana Diamond
      * Mana Pearl
      * Redstone Root

* armor.zs
  * 新規作成
  * 以下のアイテムのレシピを変更
    * Chain Armor
    * Iron Armor
    * Diamond Armor
    * Golden Armor
    * Manasteel Armor
    * Terrasteel Armor
      * 各種レシピで元の防具の性能が引き継がれるようになった

* bop.zs
  * 新規作成

* botania-agglo.zs
  * 新規作成

* botania-flower.zs
  * 新規作成
  * Petal Apothecaryのレシピを削除
  * 機能を持つ花のレシピを変更

* botania.zs -> botania-main.zs
  * 以下のアイテムのレシピを変更
    * Floral Fertilizer
    * Redstone Root
    * Mana Tablet
    * Crafting Patterns
    * Mana Pylon
    * Nature Pylon
    * Band of Mana (クラフト時にマナは引き継がれる)
    * Pure Daisy
    * Manasteel Ingot
    * Block of Manasteel
  * 以下のアイテムをエルフと交易することを取りやめた
    * Dreamwood
    * Elementium
    * Block of Elementium
    * Pixie Dust
    * Dragon Stone
    * Block of Dragon Stone
    * Dreamrock
    * Elven Lapis
    * Block of Elven Lapis
  * 以下のアイテムを新たにエルフと交易することを取り決めた
    * Elven Pearl
    * Ephemerald
  * 以下のアイテムのマナプールレシピを変更
    * Manasteel ingot
    * Block of Manasteel
  * 以下のアイテムのPure Daisyによる変換レシピを変更
    * Livingwood

* cot-item.zs
  * 以下のアイテムを新規登録
    * Elven Pearl
    * Ephemerald

* HiiragiUtils.zs
  * addCraftingArcane()を追加
  * inheritStatus()を追加

* gt-circuit.zs
  * NAND Chipの作成に必要なFine Lead Wireの個数を1 -> 2に変更

* materials.zs
  * 以下の素材を新規登録
    * Manasteel
    * Mana Diamond
    * Terrasteel
    * Elementium

* oredict.zs
  * material.zsで追加した素材を調整

### **v0.0.2a**

* CHANGELOG.mdを作成

* botania.zs
  * 以下のアイテムのレシピを変更
    * Mana Spreader
    * Spreader turntable
    * Open Crate
    * Mana Pool
    * Mana Detector
    * Red Stringed Blocks

* cot-block.zs
  * 以下のブロックを新規登録
    * Livingwood Casing
    * Livingrock Casing

* cot-item.zs
  * 以下のアイテムを新規登録
    * Etched basic Wiring
    * Etched Advanced Wiring
    * Etched Elite Wiring
    * Basic CIrcuit Board
    * Advanced Circuit Board
    * Elite Cirucit Board
    * Livingwood Plate
    * Livingrock Plate

* gregtech.zs -> gt-main.zs
  * アルミニウムの処理ルートを実装
  * シリコンの精製ルートを実装

* HiiragiUtils.zs
  * gregItem()を削除

* materials.zs
  * 以下の素材を実装
    * Cryolite
    * Fluorite
    * Alumina
    * Alumina Solution
    * Silane
    * refined Silicon
  * Alumina Solutionの化学式を変更

* oredict.zs
  * GTCEuの鉱石を新たに分類

### v0.0.1a

* Implement Final Goal
