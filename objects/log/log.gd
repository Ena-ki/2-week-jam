class_name Log
extends RefCounted

enum LogLevel{
  INFO,
  DEBUG,
  WARNING,
  ERROR
}

static func _log(logLevel : LogLevel, ...args) -> void:
  var prefix_string  := ""
  var stack := get_stack()
  var message := ""

  for arg in args: 
    message += arg[0]

  match logLevel:
    LogLevel.INFO:
      prefix_string = "[b][color=Lightskyblue] [ Info ] [/color][/b]"
    LogLevel.DEBUG:
      prefix_string = "[b][color=Violet] [ Debug ] [/color][/b]"
    LogLevel.WARNING:
      prefix_string = "[b][color=Darkorange] [ Warning ] [/color][/b]"
    LogLevel.ERROR:
      prefix_string = "[b][color=Salmon] [ ERROR ] [/color][/b]"
  
  print_rich(prefix_string, stack[2]["source"]," | ", stack[2]["function"], "()  line:", stack[2]["line"], " : ", message );


static func info(...args) -> void:
  _log(LogLevel.INFO, args)


static func debug(...args) -> void:
  _log(LogLevel.DEBUG, args)


static func warning(...args) -> void:
  _log(LogLevel.WARNING, args)


static func error(...args) -> void:
  _log(LogLevel.ERROR, args)