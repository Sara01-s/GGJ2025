extends Node2D


@onready var timer = get_node("Timer")
@onready var pb = get_node("TextureProgressBar")

func _ready():
	timer.wait_time = pb.value

func _process(delta):
	#print(timer.time_left)
	pb.value = timer.time_left
