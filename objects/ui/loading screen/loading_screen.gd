class_name LoadingScreen
extends CanvasLayer

signal loading_animation_finished

@export var animation_player : AnimationPlayer 

func _ready() -> void:
  animation_player.animation_finished.connect(_on_animation_player_animation_finished)


func _on_animation_player_animation_finished(_animation_name : String):
  loading_animation_finished.emit()
