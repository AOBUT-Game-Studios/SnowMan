extends KinematicBody2D

#
enum{
	Move,
}

#To properly edit the script, reference the Player prefab for testing

export (int) var speed = 1 #Multiplied by vector, dictates movement speed
var vector = Vector2() #Direction of movement

var AnimationPlayer = null

var State = Move

# references the animation player, animation tree and gets the blend position
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

# Enables the animation tree 
func _ready():
	animationTree.active = true


func _physics_process(delta):
	match State:
		Move:
			MoveState(delta)
	
	vector = move_and_slide(vector)
	
#Gets player input, and adds the correct direction from the origin accordingly
func MoveState(delta):
	
	vector = Vector2()
	if Input.is_action_pressed("North"):
		vector.y -= 1
	if Input.is_action_pressed("South"):
		vector.y += 1
	if Input.is_action_pressed("East"):
		vector.x += 1
	if Input.is_action_pressed("West"):
		vector.x -= 1
	
	if vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", vector)
		animationTree.set("parameters/Walk/blend_position", vector)
		animationTree.set("parameters/Attack/blend_position", vector)
		animationState.travel("Walk")
	else:
		animationState.travel("Idle")
	
	vector = vector.normalized() * speed
	
#Updates game every frame
