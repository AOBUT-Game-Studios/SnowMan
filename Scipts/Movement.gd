extends KinematicBody2D

#To properly edit the script, reference the Player prefab for testing

export (int) var speed = 1 #Multiplied by vector, dictates movement speed
var vector = Vector2() #Direction of movement

#Gets player input, and adds the correct direction from the origin accordingly
func get_input():
	vector = Vector2()
	if Input.is_action_pressed("North"):
		vector.y -= 1
	if Input.is_action_pressed("South"):
		vector.y += 1
	if Input.is_action_pressed("East"):
		vector.x += 1
	if Input.is_action_pressed("West"):
		vector.x -= 1
	
	vector = vector.normalized() * speed
	
#Updates game every frame
func _physics_process(delta):
	get_input()
	vector = move_and_slide(vector)
