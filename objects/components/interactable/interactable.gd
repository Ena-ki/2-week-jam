class_name Interactable
extends Area2D

signal interacted(player: Player)
signal interaction_progress_changed(interaction_progress: float)

@export var interaction_conditions : Array[InteractionCondition]
@export var interaction_effects : Array[InteractionEffect]
@export var interaction_time :float = 2.0
@export var interaction_degradation_speed :float = 2.0

var interaction_progress : float = 0

var _bodies_inside : Array[Player] = []
var _was_interacted_with : bool = false


func interact(player: Player) -> void:
  for effect in interaction_effects:
    effect.apply(self, player)
  interacted.emit(player)
  return
  

func is_empty():
  return _bodies_inside.is_empty()


func _process(delta: float) -> void:
  if !_was_interacted_with && !_bodies_inside.is_empty() && interaction_progress < interaction_time:
    #find closest
    var closest := _bodies_inside[0]
    for body in _bodies_inside:
      if body.position.distance_to(position) < closest.position.distance_to(position):
        closest = body

    for condition in interaction_conditions:
      if !condition.is_met(closest):
        _bodies_inside.erase(closest)
        return
    
    interaction_progress += delta
    interaction_progress_changed.emit(interaction_progress)
    interaction_progress = min(interaction_time, interaction_progress)
    if is_equal_approx(interaction_time, interaction_progress):
      _was_interacted_with = true
      interact(closest)
  elif _was_interacted_with || (_bodies_inside.is_empty() && interaction_progress > 0):
    interaction_progress -= delta * interaction_degradation_speed
    interaction_progress_changed.emit(interaction_progress)
    interaction_progress = max(0, interaction_progress)
    if is_equal_approx(0, interaction_progress):
      _was_interacted_with = false
    


func _ready() -> void:
  body_entered.connect(_on_body_entered)
  body_exited.connect(_on_body_exited)


func _on_body_entered(body: Node2D) -> void:
  if body == owner:
    return
  if body is not Player:
    return
  for condition in interaction_conditions:
    if !condition.is_met(body):
      return
  
  _bodies_inside.append(body)
  

func _on_body_exited(body: Node2D) -> void:
  if body in _bodies_inside:
    _bodies_inside.erase(body)
