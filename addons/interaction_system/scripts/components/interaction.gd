class_name Interaction
extends Node

@export_group("Nodes")
@export var raycast: RayCast3D


func interact() -> void:
	var collider: Node = raycast.get_collider()

	if collider == null:
		return

	for child in collider.get_children():
		if child is Interactable:
			child.interact()
			break
