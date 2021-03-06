extends Node2D


# Declare member variables here. Examples:
# var a = 2
var crosshairpos = Vector2()
const FiredBullet = preload("res://bulletinstance.tscn")
onready var anim = $KinematicBody2D/Weapon/AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	
#	var ShotProj = FiredBullet.instance()
#	ShotProj.position = $KinematicBody2D.position
#
#	add_child(ShotProj)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	crosshairpos = get_local_mouse_position()
	$Target.position = crosshairpos
	if Input.is_action_pressed("l_click"):
		var ShotProj = FiredBullet.instance()
		ShotProj.position = $KinematicBody2D.position
		ShotProj.rotate($KinematicBody2D/Weapon.rotation)
		ShotProj.z_index = -1
		add_child(ShotProj)
		anim.play("fire")
