# raylib [models] example - Drawing billboards
require "./raylib"
include Raylib

# Initialization
screenWidth = 800
screenHeight = 450

window(screenWidth, screenHeight, "raylib [models] example - drawing billboards") do
  # Define the camera to look into our 3d world
  camera = Camera3D.new
  camera.position = Vector3.init(5.0, 4.0, 5.0)
  camera.target = Vector3.init(0.0, 2.0, 0.0)
  camera.up = Vector3.init(0.0, 1.0, 0.0)
  camera.fovy = 45.0
  camera.type = CAMERA_PERSPECTIVE

  bill = load_texture("resources/billboard.png")   # Our texture billboard
  billPosition = Vector3.init(0.0, 2.0, 0.0)       # Position where draw billboard

  set_camera_mode(camera, CAMERA_ORBITAL)   # Set an orbital camera mode

  set_target_fps(60)                        # Set our game to run at 60 frames-per-second

  # Main game loop
  until window_should_close                 # Detect window close button or ESC key
    # Update
    update_camera(camera)                   # Update camera

    # Draw
    draw do
      clear_background(RAYWHITE)

      mode3d(camera) do
        draw_grid(10, 1.0)        # Draw a grid
        draw_billboard(camera, bill, billPosition, 2.0, WHITE)
      end

      draw_fps(10, 10)
    end
end

  # De-Initialization
  unload_texture(bill)        # Unload texture
end