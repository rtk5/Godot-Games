extends Area2D


func _physics_process(_delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemies = enemies_in_range.front()
		look_at(target_enemies.global_position)
	if (Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		_on_timer_2_timeout()

func shoot():
	var audio_player = $AudioStreamPlayer2D
	audio_player.play()
	const BULLET = preload("res://2d-project-start-20240216T205452Z-001/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	
	%ShootingPoint.add_child(new_bullet)




func _on_timer_2_timeout():
	shoot()
