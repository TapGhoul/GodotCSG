tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("CSGNode", "MeshInstance", preload("csg_node.gd"), preload("csg_node.png"))
	pass

func _exit_tree():
	pass
