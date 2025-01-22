extends Node

enum Ingredient {
	GLASS_BIG 		= 1 << 0, 
	GLASS_SMALL 	= 1 << 1,
	
	TAPIOCA			= 1 << 2, 
	GELATIN			= 1 << 3, 
	CHERRY			= 1 << 4, 
	PASSION_FRUIT	= 1 << 5,
	
	TEA				= 1 << 6, 
	MILK			= 1 << 7,
	ICE				= 1 << 8,
}

const HAPPY_BLOOD 	= Ingredient.GLASS_BIG 	 + Ingredient.CHERRY 		+ Ingredient.MILK
const MARAQ 		= Ingredient.GLASS_SMALL + Ingredient.PASSION_FRUIT + Ingredient.TEA 	+ Ingredient.ICE
const ICED_EYES		= Ingredient.GLASS_BIG   + Ingredient.TAPIOCA 		+ Ingredient.TEA 	+ Ingredient.ICE
const JELLY_BONES	= Ingredient.GLASS_BIG   + Ingredient.GELATIN 		+ Ingredient.MILK 	+ Ingredient.ICE
const ANGRY_BLOOD	= Ingredient.GLASS_SMALL + Ingredient.CHERRY 		+ Ingredient.TEA 	+ Ingredient.ICE
const OUIJA			= Ingredient.GLASS_SMALL + Ingredient.TAPIOCA 		+ Ingredient.MILK

var recipe: int = 0 # 64 '0' bits.

func add_ingredient(ingredient: Ingredient):
	recipe |= ingredient
	
func remove_ingredient(ingredient: Ingredient):
	recipe &= ~ingredient
	
func has_ingredient(ingredient: Ingredient) -> bool:
	return (recipe & ingredient) == ingredient
	
func clear():
	recipe = 0
	
