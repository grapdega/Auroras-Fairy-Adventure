extends Node3D

var is_koy = false
# Called when the node enters the scene tree for the first time.
func _ready():
	disable_group("hidden")
	disable_group("koy")

func disable_group(name):
	for i in get_tree().get_nodes_in_group(name):
		disable(i)
	for i in get_tree().get_nodes_in_group("!"+name):
		enable(i)

func disable(node):
	for c in node.get_children():
		disable(c)
	node.visible = false
	if node is CollisionShape3D:
		node.set_deferred("disabled",true)

func enable(node):
	for c in node.get_children():
		enable(c)
	node.visible = true
	if node is CollisionShape3D:
		node.set_deferred("disabled",false)

func enable_group(name):
	for i in get_tree().get_nodes_in_group(name):
		enable(i)
	for i in get_tree().get_nodes_in_group("!"+name):
		disable(i)

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		for i in get_tree().get_nodes_in_group("koy"):
			i.visible = ! i.visible
		for i in get_tree().get_nodes_in_group("item"):
			i.visible =! i.visible
		is_koy = ! is_koy

