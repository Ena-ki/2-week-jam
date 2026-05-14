class_name NpcDialogue
extends Resource

@export var _dialogue : Array[String]

var dialogue_index := 0


func get_current_dialogue() -> String:
  return _dialogue[dialogue_index]


func go_to_next_dialogue() -> void:
  dialogue_index += 1
  dialogue_index = clamp(dialogue_index, 0, _dialogue.size())


func go_to_dialogue(index : int) -> void:
  dialogue_index = clamp(index, 0, _dialogue.size())