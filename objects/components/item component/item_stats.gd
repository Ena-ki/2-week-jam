class_name ItemStats
extends Resource


@export var speed : float = 0.0
@export var speed_multiplier : float = 0.0

@export var points : int = 0
@export var point_multiplier : float = 0

@export var attack_speed : float = 0
@export var damage : float = 0


func add_stats(player_stats: PlayerData) -> void:
  player_stats.speed += speed
  player_stats.speed_multiplier += speed_multiplier
  player_stats.points += points
  player_stats.point_multiplier += point_multiplier
  player_stats.attack_speed += attack_speed
  player_stats.damage += damage
  

func remove_stats(player_stats: PlayerData) -> void:
  player_stats.speed -= speed
  player_stats.speed_multiplier -= speed_multiplier
  player_stats.points -= points
  player_stats.point_multiplier -= point_multiplier
  player_stats.attack_speed -= attack_speed
  player_stats.damage -= damage