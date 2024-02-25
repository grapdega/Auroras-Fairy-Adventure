extends Node3D

"""
koy gurubuna eklenen objeler koy modunda gozukur item modunda gozukmez
hidden gurubunda olanlar baslangicta gozukmez ve gurubu acilana kadar gozukmez
guruba eklenenler acilana kadar gozukmez
!koy gurubuna eklenenler koy modunda gozukmez
"""
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
		i.add_to_group("koy")
	for i in get_tree().get_nodes_in_group("!"+name):
		disable(i)

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		for i in get_tree().get_nodes_in_group("koy") + \
			get_tree().get_nodes_in_group("!koy"):
			if i.visible:
				disable(i)
			else:
				enable(i)
		is_koy = ! is_koy
