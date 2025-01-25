extends Node3D

signal pedidoCorrecto(vidas)
signal pedidoEquivocado(vidas)

var vidas = 3
var vasoChico = false
var vasoGrande = false
@onready var vaso: Sprite3D = $Vaso
@onready var logica_vaso: Recipe = $LogicaVaso
const Matcha = preload("res://Assets/Bobbas/G_Te.png")
const p_vacio = preload("res://Assets/Bobbas/P_Vacio.png")
const g_vacio = preload("res://Assets/Bobbas/G_Vacio.png")
const g_cereza = preload("res://Assets/Bobbas/G_Cereza.png")
const g_leche_cereza = preload("res://Assets/Bobbas/G_Leche_Cereza.png")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var bigCup = Input.is_action_just_pressed("CrearVasoGrande")
	var smallCup = Input.is_action_just_pressed("CrearVasoChico"	)
	var Cherry = Input.is_action_just_pressed("Cherry")
	var Milk = Input.is_action_just_pressed("Milk")
	var Entregar = Input.is_action_just_pressed("EntregarOrden")
	var Resetear = Input.is_action_just_pressed("BorrarVaso")
	
	if bigCup:
		logica_vaso.recipe = 0
		vasoGrande = true
		vasoChico = false
		logica_vaso.add_ingredients(logica_vaso.Ingredients.GLASS_BIG)
		print(logica_vaso.recipe)
		vaso.texture = g_vacio
	if smallCup:
		logica_vaso.recipe = 0
		vasoChico = true
		vasoGrande = false
		logica_vaso.add_ingredients(logica_vaso.Ingredients.GLASS_SMALL)
		vaso.texture = p_vacio
	if Cherry && vasoGrande:
		logica_vaso.add_ingredients(logica_vaso.Ingredients.CHERRY)
		vaso.texture = g_cereza
		print(logica_vaso.recipe)
	if Milk && vasoGrande:
		logica_vaso.add_ingredients((logica_vaso.Ingredients.MILK))
		vaso.texture = g_leche_cereza 
		print(logica_vaso.recipe)
	if Entregar:
		print(logica_vaso.recipe)
		if (logica_vaso.validate_recipe(logica_vaso.recipe)):
			print("Receta valida")
			logica_vaso.recipe = 0
			vaso.texture = null
		else:
			print("Te equivocaste")
			vidas -= 1
			pedidoEquivocado.emit(vidas)
			logica_vaso.recipe = 0
	if Resetear:
		vasoGrande = false
		vasoChico = false
		vaso.texture = null
		logica_vaso.recipe = 0
		print("Receta reiniciada")
		print(logica_vaso.recipe)
	
