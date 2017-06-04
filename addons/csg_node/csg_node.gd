tool
extends MeshInstance

var surftool = SurfaceTool.new()
var mesh = Mesh.new()
var default_material = FixedMaterial.new()

func _enter_tree():
	default_material.set_parameter(FixedMaterial.PARAM_DIFFUSE, Color(1, 1, 0))
	
	set_mesh(mesh)
	
	create_cube(Vector3(0, 0, 0), Vector3(1, 1, 1))
	default_material = FixedMaterial.new()
	default_material.set_parameter(FixedMaterial.PARAM_DIFFUSE, Color(1, 0, 1))
	create_cube(Vector3(2, 2, 2), Vector3(3, 3, 4))
	
	print(mesh.get_surface_count())

func create_cube(c1, c2):
	# Base positions
	var xyz = Vector3(c1.x, c1.y, c1.z)
	var xyZ = Vector3(c1.x, c1.y, c2.z)
	var xYz = Vector3(c1.x, c2.y, c1.z)
	var xYZ = Vector3(c1.x, c2.y, c2.z)
	var Xyz = Vector3(c2.x, c1.y, c1.z)
	var XyZ = Vector3(c2.x, c1.y, c2.z)
	var XYz = Vector3(c2.x, c2.y, c1.z)
	var XYZ = Vector3(c2.x, c2.y, c2.z)
	
	# Front
	create_quad(xyZ, xYZ, XYZ, XyZ)
	# Left
	create_quad(Xyz, XyZ, XYZ, XYz)
	# Back
	create_quad(xyz, Xyz, XYz, xYz)
	# Right
	create_quad(xyz, xYz, xYZ, xyZ)
	# Top
	create_quad(xYz, XYz, XYZ, xYZ)
	# Bottom
	create_quad(xyz, xyZ, XyZ, Xyz)

func create_quad(v1, v2, v3, v4):
	surftool.begin(Mesh.PRIMITIVE_TRIANGLES)
	surftool.add_vertex(v1)
	surftool.add_vertex(v2)
	surftool.add_vertex(v3)
	
	surftool.add_vertex(v1)
	surftool.add_vertex(v3)
	surftool.add_vertex(v4)
	surftool.generate_normals()
	surftool.set_material(default_material)
	
	surftool.commit(mesh)

func _exit_tree():
	pass