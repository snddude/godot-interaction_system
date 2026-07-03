class_name Lamp
extends StaticBody3D

@export_group("Nodes")
@export var light: OmniLight3D
@export var label: Label3D
@export var bulb: MeshInstance3D


func toggle() -> void:
	light.visible = !light.visible
	label.text = "Lamp: ON" if light.visible else "Lamp: OFF"
	bulb.get_active_material(0).emission_enabled = light.visible
