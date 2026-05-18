class_name InteractionConditionPoints
extends InteractionCondition

@export var points_needed : int = 10


func is_met(_player: Player) -> bool:
  if _player.player_data.points >= points_needed:
    return true
  return false
  
