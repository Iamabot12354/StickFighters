extends Node2D

var joined = []


enum charecters {
	Dummy,
	Sword,
}

var device_1 = -1
var device_2 = -1
var device_3 = -1
var device_4 = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
@export var This_Charecter : charecters = charecters.Dummy

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
