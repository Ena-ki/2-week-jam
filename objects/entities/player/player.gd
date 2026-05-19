class_name Player
extends CharacterBody2D

@export var player_data : PlayerData
@export var friction : float = 0.7
@export var item_component : ItemComponent
@export var audio_player : AudioStreamPlayer


func _physics_process(_delta: float) -> void:
  var movement_direction := Vector2.ZERO
  
  movement_direction = Input.get_vector("left", "right", "up", "down")
  
  movement_direction *= player_data.speed

  velocity += movement_direction
  velocity *= friction
  
  move_and_slide()
