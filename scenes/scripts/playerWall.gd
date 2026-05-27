extends CharacterBody2D


var speed: float = 400
var screen_height: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#var screen_size: Vector2 = get_viewport_rect().size
	screen_height = get_viewport_rect().size.y # 648
	position = Vector2(211,screen_height / 2)
	
	speed = GameSettings.get_settings("player_speed")
	
	# size
	var size: Variant = GameSettings.get_settings("paddle_size_player")
	$CollisionShape2D.shape.size.y = size
	$ColorRect.size.y = size
	$ColorRect.position.y = -size / 2.0


func start() -> void:
	show()
	
	
func getVerticalDirection() -> float:
	return Input.get_action_strength("move_down") - Input.get_action_strength("move_up")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	var direction: Vector2 = Vector2(0, getVerticalDirection())
	velocity = direction * speed
	velocity.x = 0
	position.y = clamp(position.y, 0, screen_height)
	move_and_slide()
