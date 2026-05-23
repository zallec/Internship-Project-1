extends CharacterBody2D

# !!! Needs movement clamped between top and bottom of screen
@export var speed: float = 400 #export allows editing this variable from the inspector
var screen_height: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var screen_size: Vector2 = get_viewport_rect().size
	screen_height = screen_size.y
	print("screen_height: ", screen_height)
	print("position: ", position)
	position = Vector2(211,323)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	move_and_slide()
	position.y = clamp(position.y, 0, screen_height)
	
	# if collides with object
	#for area in get_overlapping_bodies():
		#if area.is_in_group("ball"):
			
		#if area.is_in_group("enemy"):
			

func start() -> void:
	show()
