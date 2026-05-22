extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(0,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	position = Vector2(0,0)
	var direction: float = position.angle_to_point(randf_range(PI, -PI))
	var velocity: Vector2 = Vector2(randf_range(150.0, 200.0), 0.0)
	ball.linear_velocity = velocity.rotated(direction)

func _start() -> void:
	pass
