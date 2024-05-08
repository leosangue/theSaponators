extends Node2D



func _on_audio_stream_player_2d_finished():
	get_node("AudioStreamPlayer2D").play()


func _on_play_pressed():
	Game.playerHP=10
	get_tree().change_scene_to_file("res://level_1.tscn")

func _on_play_2_pressed():
	Game.playerHP=10
	get_tree().change_scene_to_file("res://level_2.tscn")
