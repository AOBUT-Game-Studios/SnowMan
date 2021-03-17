extends Node2D

#Basic information
export (int) var maxHealth
onready var health = maxHealth

#Player abilities and interactions will be interfaced here
func ready(delta):
  prints("starting session")

# func _process(delta):
