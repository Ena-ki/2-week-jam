extends Node2D


@export var animation_player : AnimationPlayer


func _ready() -> void:
  animation_player.play("cutscene_animation")
  animation_player.animation_finished.connect(_on_animation_player_animation_finished)


func _on_animation_player_animation_finished(_animation_name : String):
  pass
