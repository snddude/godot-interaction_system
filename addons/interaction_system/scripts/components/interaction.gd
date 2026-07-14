@tool
@icon("res://addons/interaction_system/assets/sprites/icons/interaction.svg")
class_name Interaction
extends Node

@export_group("Nodes")
@export var raycast: RayCast3D:
	set(value):
		raycast = value

		if Engine.is_editor_hint(): 
			update_configuration_warnings()


func _ready() -> void:
	if Engine.is_editor_hint(): 
		update_configuration_warnings()


func _get_configuration_warnings() -> PackedStringArray:
	if raycast == null:
		return ["Interaction component needs a reference to a Raycast3D. Assign one in the inspector"]

	return []


func interact() -> void:
	var collider: Node = raycast.get_collider()

	if collider == null:
		return

	if not collider.has_meta(Interactable.META):
		return

	collider.get_meta(Interactable.META).call()
