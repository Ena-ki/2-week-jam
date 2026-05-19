class_name InteractionEffectAddItem
extends InteractionEffect

@export var items_to_add : Array[PackedScene]


func apply(_interactable: Interactable, _player: Player) -> void:
  for item in items_to_add:
    _player.item_component.add_item_packed(item)
