extends CharacterBody2D


@export var speed: float = 400
var screen_height: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var screen_size: Vector2 = get_viewport_rect().size
	screen_height = screen_size.y # 648
	position = Vector2(211,screen_height / 2)


func start() -> void:
	show()
	
	
func getVerticalDirection() -> float:
	return Input.get_action_strength("move_down") - Input.get_action_strength("move_up")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var direction: Vector2 = Vector2(0, getVerticalDirection())
	velocity = direction * speed
	position.y = clamp(position.y, 0, screen_height)
	move_and_slide()
