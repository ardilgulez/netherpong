extends KinematicBody2D

export var ySpeed: float = 15000.0
export var upAction : String = "p1_up"
export var downAction : String = "p1_down"
var movement: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func get_input() -> void:
	if Input.is_action_pressed(upAction):
		movement.y = ySpeed * -1
	elif Input.is_action_pressed(downAction):
		movement.y = ySpeed
	else:
		movement.y = 0.0


func _physics_process(delta: float) -> void:
	get_input()
	movement = move_and_slide(movement * delta)
