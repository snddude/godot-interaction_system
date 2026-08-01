# Interaction System

A very simple interaction system.

## Installation

Download the [latest release](https://github.com/snddude/godot-interaction_system/releases/latest) of this plugin, which comes in a ZIP archive. Extract it into your project's "addons/" folder, then go to Project → Project Settings → Plugins and enable "Interaction System".

## Usage

This plugin comes with 2 components: 
- Interactable.
- Interaction.

The Interactable component should be added to the node that you want to serve as an interactable object in your scene (button, door, lever, etc.). Said node should also have a physics collider (2D or 3D), so it can be detected by raycasts. The Interactable component has an "interacted" signal that you have to connect to the function that you want to run when your interactable object is interacted with.

The Interaction component should be added to your player or other entity, that you want to be able to interact with interactable objects in your scene. You need to assign a raycast node (2D or 3D) to the Interaction component via the inspector, so it can detect interactables in your scene. To cause an interaction to happen you need to call the Interaction component's "interact" function.

> [!Note]
> There is a usage example available in this repository that you can look at. To do so, just clone the repo and open it with Godot.

## License

[MIT](https://en.wikipedia.org/wiki/MIT_License)
