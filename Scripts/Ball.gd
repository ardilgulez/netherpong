extends Area2D


export var xSpeedMax : float = 500.0
export var ySpeedMax : float = 850.0
export var ySpeed: float = 0.0

export var PLAYER_ONE = "one"
export var PLAYER_TWO = "two"

signal goal

var xDirection: int = 1

func _physics_process(delta: float) -> void:
	var velocity: Vector2 = Vector2(
		xSpeedMax * xDirection * delta,
		ySpeed * delta
	)
	translate(velocity)


func _on_Ball_body_entered(body: Node) -> void:
	if body.is_class("KinematicBody2D"):
		ySpeed = (position.y - body.position.y) * ySpeedMax / 32
		xDirection = -1 * sign(position.x - 512.0)


func _on_Ball_area_entered(area: Area2D) -> void:
	if position.x <= 32:
		emit_signal("goal", PLAYER_TWO)
		set_process(false)
	elif position.x >= 988:
		emit_signal("goal", PLAYER_ONE)
		set_process(false)
	else:
		ySpeed = ySpeed * -1
