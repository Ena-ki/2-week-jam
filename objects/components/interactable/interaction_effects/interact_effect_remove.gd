class_name InteractionEffectRemove
extends InteractionEffect


func apply(interactable: Interactable, _player: Player) -> void:
  interactable.owner.queue_free()
