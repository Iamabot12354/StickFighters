extends Sprite2D
var playerNum = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("P1-Up"):
		playerNum = 2
	
	if playerNum == 1:
		position.x = -16
		position.y = -16
	elif playerNum == 2:
		position.x = 16
		position.y = -16
	elif playerNum == 3:
		position.x = 16
		position.y = 16
	elif playerNum == 24:
		position.x = -16
		position.y = 16
