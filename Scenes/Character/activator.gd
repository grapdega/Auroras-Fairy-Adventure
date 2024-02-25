extends Node3D

@export var mesh:ArrayMesh

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Mesh").set_mesh(mesh)
	add_to_group("!koy")
	visible = true
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
