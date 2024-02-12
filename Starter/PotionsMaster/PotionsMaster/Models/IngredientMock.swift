//
//  IngredientMock.swift
//  PotionsMaster
//
//  Created by Christopher Bell on 11/02/2024.
//


enum IngredientMock {
  static var unicornTailHair: Ingredient {
    let ingredient = Ingredient()
    ingredient.title = "Unicorn Tail Hair"
    ingredient.notes = "Used in Beautification Potion"
    ingredient.bought = false
    ingredient.quantity = 1
    return ingredient
  }

  static var dittany: Ingredient {
    let ingredient = Ingredient()
    ingredient.title = "Dittany"
    ingredient.notes = "Used in healing potions like Wiggenweld"
    ingredient.bought = false
    ingredient.quantity = 1
    return ingredient
  }

  static var mandrake: Ingredient {
    let ingredient = Ingredient()
    ingredient.title = "Mandrake"
    ingredient.notes = "Used in a healing potion called the Mandrake Restorative Draught"
    ingredient.bought = false
    ingredient.quantity = 1
    return ingredient
  }

  static var aconite: Ingredient {
    let ingredient = Ingredient()
    ingredient.title = "Aconite"
    ingredient.notes = "Used in the Wolfsbane Potion"
    ingredient.bought = false
    ingredient.quantity = 1
    return ingredient
  }

  static var unicornBlood: Ingredient {
    let ingredient = Ingredient()
    ingredient.title = "Unicorn blood"
    ingredient.notes = "Used in Rudimentary body potions"
    ingredient.bought = false
    ingredient.quantity = 1
    return ingredient
  }

  static let ingredientsMock = [
    unicornTailHair,
    dittany,
    mandrake,
    aconite,
    unicornBlood
  ]

  static var roseThorn: Ingredient {
    let ingredient = Ingredient()
    ingredient.title = "Rose Thorn"
    ingredient.notes = "Used in Love potions"
    ingredient.bought = true
    ingredient.quantity = 2
    return ingredient
  }

  static var rosePetals: Ingredient {
    let ingredient = Ingredient()
    ingredient.title = "Rose Petals"
    ingredient.notes = "Used in Love potions"
    ingredient.bought = true
    ingredient.quantity = 2
    return ingredient
  }

  static let boughtIngredientsMock = [
    roseThorn,
    rosePetals
  ]
}

