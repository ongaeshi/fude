# raylib [core] example - 2d camera
require "./raylib"
include Raylib

WINDOW_TITLE = "raylib [core] example - 2d camera"
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

MAX_BUILDINGS = 100

window(SCREEN_WIDTH, SCREEN_HEIGHT, WINDOW_TITLE) do
  player = Rectangle.init(400, 280, 40, 40)
  buildings = []
  buildColors = []

  spacing = 0

  0.upto(MAX_BUILDINGS - 1) do |i|
    buildings[i] = Rectangle.new
    buildings[i].width = get_random_value(50, 200)
    buildings[i].height = get_random_value(100, 800)
    buildings[i].y = SCREEN_HEIGHT - 130 - buildings[i].height
    buildings[i].x = -6000 + spacing

    spacing += buildings[i].width

    buildColors[i] = Color.init(get_random_value(200, 240), get_random_value(200, 240), get_random_value(200, 250), 255)
  end

  camera = Camera2D.new
  camera.target = Vector2.init(player.x + 20, player.y + 20)
  camera.offset = Vector2.init(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)
  camera.rotation = 0.0
  camera.zoom = 1.0

  set_target_fps(60)

  until window_should_close()
    # Update
    # Player movement
    if is_key_down(KEY_RIGHT)
      player.x += 2
    elsif is_key_down(KEY_LEFT)
      player.x -= 2
    end

    # Camera target follows player
    camera.target = Vector2.init(player.x + 20, player.y + 20)

    # Camera rotation controls
    if is_key_down(KEY_A)
      camera.rotation -= 1
    elsif is_key_down(KEY_S)
      camera.rotation += 1
    end

    # Limit camera rotation to 80 degrees (-40 to 40)
    if camera.rotation > 40
      camera.rotation = 40
    elsif camera.rotation < -40
      camera.rotation = -40
    end

    # Camera zoom controls
    camera.zoom += get_mouse_wheel_move().to_f * 0.05

    if camera.zoom > 3.0
      camera.zoom = 3.0
    elsif camera.zoom < 0.1
      camera.zoom = 0.1
    end

    # Camera reset (zoom and rotation)
    if is_key_pressed(KEY_R)
      camera.zoom = 1.0
      camera.rotation = 0.0
    end

    # Draw
    draw do
      clear_background(RAYWHITE)

      mode2d(camera) do
        draw_rectangle(-6000, 320, 13000, 8000, DARKGRAY)

        0.upto(MAX_BUILDINGS - 1) do |i|
          draw_rectangle_rec(buildings[i], buildColors[i])
        end

        draw_rectangle_rec(player, RED)

        draw_line(camera.target.x, -SCREEN_HEIGHT * 10, camera.target.x, SCREEN_HEIGHT * 10, GREEN)
        draw_line(-SCREEN_WIDTH * 10, camera.target.y, SCREEN_WIDTH * 10, camera.target.y, GREEN)
      end

      draw_text("SCREEN AREA", 640, 10, 20, RED)

      draw_rectangle(0, 0, SCREEN_WIDTH, 5, RED)
      draw_rectangle(0, 5, 5, SCREEN_HEIGHT - 10, RED)
      draw_rectangle(SCREEN_WIDTH - 5, 5, 5, SCREEN_HEIGHT - 10, RED)
      draw_rectangle(0, SCREEN_HEIGHT - 5, SCREEN_WIDTH, 5, RED)

      draw_rectangle(10, 10, 250, 113, fade(SKYBLUE, 0.5))
      draw_rectangle_lines(10, 10, 250, 113, BLUE)

      draw_text("Free 2d camera controls:", 20, 20, 10, BLACK)
      draw_text("- Right/Left to move Offset", 40, 40, 10, DARKGRAY)
      draw_text("- Mouse Wheel to Zoom in-out", 40, 60, 10, DARKGRAY)
      draw_text("- A / S to Rotate", 40, 80, 10, DARKGRAY)
      draw_text("- R to reset Zoom and Rotation", 40, 100, 10, DARKGRAY)
    end
  end
end
