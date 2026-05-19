class_name ItemComponent
extends Node

var items : Array[Item]
var player : Player


func remove_item(item: Item):
  if item not in items:
    Log.info("the item is not in the list of items ", item)
    return
  items.append(item)
  item.item_stats.remove_stats(player.player_data)


func add_item_packed(item_scene: PackedScene):
  var item = item_scene.instantiate()
  add_child(item)
  if item in items:
    Log.info("the player already has this item ", item)
    return
  items.append(item) 
  item.item_stats.add_stats(player.player_data)


func add_item(item: Item):
  if item in items:
    Log.info("the player already has this item ", item)
    return
  items.append(item) 
  item.item_stats.add_stats(player.player_data)


func _ready() -> void:
  if owner is not Player:
    Log.error("Item component's parent is supposed to be a Player because I don't have time to implement a better solution")
    return
  player = owner
  # bad code, fix this
  var children = get_children()
  for child in children :
    if child is not Item:
      Log.error("Item component's children are supposed to be of type Items")
      continue
    items.append(child)
    child.item_stats.add_stats(player.player_data)
