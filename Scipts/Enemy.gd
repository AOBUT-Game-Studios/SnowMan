extends Node2D

#Basic Charcteristics
export (int) var maxHealth
onready var health = maxHealth
export (String) var enemyName
var velo = Vector2()
var plPos = Vector2()
var speed = 100

func dialogue(speech):
	#Display text box with parameter
	pass
	
#Here is where generic attack projectiles/paterns will be placed, so that individual enemies can reference them
func _ready():
	
	pass

func _process(delta):
	var Tre = get_parent()
	plPos = Tre.PlayerPos
	velo = position - plPos
	position.x = position.x + (plPos.position.x * speed)
	position.y = position.y + (plPos.position.y * speed)
	pass
