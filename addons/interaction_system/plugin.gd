@tool
extends EditorPlugin


func _enable_plugin() -> void:
	var event_key := InputEventKey.new()
	event_key.physical_keycode = KEY_E

	var input: Dictionary = {
		"deadzone": 0.2,
		"events": [event_key],
	}

	ProjectSettings.set_setting("input/interact", input)
	ProjectSettings.save()

	EditorNotifier.get_confirmation(
			"The following actions have been added to the input map of your project:\n"
					+ "- interact: E\n\nThese actions will not appear in the input map "
					+ "tab until another action is added or the editor is restarted.",
			"Save & Restart", 
			"OK", 
			EditorInterface.restart_editor.bind(true))


func _disable_plugin() -> void:
	ProjectSettings.set_setting("input/interact", null)
	ProjectSettings.save()

	EditorNotifier.get_confirmation(
			"The following actions have been removed from the input map of your project:\n"
					+ "- interact: E\n\nThese actions will not disappear from the input map "
					+ "tab until another action is added or the editor is restarted.",
			"Save & Restart", 
			"OK", 
			EditorInterface.restart_editor.bind(true))
