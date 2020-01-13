# raylib [core] example - Initialize 3d camera free
require './raylib'
include Raylib

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - 3d camera free") do
  # Define the camera to look into our 3d world
  camera = Camera3D.init(
    Vector3.init(10, 10, 10),  # Camera position
    Vector3.init(0, 0, 0),     # Camera looking at point
    Vector3.init(0, 1, 0),     # Camera up vector (rotation towards target)
    45,                        # Camera field-of-view Y
    CAMERA_PERSPECTIVE,        # Camera mode type
  )

  cube_position = Vector3.init(0, 0, 0)

  set_camera_mode(camera, CAMERA_FREE); # Set a free camera mode

  set_target_fps(60);                   # Set our game to run at 60 frames-per-second

  until window_should_close do
    # Update
    update_camera(camera)                 # Update camera

    camera.target = Vector3.init(0, 0, 0) if is_key_down(KEY_Z)

    # Draw
    draw do
      clear_background(RAYWHITE)
      
      mode3d(camera) do
        draw_cube(cube_position, 2, 2, 2, RED);
        draw_cube_wires(cube_position, 2, 2, 2, MAROON)

        draw_grid(10, 1)
      end

      draw_rectangle(10, 10, 320, 133, fade(SKYBLUE, 0.5))
      draw_rectangle_lines(10, 10, 320, 133, BLUE)

      draw_text("Free camera default controls:", 20, 20, 10, BLACK)
      draw_text("- Mouse Wheel to Zoom in-out", 40, 40, 10, DARKGRAY)
      draw_text("- Mouse Wheel Pressed to Pan", 40, 60, 10, DARKGRAY)
      draw_text("- Alt + Mouse Wheel Pressed to Rotate", 40, 80, 10, DARKGRAY)
      draw_text("- Alt + Ctrl + Mouse Wheel Pressed for Smooth Zoom", 40, 100, 10, DARKGRAY)
      draw_text("- Z to zoom to (0, 0, 0)", 40, 120, 10, DARKGRAY)
    end
  end
end
