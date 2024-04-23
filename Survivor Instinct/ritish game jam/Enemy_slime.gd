extends CharacterBody2D
var speed=80
var player_chase=false

#var player = get_tree().get_nodes_in_group("player")
var player = null
#var player = "res://Scene/player.tscn"

var health=7
var player_inattack_zone=false
#func _ready():
#	%AnimatedSprite2D.play_walk()



func _physics_process(delta):
	pass
	#
		
	if player_chase:
		position+=(player.position-position)/speed
		
		$AnimatedSprite2D.play("walk")
		if(player.position.x-position.x)<0:
			$AnimatedSprite2D.flip_h=true
		else:
			$AnimatedSprite2D.flip_h=false
			
		
	else:
		$AnimatedSprite2D.play("Idle")
		

func _on_detection_area_body_entered(body):
	#if player.is_in_group("chicken"):
	if body.is_in_group("player"):
		player=body
		player_chase = true


func _on_detection_area_body_exited(_body):
	player=null
	player_chase=false

func take_damage():
	#Global.combo=0
	health-=1
	if health==0:
		#Global.kill=Global.kill+1
		#Global.combo = Global.combo+1
		queue_free()
	
