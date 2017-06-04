tool
extends EditorPlugin

var dock

func _enter_tree():
	dock = preload("Dock.tscn").instance()
	add_custom_type("CSGNode", "MeshInstance", preload("csg_node.gd"), preload("csg_node.png"))
	add_control_to_bottom_panel(dock, "CSG Editor")
	pass

func _exit_tree():
	remove_control_from_bottom_panel(dock)
	pass
