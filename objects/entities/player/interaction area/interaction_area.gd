class_name InteractionArea
extends Area2D


@export var _collision_shape : CollisionShape2D

var _bodies_inside : Array[Node2D]


func change_area_radius(new_radius: float) -> void:
  if _collision_shape.shape != CircleShape2D:
    Log.error("interaction area collision isn't a circle")
    return
  _collision_shape.shape.radius = max(new_radius, 0.0)


func get_closest_interactable() -> Node2D:
  if _bodies_inside.is_empty():
    return null
  var closest = _bodies_inside[0]
  for i: int in range(1, _bodies_inside.size()):
    if(closest.position.distance_to(position) > _bodies_inside[i].position.distance_to(position)):
      closest = _bodies_inside[i]
  return closest


func get_all_interactables() -> Array[Node2D]:
  return _bodies_inside


func interact_with_body(body: Node2D) -> void:
  var body_children = body.get_children()
  for child in body_children:
    if child is Interactable:
      child.interact()


func _ready() -> void:
  body_entered.connect(_on_body_entered)
  body_exited.connect(_on_body_exited)


func _on_body_entered(body: Node2D) -> void:
  var body_children = body.get_children()
  for child in body_children:
    if child is Interactable:
      _bodies_inside.append(body) # can add the parent fix this
      return

  

func _on_body_exited(body: Node2D) -> void:
  _bodies_inside.erase(body)
