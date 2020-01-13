# raylib [core] example - Initialize 3d camera mode
require "../../raylib"
include Raylib

# Initialization
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - 3d camera mode") do
  # Define the camera to look into our 3d world
  camera = Camera3D.new
  camera.position = Vector3.init(0.0, 10.0, 10.0)  # Camera position
  camera.target = Vector3.init(0.0, 0.0, 0.0)      # Camera looking at point
  camera.up = Vector3.init(0.0, 1.0, 0.0)          # Camera up vector (rotation towards target)
  camera.fovy = 45.0;  # Camera field-of-view Y
  camera.type = CAMERA_PERSPECTIVE;  # Camera mode type

  cube_position = Vector3.init(0.0, 0.0, 0.0)

  set_target_fps(60);  # Set our game to run at 60 frames-per-second
  #--------------------------------------------------------------------------------------

  # Main game loop
  until window_should_close # Detect window close button or ESC key
    # Update
    #----------------------------------------------------------------------------------
    # TODO: Update your variables here
    #----------------------------------------------------------------------------------

    # Draw
    #----------------------------------------------------------------------------------
    draw do
      clear_background(RAYWHITE)

      mode3d(camera) do
        draw_cube(cube_position, 2.0, 2.0, 2.0, RED)
        draw_cube_wires(cube_position, 2.0, 2.0, 2.0, MAROON)

        draw_grid(10, 1.0)
      end

      draw_text("Welcome to the third dimension!", 10, 40, 20, DARKGRAY)

      draw_fps(10, 10)
    end
    #----------------------------------------------------------------------------------
  end
end
