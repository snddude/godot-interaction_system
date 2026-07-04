class_name Interaction
extends Node

@export_group("Nodes")
@export var raycast: RayCast3D


func interact() -> void:
	var collider: Node = raycast.get_collider()

	if collider == null:
		return

	if not collider.has_meta(Interactable.META):
		return

	var meta: NodePath = collider.get_meta(Interactable.META)
	var interactable: Interactable = get_node_or_null(meta)

	if interactable == null:
		push_error("%s missing Interactable component" % collider.get_path())
		return

	interactable.interact()
