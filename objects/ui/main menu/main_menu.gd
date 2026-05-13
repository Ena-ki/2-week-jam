extends Control


@export var startButton : Button
@export var optionsButton : Button
@export var quitButton : Button

@export var base_menu : Control
@export var options_menu : Control

@export var loading_screen : PackedScene
@export_file("*.tscn") var cutscene_scene : String


func _ready() -> void:
  quitButton.pressed.connect(_on_quit_button_pressed)
  startButton.pressed.connect(_on_start_button_pressed)
  optionsButton.pressed.connect(_on_options_button_pressed)


func _on_start_button_pressed():
  var new_loading_screen = loading_screen.instantiate() as LoadingScreen
  add_child(new_loading_screen)

  await new_loading_screen.loading_animation_finished
  get_tree().change_scene_to_file(cutscene_scene)

func _on_options_button_pressed():
  options_menu.show()
  
func _on_quit_button_pressed():
  get_tree().quit()
