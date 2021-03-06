extends Node2D

#Basic information
export (int) var maxHealth
onready var health = maxHealth

const FiredBullet = preload("res://Scenes/Projectile.tscn")

#Player abilities and interactions will be interfaced here

func _process(delta):
	$RotateAnchor.look_at(get_global_mouse_position())
	if Input.is_action_pressed("LeftClick"):
		var ShotProj = FiredBullet.instance()
		ShotProj.position = $KinematicBody2D.position
		
		ShotProj.rotate($RotateAnchor.rotation)
		ShotProj.rotation_degrees = ShotProj.rotation_degrees + 90
		add_child(ShotProj)
