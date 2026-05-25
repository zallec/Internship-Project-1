extends CharacterBody2D

@export var speed: float = 300
@export var max_speed: float = 500
var direction: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision:
		speed = speed + 50
		direction = velocity.bounce(collision.get_normal()).normalized()
		velocity = velocity.bounce(collision.get_normal())
		

func _start() -> void:
	position = Vector2(576,323)
	speed = 300
	var angle: float = randf_range(-PI/4, PI/4)
	if randi() % 2 == 0:
		angle += PI
	direction = Vector2(cos(angle), sin(angle))
	velocity = direction * speed
