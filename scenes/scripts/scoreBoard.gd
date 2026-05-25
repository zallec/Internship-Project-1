extends CanvasLayer

@onready var label: Label = $Label
var score:int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = "Score: 0"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func increaseScore() -> void:
	score += 1
	label.text = "Score: %d" %score

func resetScore() -> void:
	score = 0
	label.text = "Score: 0"
