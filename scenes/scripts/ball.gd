extends CharacterBody2D

var init_speed: float = GameSettings.get_settings("ball_speed")
@export var speed: float = 15
#@export var max_speed: float = 50
@export var ball_delay: float = 2
var direction: Vector2 = Vector2.ZERO
var starting_pos: Vector2 = Vector2(573, 323)
var launch_timer: float = 0

enum ball_state {WAITING, LAUNCH, MOVING}
var cur_state := ball_state.WAITING

signal ball_launch
signal launch_time
signal wall_hit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	starting_pos = global_position
	speed = init_speed
	reset()


func reset() -> void:
	cur_state = ball_state.WAITING
	speed = init_speed
	velocity = Vector2.ZERO
	global_position = starting_pos
	launch_timer = ball_delay
	ball_launch.emit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	match cur_state:
		ball_state.WAITING:
			# counts down using delta instead of timer for live updates
			launch_timer -= delta
			var time: float = 1.0 - (launch_timer / ball_delay)
			emit_signal("launch_time", time)
			if launch_timer <= 0:
				launch()
				
		ball_state.MOVING:
			var collision: KinematicCollision2D = move_and_collide(velocity * speed * delta)
			# handles bounce physics, supposed to increase velocity when bouncing
			if collision:
				# collider signal for camera
				var collider := collision.get_collider()
				if collider.is_in_group("wall"):
					emit_signal("wall_hit")
				
				# adjusted speed
				direction = velocity.bounce(collision.get_normal()).normalized()
				# added velocity after bounce
				speed = speed * GameSettings.get_settings("ball_speed_multiplier")
				velocity = velocity.bounce(collision.get_normal())


func launch() -> void:
	# launch math
	var angle: float = randf_range(-PI/6, PI/6)
	if randi() % 2 == 0:
		angle += PI
	direction = Vector2(cos(angle), sin(angle))
	velocity = direction * speed
	
	# change state to moving
	cur_state = ball_state.MOVING
