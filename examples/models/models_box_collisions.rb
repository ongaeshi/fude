# raylib [models] example - Detect basic 3d collisions (box vs sphere vs box)
require "../../raylib"
include Raylib

# Initialization
SCREEN_WIDTH = 800;
SCREEN_HEIGHT = 450;

window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [models] example - box collisions") do
  # Define the camera to look into our 3d world
  camera = Camera3D.init(Vector3.init(0.0, 10.0, 10.0), Vector3.init(0.0, 0.0, 0.0), Vector3.init(0.0, 1.0, 0.0), 45.0, 0)

  player_position = Vector3.init(0.0, 1.0, 2.0)
  player_size = Vector3.init(1.0, 2.0, 1.0)
  player_color = GREEN

  enemy_box_pos = Vector3.init(-4.0, 1.0, 0.0)
  enemy_box_size = Vector3.init(2.0, 2.0, 2.0)

  enemy_sphere_pos = Vector3.init(4.0, 0.0, 0.0)
  enemy_sphere_size = 1.5

  collision = false;

  set_target_fps(60);               # Set our game to run at 60 frames-per-second

  # Main game loop
  until window_should_close() do    # Detect window close button or ESC key
    # Update

    # Move player
    if is_key_down(KEY_RIGHT)
      player_position.x += 0.2
    elsif is_key_down(KEY_LEFT)
      player_position.x -= 0.2
    elsif is_key_down(KEY_DOWN)
      player_position.z += 0.2
    elsif is_key_down(KEY_UP)
      player_position.z -= 0.2
    end

    collision = false;

    # Check collisions player vs enemy-box
    if check_collision_boxes(
      BoundingBox.init(Vector3.init(player_position.x - player_size.x/2,
                                    player_position.y - player_size.y/2,
                                    player_position.z - player_size.z/2),
                      Vector3.init(player_position.x + player_size.x/2,
                                    player_position.y + player_size.y/2,
                                    player_position.z + player_size.z/2)),
      BoundingBox.init(Vector3.init(enemy_box_pos.x - enemy_box_size.x/2,
                                    enemy_box_pos.y - enemy_box_size.y/2,
                                    enemy_box_pos.z - enemy_box_size.z/2),
                      Vector3.init(enemy_box_pos.x + enemy_box_size.x/2,
                                    enemy_box_pos.y + enemy_box_size.y/2,
                                    enemy_box_pos.z + enemy_box_size.z/2))
                                    )
      collision = true
    end

    # Check collisions player vs enemy-sphere
    if check_collision_box_sphere(
      BoundingBox.init(Vector3.init(player_position.x - player_size.x/2,
                                    player_position.y - player_size.y/2,
                                    player_position.z - player_size.z/2),
                      Vector3.init(player_position.x + player_size.x/2,
                                    player_position.y + player_size.y/2,
                                    player_position.z + player_size.z/2)),
                enemy_sphere_pos, enemy_sphere_size)
      collision = true
    end

    if (collision)
      player_color = RED 
    else
      player_color = GREEN
    end

    # Draw
    draw do 
      clear_background(RAYWHITE);

      mode3d(camera) do
        # Draw enemy-box
        draw_cube(enemy_box_pos, enemy_box_size.x, enemy_box_size.y, enemy_box_size.z, GRAY)
        draw_cube_wires(enemy_box_pos, enemy_box_size.x, enemy_box_size.y, enemy_box_size.z, DARKGRAY)

        # Draw enemy-sphere
        draw_sphere(enemy_sphere_pos, enemy_sphere_size, GRAY)
        draw_sphere_wires(enemy_sphere_pos, enemy_sphere_size, 16, 16, DARKGRAY)

        # Draw player
        draw_cube_v(player_position, player_size, player_color)

        draw_grid(10, 1.0)        # Draw a grid
      end
      
      draw_text("Move player with cursors to collide", 220, 40, 20, GRAY)

      draw_fps(10, 10)
    end
  end
end