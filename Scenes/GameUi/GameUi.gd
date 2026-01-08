extends Control

@onready var music: AudioStreamPlayer = $Music
@onready var level_label: Label = $MarginContainer/VBoxContainer/LevelLabel
@onready var attempts_label: Label = $MarginContainer/VBoxContainer/AttemptsLabel
@onready var vb_game_over: VBoxContainer = $MarginContainer/VBGameOver

var _attempts : int = 0


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("EXIT"):
		get_tree().change_scene_to_file("res://Scenes/Main/Main.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_label.text = "Level %s" % ScoreManager.level_selected

func _enter_tree() -> void:
	SignalHub.on_attempt_made.connect(attempt_made)
	SignalHub.on_cup_destroyed.connect(on_cup_destroyed)

func attempt_made() -> void:
	_attempts += 1
	attempts_label.text = "Attempts %s" % _attempts

func on_cup_destroyed(remaining_cups: int) -> void:
	if remaining_cups == 0:
		vb_game_over.show()
		music.play()
		ScoreManager.set_score_for_level(
			ScoreManager.level_selected,
			_attempts
		)
