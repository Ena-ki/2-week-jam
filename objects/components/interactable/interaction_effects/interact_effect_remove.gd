class_name InteractionEffectRemove
extends InteractionEffect


func apply(_player: Player) -> void:
  _player.queue_free()
