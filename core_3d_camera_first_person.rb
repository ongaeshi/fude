# raylib [core] example - 3d camera first person
require './raylib'
include Raylib

MAX_COLUMNS = 20

# Initialization
SCREEN_WIDTH = 800;
SCREEN_HEIGHT = 450;

init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - 3d camera first person");

# Define the camera to look into our 3d world (position, target, up vector)
camera = Camera3D.init(
  Vector3.init(4.0, 2.0, 4.0),
  Vector3.init(0.0, 1.8, 0.0),
  Vector3.init(0.0, 1.0, 0.0),
  60.0,
  CAMERA_PERSPECTIVE
)

# Generates some random columns
heights = []
positions = []
colors = []

(0..MAX_COLUMNS-1).each do |i|
  heights[i] = get_random_value(1, 12).to_f
  positions[i] = Vector3.init(get_random_value(-15, 15), heights[i]/2, get_random_value(-15, 15))
  colors[i] = Color.init(get_random_value(20, 255), get_random_value(10, 55), 30, 255)
end

set_camera_mode(camera, CAMERA_FIRST_PERSON); # Set a first person camera mode

set_target_fps(60);                           # Set our game to run at 60 frames-per-second
#--------------------------------------------------------------------------------------

# Main game loop
until window_should_close do                  # Detect window close button or ESC key
    # Update
    #----------------------------------------------------------------------------------
    update_camera(camera);                  # Update camera
    #----------------------------------------------------------------------------------

    # Draw
    #----------------------------------------------------------------------------------
    begin_drawing();

        clear_background(RAYWHITE);

        begin_mode3d(camera);

            draw_plane(Vector3.init(0.0, 0.0, 0.0), Vector2.init(32.0, 32.0), LIGHTGRAY); # Draw ground
            draw_cube(Vector3.init(-16.0, 2.5, 0.0), 1.0, 5.0, 32.0, BLUE);     # Draw a blue wall
            draw_cube(Vector3.init(16.0, 2.5, 0.0), 1.0, 5.0, 32.0, LIME);      # Draw a green wall
            draw_cube(Vector3.init(0.0, 2.5, 16.0), 32.0, 5.0, 1.0, GOLD);      # Draw a yellow wall

            # Draw some cubes around
            (0..MAX_COLUMNS-1).each do |i|
              draw_cube(positions[i], 2.0, heights[i], 2.0, colors[i]);
              draw_cube_wires(positions[i], 2.0, heights[i], 2.0, MAROON);
            end
            # for (int i = 0; i < MAX_COLUMNS; i++)
            # {
            #     draw_cube(positions[i], 2.0, heights[i], 2.0, colors[i]);
            #     draw_cubeWires(positions[i], 2.0, heights[i], 2.0, MAROON);
            # }

        end_mode3d();

        draw_rectangle( 10, 10, 220, 70, fade(SKYBLUE, 0.5));
        draw_rectangle_lines( 10, 10, 220, 70, BLUE);

        draw_text("First person camera default controls:", 20, 20, 10, BLACK);
        draw_text("- Move with keys: W, A, S, D", 40, 40, 10, DARKGRAY);
        draw_text("- Mouse move to look around", 40, 60, 10, DARKGRAY);

    end_drawing();
    #----------------------------------------------------------------------------------
end

# De-Initialization
close_window()        # Close window and OpenGL context
