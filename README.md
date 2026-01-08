# 🐧 Angry Animals - 2D Physics Puzzle Project

This is the third project in my Godot learning journey. This project is a physics-based puzzle game (Sling-shot mechanic) that focuses on RigidBody2D physics, vector mathematics, and advanced UI systems.

## 📝 Learning Outcomes
In this project, I explored the depth of Godot's physics engine:
- **RigidBody2D & Physics:** Mastered the use of `RigidBody2D` for realistic object behavior, applying impulses, and managing sleep states.
- **Vector Mathematics:** Implemented a slingshot mechanic using vector subtraction and normalization to calculate launch force and direction.
- **Input Transformation:** Learned to transform global mouse positions into local coordinates for precise dragging mechanics.
- **Collision Detection:** Used `body_entered` signals to trigger destruction logic and play sound effects based on impact velocity.
- **Advanced UI & Scoring:** Developed a responsive UI system that tracks attempts and targets, utilizing custom signals to refresh the game state.
- **Scene Management:** Implemented level-loading logic to transition between multiple puzzle stages seamlessly.

## 🛠 Tech Stack
- **Engine:** Godot 4.5
- **Language:** GDScript
- **Key Nodes:** `RigidBody2D`, `Line2D` (for trajectory), `VisibleOnScreenNotifier2D`.

## 💻 Technical Snippet: Launch Logic
```gdscript
# Calculating the launch vector based on drag distance
func _on_input_event(_viewport, event, _shape_idx):
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
        if event.pressed:
            _is_dragging = true
        else:
            _is_dragging = false
            launch_animal()

func launch_animal():
    var launch_vector = (_start_pos - global_position) * FORCE_MULTIPLIER
    apply_central_impulse(launch_vector)
    freeze = false
```

## 📚 Credits & Acknowledgments
- **Course:** Developed as part of the ["Jumpstart to 2D Game Development"](https://www.udemy.com/course/jumpstart-to-2d-game-development-godot-4-for-beginners/) course by Richard Allbert and Martyna Olivares.
- **Assets:** Game assets provided by the course instructor.
