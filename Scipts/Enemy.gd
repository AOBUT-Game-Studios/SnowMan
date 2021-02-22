extends Node2D

#Basic Charcteristics
export (int) var maxHealth
onready var health = maxHealth
export (String) var enemyName

func dialogue(speech):
	#Display text box with parameter
	pass
	
#Here is where generic attack projectiles/paterns will be placed, so that individual enemies can reference them
