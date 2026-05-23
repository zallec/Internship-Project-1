extends CharacterBody2D

# !!! Needs movement clamped between top and bottom of screen
@export var speed: float = 400 #export allows editing this variable from the inspector
var screen_height: float
var ball: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_height = get_viewport_rect().size.y
	ball = get_parent().get_node("Ball")
	position = Vector2(939,323)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if ball.position.y > position.y + 10:  # Dead zone prevents jittering
		velocity.y = speed
	elif ball.position.y < position.y - 10:
		velocity.y = -speed
	else:
		velocity.y = 0

	move_and_slide()
	position.y = clamp(position.y, 0, screen_height)
	
	# if collides with object
	#for area in get_overlapping_bodies():
		#if area.is_in_group("ball"):
		

func start() -> void:
	show()
