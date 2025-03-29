extends CanvasLayer

signal transition_halfway

var skipping_emit: bool = false


func transition():
	$AnimationPlayer.play("default")
	await transition_halfway
	skipping_emit = true
	$AnimationPlayer.play_backwards("default")


func transition_to_scene(scene_path: String):
	transition()
	await transition_halfway
	get_tree().change_scene_to_file(scene_path)


func emit_transitioned_halfway():
	if skipping_emit:
		skipping_emit = false
		return
		
	transition_halfway.emit()
