tool
extends MeshInstance

var surftool = SurfaceTool.new()
var mesh = Mesh.new()

func _enter_tree():
	print("ENTERED")
	surftool.begin(Mesh.PRIMITIVE_TRIANGLES)
	surftool.add_vertex(Vector3(0, 1, 0))
	surftool.add_vertex(Vector3(1, 0, 0))
	surftool.add_vertex(Vector3(0, 0, 0))
	
	
	surftool.add_vertex(Vector3(1, 1, 0))
	surftool.add_vertex(Vector3(1, 0, 0))
	surftool.add_vertex(Vector3(0, 1, 0))
	surftool.commit(mesh)
	set_mesh(mesh)

func _exit_tree():
	print("EXITED")