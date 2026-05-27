extends CanvasLayer

@export var position: Vector2 = Vector2(20, 20)
@onready var label: Label = $Label
var score:int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = "00"
	label.position = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func increaseScore() -> void:
	score += 1
	label.text = "0%d" %score

func resetScore() -> void:
	score = 0
	label.text = "00"
