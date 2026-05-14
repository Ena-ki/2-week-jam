class_name Interactable
extends Node

signal interacted(node: Node2D)
signal preview_toggled(is_toggled: bool)

var is_interactable : bool = true

func interact(node: Node2D) -> bool:
  if is_interactable:
    interacted.emit(node)
    return true
  return false
  

func toggle_preview() -> void:
  preview_toggled.emit()
