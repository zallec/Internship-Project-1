extends Area2D

# !!! add menu screen

func _ready() -> void:
	# hide actual cursor and set in-game cursor
	DisplayServer.cursor_set_shape(DisplayServer.CURSOR_ARROW)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _process(_delta: float) -> void:
	# _delta is used instead of delta because I don't want to change delta, but don't want to declare it either.
	global_position = get_global_mouse_position()


func start() -> void:
	# ADD: start pos in middle using screen_center in main
	show()
	$CollisionShape2D.disabled = false
