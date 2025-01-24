extends Node3D

@onready var vaso: Sprite3D = $Vaso
@onready var logica_vaso: Recipe = $LogicaVaso

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var VasoGrande = Input.is_action_just_pressed("CrearVasoPequeño")
	var Cherry = Input.is_action_just_pressed("Cherry")
	var Milk = Input.is_action_just_pressed("Milk")
	var Entregar = Input.is_action_just_pressed("EntregarOrden")
	var Resetear = Input.is_action_just_pressed("BorrarVaso")
	
	if VasoGrande:
		logica_vaso.add_ingredients(logica_vaso.Ingredients.GLASS_BIG)
		print(logica_vaso.recipe)
	if Cherry:
		logica_vaso.add_ingredients(logica_vaso.Ingredients.CHERRY)
		print(logica_vaso.recipe)
	if Milk:
		logica_vaso.add_ingredients((logica_vaso.Ingredients.MILK))
		print(logica_vaso.recipe)
	if Entregar:
		print(logica_vaso.recipe)
		if (logica_vaso.validate_recipe(logica_vaso.recipe)):
			print("Receta valida")
			logica_vaso.recipe = 0
		else:
			print("Te equivocaste")
			logica_vaso.recipe = 0
	if Resetear:
		logica_vaso.recipe = 0
		print("Receta reiniciada")
		print(logica_vaso.recipe)
	
