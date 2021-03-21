extends Node2D

# temperature variables
var playerBaseTemp: float
var playerTemp: float
var globalTemp: float

# clothing multiplier, the higher the value, the less it protects against cold
var clothingMultiplier

#Basic information
export (int) var maxHealth
onready var health = maxHealth



#Player abilities and interactions will be interfaced here
func _ready():
	## Assigning Variables
	# Clothing multiplier
	clothingMultiplier = 0.1
		
	# Get global temperature from global temperature node
	globalTemp = get_parent().get_node("Global Temperature").globalTemperature
	
	# player temperature
	playerBaseTemp = 37.0
	playerTemp = playerBaseTemp + (clothingMultiplier * globalTemp)
	prints("player temperature: ", playerTemp)


# shift temperature where localTemp is in C° and duration is in seconds
func shiftTemperature(localTemp: int, duration: float):
	# get global temperature
	globalTemp = get_parent().get_node("Global Temperature").globalTemperature


	# there are 3 temperatures, current temperature, default player temperature without tempOffset, and the set temperature
	var currentTemp = playerTemp
	playerTemp = playerBaseTemp + (clothingMultiplier * globalTemp)
	var setTemp = playerTemp + localTemp
	if(currentTemp != setTemp):
		# create a range to interpolate inbetween
		var tempRange
		if(localTemp <= 0):
			tempRange = range(setTemp, currentTemp + 1)
			tempRange = reverseArray(tempRange)
		else:
			tempRange = range(currentTemp, playerTemp + localTemp + 1)

		playerTemp += localTemp
		
		# interpolate between the current and new temperatures
		interpolateTemperature(tempRange, duration, 0)
	


func interpolateTemperature(tempRange, duration, index: int):
	# calculate the time to wait based on the total duration divided by how many numbers to interpolate by
	var time_in_seconds = duration / float(len(tempRange))
	var i = index
	
	# wait a set amount of time
	yield(get_tree().create_timer(time_in_seconds), "timeout")
	
	# update playe temperature
	playerTemp = tempRange[index]
	prints("temperature = ", playerTemp)

	# recall if out of array bounds
	i += 1
	if(i < len(tempRange)):
		interpolateTemperature(tempRange, duration, i)



# reverse an array because gdscript doesn't have a array.reverse() function
func reverseArray(array):
	var arrayinv = []
	for i in array:
		arrayinv.push_front(i)
	return arrayinv
