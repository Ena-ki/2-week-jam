extends Control

enum WindowMode{
  FULLSCREEN = 1,
  BORDERLESS_WINDOW,
  WINDOWED,
}

enum VSyncMode{
  DISABLED = 1,
  ADAPTIVE,
  ENABLED,
}

@export var window_mode_button : OptionButton
@export var vsync_mode_button : OptionButton
@export var back_button : Button


func _ready() -> void:
  back_button.pressed.connect(_on_back_button_pressed)
  window_mode_button.item_selected.connect(_on_window_mode_button_item_selected)
  vsync_mode_button.toggled.connect(_on_vsync_mode_button_item_selected)



func _process(_delta: float) -> void:
  if(Input.is_action_just_pressed("ui_cancel")):
    hide()
  
  
func _on_visibility_changed():
  if(is_visible_in_tree()):
    set_process(true)
  else:
    set_process(false)


func _on_back_button_pressed():
  hide()


func _on_vsync_mode_button_item_selected(index: int):
  match index:
    VSyncMode.DISABLED:
      DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
      Log.debug("play")
    VSyncMode.ENABLED:
      DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
    VSyncMode.ADAPTIVE:
      DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ADAPTIVE)


func _on_window_mode_button_item_selected(index: int):
  match index:
    WindowMode.FULLSCREEN:
      DisplayServer.window_set_mode(DisplayServer.WindowMode.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
    WindowMode.BORDERLESS_WINDOW:
      DisplayServer.window_set_mode(DisplayServer.WindowMode.WINDOW_MODE_MAXIMIZED)
      DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
    WindowMode.WINDOWED:
      DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
      DisplayServer.window_set_mode(DisplayServer.WindowMode.WINDOW_MODE_WINDOWED)
