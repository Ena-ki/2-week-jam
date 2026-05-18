class_name InteractionEffectPointsAdd
extends InteractionEffect


@export var points : int = -10


func apply(_interactable : Interactable, _player: Player) -> void:
  _player.player_data.points += points
