extends KinematicBody2D


# Declare member variables here. Examples:
export var speed = 300
var movement = Vector2()
var trajectory = Vector2()
var BL = Vector2()
var rise1
var run1
var setoff


func get_input ():
	movement = Vector2()
	if Input.is_action_pressed("ui_up"):
		movement.y -= 1
	if Input.is_action_pressed("ui_down"):
		movement.y += 1
	if Input.is_action_pressed("ui_right"):
		movement.x += 1
	if Input.is_action_pressed("ui_left"):
		movement.x -= 1

	if Input.is_action_pressed("ui_accept"):
		BL = get_local_mouse_position()
		trajectory.x = (BL.x - $player.position.x )  /10
		trajectory.y = (BL.y - $player.position.y)/ 10
		
		
		while trajectory.x + trajectory.y > 200:
			trajectory.x = trajectory.x * 0.9
			trajectory.y = trajectory.y * 0.9
		
		$Bullet.move_local_x(trajectory.x)
		$Bullet.move_local_y(trajectory.y)
		print($Weapon.position)
	movement = movement.normalized() * speed

func _physics_process(delta):
	$Weapon.look_at(get_global_mouse_position())
	get_input()
	movement = move_and_slide(movement)
