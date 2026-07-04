class_name Interactable
extends Node

signal interacted

const META: String = "InteractableNodePath"


func _ready() -> void:
	owner.set_meta(META, get_path())


func interact() -> void:
	interacted.emit()
