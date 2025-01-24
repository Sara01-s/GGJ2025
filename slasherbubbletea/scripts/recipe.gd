extends Node

class_name Recipe

static var recipe: int = 0 # 64 '0' bits.

enum Ingredients {
	NONE			= 0,
	GLASS_BIG 		= 1 << 1,
	GLASS_SMALL 	= 1 << 2,

	TAPIOCA			= 1 << 3,
	GELATIN			= 1 << 4,
	CHERRY			= 1 << 5,
	PASSION_FRUIT	= 1 << 6,

	TEA				= 1 << 7,
	MILK			= 1 << 8,
	ICE				= 1 << 9,
	
	UGLY_LIQUID		= 1 << 10,
}

enum ValidRecipes {
	NONE                          = Ingredients.NONE,
	
	#BIG_GLASS                     = Ingredients.GLASS_BIG,
	#BIG_GLASS_CHERRY              = Ingredients.GLASS_BIG + Ingredients.CHERRY,
	HAPPY_BLOOD                   = Ingredients.GLASS_BIG + Ingredients.CHERRY + Ingredients.MILK,
	
	SMALL_GLASS_PASSION_FRUIT     = Ingredients.GLASS_SMALL + Ingredients.PASSION_FRUIT,
	SMALL_GLASS_PASSION_FRUIT_TEA = Ingredients.GLASS_SMALL + Ingredients.PASSION_FRUIT + Ingredients.TEA,
	MARAQ                         = Ingredients.GLASS_SMALL + Ingredients.PASSION_FRUIT + Ingredients.TEA + Ingredients.ICE,
	
	BIG_GLASS_TAPIOCA             = Ingredients.GLASS_BIG + Ingredients.TAPIOCA,
	BIG_GLASS_TAPIOCA_TEA         = Ingredients.GLASS_BIG + Ingredients.TAPIOCA + Ingredients.TEA,
	ICED_EYES                     = Ingredients.GLASS_BIG + Ingredients.TAPIOCA + Ingredients.TEA + Ingredients.ICE,
	
	BIG_GLASS_GELATIN             = Ingredients.GLASS_BIG + Ingredients.GELATIN,
	BIG_GLASS_GELATIN_MILK        = Ingredients.GLASS_BIG + Ingredients.GELATIN + Ingredients.MILK,
	JELLY_BONES                   = Ingredients.GLASS_BIG + Ingredients.GELATIN + Ingredients.MILK + Ingredients.ICE,
	
	SMALL_GLASS_CHERRY            = Ingredients.GLASS_SMALL + Ingredients.CHERRY,
	SMALL_GLASS_CHERRY_TEA        = Ingredients.GLASS_SMALL + Ingredients.CHERRY + Ingredients.TEA,
	ANGRY_BLOOD                   = Ingredients.GLASS_SMALL + Ingredients.CHERRY + Ingredients.TEA + Ingredients.ICE,
	
	BIG_GLASS_TAPIOCA_MILK        = Ingredients.GLASS_BIG + Ingredients.TAPIOCA + Ingredients.MILK,
	OUIJA                         = Ingredients.GLASS_SMALL + Ingredients.TAPIOCA + Ingredients.MILK,
	
	UGLY_LIQUID                   = Ingredients.UGLY_LIQUID,
}

static func add_ingredients(ingredients: Ingredients):
	recipe |= ingredients

static func remove_ingredients(ingredients: Ingredients):
	recipe &= ~ingredients

static func has_ingredients(ingredients: Ingredients) -> bool:
	return (recipe & ingredients) == ingredients

static func clear_ingredients():
	recipe = 0

func validate_recipe(ingredients: Ingredients) -> bool:
	if (has_ingredients(Ingredients.UGLY_LIQUID)):
		return false
		
	if !ValidRecipes.values().has(ingredients):
		return false
		
	return true
