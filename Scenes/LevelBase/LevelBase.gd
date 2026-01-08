extends Node2D

const ANIMAL = preload("res://Scenes/Animal/Animal.tscn")

@onready var animal_spawn: Marker2D = $AnimalSpawn


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_animal()

func _enter_tree() -> void:
	SignalHub.on_animal_died.connect(spawn_animal)


func spawn_animal() -> void:
	var new_animal: Animal = ANIMAL.instantiate()
	new_animal.position = animal_spawn.position
	add_child(new_animal)
