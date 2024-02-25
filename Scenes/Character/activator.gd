extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("!koy")
	visible = true
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play():
	$ToplamaEffect/GPUParticles3D2.emitting = true
	$Chest2/AnimationPlayer.play("Chest Open")
	


func _on_animation_player_animation_finished(anim_name):
	queue_free()
