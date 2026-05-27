extends CharacterBody2D

var speed: float = 400
var react: float = 10
var screen_height: float
var ball: Node2D = null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speed = GameSettings.get_settings("bot_speed")
	react = GameSettings.get_settings("bot_react_speed")
	
	# size
	var size: Variant = GameSettings.get_settings("paddle_size_bot")
	$CollisionShape2D.shape.size.y = size
	$ColorRect.size.y = size
	$ColorRect.position.y = -size / 2.0
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if ball == null or not is_instance_valid(ball):
		return
	if ball.position.y > position.y + react:
		velocity.y = speed
	elif ball.position.y < position.y - react:
		velocity.y = -speed
	else:
		velocity.y = 0

	move_and_slide()
	position.y = clamp(position.y, 0, screen_height)
	velocity.x = 0


func start() -> void:
	screen_height = get_viewport_rect().size.y
	position.x = 939
	position.y = screen_height / 2
