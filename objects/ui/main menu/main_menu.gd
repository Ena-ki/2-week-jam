extends Control


@export var startButton : Button
@export var optionsButton : Button
@export var quitButton : Button

@export var base_menu : Control
@export var options_menu : Control


func _ready() -> void:
  quitButton.pressed.connect(_on_quit_button_pressed)
  startButton.pressed.connect(_on_start_button_pressed)
  optionsButton.pressed.connect(_on_options_button_pressed)


func _on_start_button_pressed():
  pass

func _on_options_button_pressed():
  options_menu.show()
  
func _on_quit_button_pressed():
  get_tree().quit()
