extends Node2D

onready var ball = $Ball
onready var playerOne = $Players/PlayerOne
onready var playerTwo = $Players/PlayerTwo
onready var playerOneScore = $Score/P1Score
onready var playerTwoScore = $Score/P2Score

var p1_score = 0
var p2_score = 0

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Ball_goal(player) -> void:
	ball.position = Vector2(512.0, 320.0)
	ball.ySpeed = 0
	playerOne.position.y = 320.0
	playerTwo.position.y = 320.0
	if player == ball.PLAYER_ONE:
		p1_score += 1
		playerOneScore.text = str(p1_score)
	elif player == ball.PLAYER_TWO:
		p2_score += 1
		playerTwoScore.text = str(p2_score)
