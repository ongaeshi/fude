# raylib [models] example - Detect basic 3d collisions (box vs sphere vs box)
require './raylib'
include Raylib

# Initialization
SCREEN_WIDTH = 800;
SCREEN_HEIGHT = 450;

window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [models] example - box collisions") do
  # Define the camera to look into our 3d world
  camera = Camera3D.init(Vector3.init(0.0, 10.0, 10.0), Vector3.init(0.0, 0.0, 0.0), Vector3.init(0.0, 1.0, 0.0), 45.0, 0)

  playerPosition = Vector3.init(0.0, 1.0, 2.0)
  playerSize = Vector3.init(1.0, 2.0, 1.0)
  playerColor = GREEN

  enemyBoxPos = Vector3.init(-4.0, 1.0, 0.0)
  enemyBoxSize = Vector3.init(2.0, 2.0, 2.0)

  enemySpherePos = Vector3.init(4.0, 0.0, 0.0)
  enemySphereSize = 1.5

  collision = false;

  set_target_fps(60);               # Set our game to run at 60 frames-per-second

  # Main game loop
  until window_should_close() do    # Detect window close button or ESC key
    # Update

    # Move player
    if is_key_down(KEY_RIGHT)
      playerPosition.x += 0.2
    elsif is_key_down(KEY_LEFT)
      playerPosition.x -= 0.2
    elsif is_key_down(KEY_DOWN)
      playerPosition.z += 0.2
    elsif is_key_down(KEY_UP)
      playerPosition.z -= 0.2
    end

    collision = false;

    # Check collisions player vs enemy-box
    if check_collision_boxes(
      BoundingBox.init(Vector3.init(playerPosition.x - playerSize.x/2,
                                    playerPosition.y - playerSize.y/2,
                                    playerPosition.z - playerSize.z/2),
                      Vector3.init(playerPosition.x + playerSize.x/2,
                                    playerPosition.y + playerSize.y/2,
                                    playerPosition.z + playerSize.z/2)),
      BoundingBox.init(Vector3.init(enemyBoxPos.x - enemyBoxSize.x/2,
                                    enemyBoxPos.y - enemyBoxSize.y/2,
                                    enemyBoxPos.z - enemyBoxSize.z/2),
                      Vector3.init(enemyBoxPos.x + enemyBoxSize.x/2,
                                    enemyBoxPos.y + enemyBoxSize.y/2,
                                    enemyBoxPos.z + enemyBoxSize.z/2))
                                    )
      collision = true
    end

    # Check collisions player vs enemy-sphere
    if check_collision_box_sphere(
      BoundingBox.init(Vector3.init(playerPosition.x - playerSize.x/2,
                                    playerPosition.y - playerSize.y/2,
                                    playerPosition.z - playerSize.z/2),
                      Vector3.init(playerPosition.x + playerSize.x/2,
                                    playerPosition.y + playerSize.y/2,
                                    playerPosition.z + playerSize.z/2)),
                enemySpherePos, enemySphereSize)
      collision = true
    end

    if (collision)
      playerColor = RED 
    else
      playerColor = GREEN
    end

    # Draw
    draw do 
      clear_background(RAYWHITE);

      mode3d(camera) do
        # Draw enemy-box
        draw_cube(enemyBoxPos, enemyBoxSize.x, enemyBoxSize.y, enemyBoxSize.z, GRAY)
        draw_cube_wires(enemyBoxPos, enemyBoxSize.x, enemyBoxSize.y, enemyBoxSize.z, DARKGRAY)

        # Draw enemy-sphere
        draw_sphere(enemySpherePos, enemySphereSize, GRAY)
        draw_sphere_wires(enemySpherePos, enemySphereSize, 16, 16, DARKGRAY)

        # Draw player
        draw_cube_v(playerPosition, playerSize, playerColor)

        draw_grid(10, 1.0)        # Draw a grid
      end
      
      draw_text("Move player with cursors to collide", 220, 40, 20, GRAY)

      draw_fps(10, 10)
    end
  end
end