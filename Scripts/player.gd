extends CharacterBody2D

var speed = 500
var current_dir = 'none'
var health = 500.0

signal health_depleted 
func _ready():
	$AnimatedSprite2D.play('idle')

func _physics_process(delta):
	player_movement(delta)
	
	const DAMAGE_RATE = 10
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta 
		%ProgressBar.value = health
		%ProgressBar.max_value = 500
		
		if health <= 0.0:
			health_depleted.emit()

func player_movement(_delta):
	if Input.is_action_pressed("ui_right"):
		current_dir = 'right'
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = 'left'
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_up"):
		current_dir = 'up'
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = 'down'
		play_anim(1)
		velocity.y = speed
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x=0
		velocity.y=0
	move_and_slide()

func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == 'right':
		anim.flip_h = false
		if movement == 1:
			anim.play('walk')
		elif movement==0:
			anim.play('idle')
	elif dir == 'left':
		anim.flip_h = true
		if movement == 1:
			anim.play('walk')
		elif movement==0:
			anim.play('idle')
		
		
