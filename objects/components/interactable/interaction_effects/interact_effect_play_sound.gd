class_name InteractionEffectPlaySound
extends InteractionEffect


@export var sound : AudioStream

func apply(_interactable: Interactable, _player: Player) -> void:
  var audio_player := AudioStreamPlayer.new()
  audio_player.stream = sound
  audio_player.finished.connect(audio_player.queue_free)
  _player.add_child(audio_player)
  audio_player.play()