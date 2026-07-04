class_name Interactable
extends Node

signal interacted

const META: String = "InteractableNodePath"


func _ready() -> void:
	var parent: Node = get_parent()

	if parent == null:
		push_error("Interactable component %s is missing a parent" % get_path())
		return

	parent.set_meta(META, get_path())


func interact() -> void:
	interacted.emit()
