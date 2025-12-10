extends Node2D


enum charecters {
	Dummy,
	New,
}



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
@export var This_Charecter : charecters = charecters.Dummy

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
