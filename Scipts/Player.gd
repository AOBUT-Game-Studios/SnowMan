extends Node2D

#Basic information
export (int) var maxHealth
onready var health = maxHealth
# loads instance scene and colldown for bullets to be shot
const FiredBullet = preload("res://Scenes/Projectile.tscn")
var FireReady = 60

#Player abilities and interactions will be interfaced here
#Instances Projectile and rotates the item at middle towards the mouse as a base
func _process(delta):
	FireReady = FireReady + 1
	$compass.look_at(get_global_mouse_position())
	$compass.position = $KinematicBody2D/Sprite.position
	$KinematicBody2D/RotateAnchor.look_at(get_global_mouse_position())
	if Input.is_action_pressed("LeftClick"):
		if FireReady > 60:
			FireReady = 0
			var ShotProj = FiredBullet.instance()
			ShotProj.position = $KinematicBody2D.position
			
			ShotProj.rotate($KinematicBody2D/RotateAnchor.rotation)
			ShotProj.rotation_degrees = ShotProj.rotation_degrees + 90
			add_child(ShotProj)
