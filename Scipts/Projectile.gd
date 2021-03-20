extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var BulletLocaton
var Trajectory = Vector2()
export var speed = 100

# Called when the node enters the scene tree for the first time.
# Sets angle for the bullet to travel then scales it
func _ready():
	BulletLocaton = get_local_mouse_position()
	Trajectory.x = (BulletLocaton.x - $Placeholder.position.x)
	Trajectory.y = (BulletLocaton.y - $Placeholder.position.y)
	Trajectory = Trajectory.normalized()
	SelfDestruct()

# Called every frame. 'delta' is the elapsed time since the previous frame.
# moves projectile
func _process(delta):
	$Sprite.move_local_x(Trajectory.x * speed)
	$Sprite.move_local_y(Trajectory.y * speed)

func SelfDestruct(): # Take a guess as to what this does (not done yet)
	pass

func _on_Area2D_area_entered(area: Area2D): # makes the node kill itself if it hits something
	queue_free()
	pass # Replace with function body.
