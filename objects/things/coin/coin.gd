extends Node2D

@export var interactable : Interactable
@export var preview_area : Interactable
@export var sprite : Sprite2D
@export var preview : Label

func _ready() -> void:
  sprite.material = sprite.material.duplicate()
  interactable.interacted.connect(_on_interactable_interacted)
  interactable.interaction_progress_changed.connect(_on_interactable_interaction_progress_changed)
  

func _process(_delta) -> void:
  preview.visible = !preview_area.is_empty()


func _on_interactable_interaction_progress_changed(interaction_progress: float) -> void:
  sprite.material.set_shader_parameter("progress", interaction_progress / interactable.interaction_time)


func _on_interactable_interacted(_player : Player) -> void:
  queue_free()
