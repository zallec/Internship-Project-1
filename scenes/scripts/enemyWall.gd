extends CharacterBody2D

@export var speed: float = 400
var screen_height: float
var ball: Node2D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_height = get_viewport_rect().size.y
	position.x = 939
	position.y = screen_height / 2

func _on_ball_spawned(new_ball: Node) -> void:
	ball = new_ball

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if ball == null or not is_instance_valid(ball):
		return
	if ball.position.y > position.y + 10:
		velocity.y = speed
	elif ball.position.y < position.y - 10:
		velocity.y = -speed
	else:
		velocity.y = 0

	move_and_slide()
	position.y = clamp(position.y, 0, screen_height)
	velocity.x = 0
	
	# if collides with object
	#for area in get_overlapping_bodies():
		#if area.is_in_group("ball"):
		

func start() -> void:
	show()
