@tool
extends EditorPlugin

const ACTION_NAME: String = "interact"


func _enable_plugin() -> void:
	EditorActionMapper.map_action(ACTION_NAME, EditorActionMapper.INPUT_EVENT_TYPE_KEY, KEY_E)
	EditorNotifier.get_confirmation(
			"The following actions have been added to the input map of your project:\n"
					+ "    - interact: E\nThese actions will not appear in the input"
					+ " map tab until another action is added or the editor is restarted.",
			"Save & Restart",
			"OK",
			EditorInterface.restart_editor.bind(true))


func _disable_plugin() -> void:
	EditorActionMapper.unmap_action(ACTION_NAME)
	EditorNotifier.get_confirmation(
			"The following actions have been removed from the input map of your project:\n"
					+ "    - interact: E\nThese actions will not disappear from the input"
					+ " map tab until another action is added or the editor is restarted.",
			"Save & Restart",
			"OK",
			EditorInterface.restart_editor.bind(true))
