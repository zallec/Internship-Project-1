extends CharacterBody2D

@export var SPEED: float = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(576,323)
	var direction: float = randf_range(-PI, PI)
	velocity = Vector2(SPEED, 0.0).rotated(direction)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())

func _start() -> void:
	pass
