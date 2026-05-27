extends Node

# Using a dictionary for difficulty presets
enum DIFFICULTY {EASY, MEDIUM, HARD}
var current_difficulty := DIFFICULTY.MEDIUM


const SETTINGS = {
	DIFFICULTY.EASY: {
		"ball_speed": 			15,
		"ball_speed_multiplier":1.0,
		"player_speed":			600.0,
		"paddle_size_player":	120.0,
		"paddle_size_bot":		50.0,
		"bot_speed":			180.0,
		"bot_react_speed":		50.0,
	},
	DIFFICULTY.MEDIUM: {
		"ball_speed": 			20,
		"ball_speed_multiplier":1.1,
		"player_speed":			400.0,
		"paddle_size_player":	90.0,
		"paddle_size_bot":		60.0,
		"bot_speed":			200.0,
		"bot_react_speed":		20.0,
	},
	DIFFICULTY.HARD: {
		"ball_speed": 			25,
		"ball_speed_multiplier":1.15,
		"player_speed":			400.0,
		"paddle_size_player":	60.0,
		"paddle_size_bot":		60.0,
		"bot_speed":			300.0,
		"bot_react_speed":		15.0,
	},
}

func get_settings(key: String) -> Variant:
	return SETTINGS[current_difficulty][key]
	
func set_difficulty(key: String) -> void:
	if key == "EASY":
		current_difficulty = DIFFICULTY.EASY
	if key == "MEDIUM":
		current_difficulty = DIFFICULTY.MEDIUM
	if key == "HARD":
		current_difficulty = DIFFICULTY.HARD
