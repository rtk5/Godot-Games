extends Node2D

@onready var spawn_timer = get_node("Timer")
func _physics_process(delta):
	pass

func spawn_mob():
	var new_mob = preload("res://ritish game jam/enemy_slime.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position=%PathFollow2D.global_position
	add_child(new_mob)


	
	


func _on_timer_timeout():
	spawn_mob()


func _on_player_health_depleted():
	%GameOver.visible=true
	get_tree().paused=true
	
