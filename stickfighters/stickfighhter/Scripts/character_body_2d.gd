extends CharacterBody2D

var SPEED = 0
const JUMP_VELOCITY = -10
var in_air = true
var stopping = false
var spd_cap = 10
var gravity_spd = 15
var animDir = "r"
var animation = "idle"
@onready var Sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if in_air: #gravity
		gravity_spd += gravity_spd * delta
		velocity.y += gravity_spd * delta
	else:
		gravity_spd = 15

	# Handle jump.
	if (Input.is_action_just_pressed("P1-Jump") or Input.is_key_pressed(KEY_W)) and not in_air: #jumping
		velocity.y = JUMP_VELOCITY
	
	if (Input.is_action_just_pressed("P1-Right") or Input.is_key_pressed(KEY_A)): #moving
		SPEED -=5 * delta
	elif (Input.is_action_just_pressed("P1-Left") or Input.is_key_pressed(KEY_D)):
		SPEED +=5 * delta

	velocity.x = move_toward(velocity.x, spd_cap, SPEED) #handling acceleration
	
	if velocity.x < -1*spd_cap:
		velocity.x = -1*spd_cap
	
	position.x += velocity.x #moving player
	position.y += velocity.y
	
	if not in_air: #handling decceleration
		velocity.x /= 1.25
		SPEED /= 1.25

func _on_area_2d_body_entered(body: Node2D) -> void:
	if stopping:
		stopping = false
	else:
		stopping = true
	position.y -= velocity.y
	velocity.y = 0
	gravity_spd = 15
	in_air = false
	
func _on_area_2d_body_exited(body: Node2D) -> void:
	in_air = true
	if stopping:
		#add condition here to run next two lines until you hit body entered again(while doesnt work)
		position.y += 1
		#in_air = false


func _on_death_zone_body_entered(body: Node2D) -> void:
	position.x = 500 #resseting on death
	position.y = 500
	velocity.x = 0
	velocity.y = 0
	SPEED = 0
	
