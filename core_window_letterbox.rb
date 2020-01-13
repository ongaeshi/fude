# raylib [core] example - window scale letterbox
require "../../raylib"
include Raylib

def max(a, b)
  a > b ? a : b
end

def min(a, b)
  a < b ? a : b
end

WINDOW_WIDTH = 800
WINDOW_HEIGHT = 450

# Enable config flags for resizable window and vertical synchro
set_config_flags(FLAG_WINDOW_RESIZABLE | FLAG_VSYNC_HINT)

window(WINDOW_WIDTH, WINDOW_HEIGHT, "raylib [core] example - window scale letterbox") do
  set_window_min_size(320, 240)

  GAME_SCREEN_WIDTH = 640
  GAME_SCREEN_HEIGHT = 480

  # Render texture initialization, used to hold the rendering result so we can easily resize it
  target = load_render_texture(GAME_SCREEN_WIDTH, GAME_SCREEN_HEIGHT)
  set_texture_filter(target.texture, FILTER_BILINEAR) # Texture scale filter to use

  colors = (0...10).map { |e| Color.init(get_random_value(100, 250), get_random_value(50, 150), get_random_value(10, 100), 255) }

  set_target_fps(60)   # Set our game to run at 60 frames-per-second

  # Main game loop
  until window_should_close # Detect window close button or ESC key
    # Update
    # Compute required framebuffer scaling
    scale = min(get_screen_width() / GAME_SCREEN_WIDTH, get_screen_height() / GAME_SCREEN_HEIGHT)

    if is_key_pressed(KEY_SPACE)
      # Recalculate random colors for the bars
      colors = (0...10).map { |e| Color.init(get_random_value(100, 250), get_random_value(50, 150), get_random_value(10, 100), 255) }
    end

    # Draw
    draw do
      clear_background(BLACK)

      # Draw everything in the render texture, note this will not be rendered on screen, yet
      texture_mode(target) do
        clear_background(RAYWHITE)   # Clear render texture background color

        0.upto(9) { |i| draw_rectangle(0, (GAME_SCREEN_HEIGHT / 10) * i, GAME_SCREEN_WIDTH, GAME_SCREEN_HEIGHT / 10, colors[i]) }

        draw_text("If executed inside a window,\nyou can resize the window,\nand see the screen scaling!", 10, 25, 20, WHITE)
      end

      # Draw RenderTexture2D to window, properly scaled
      draw_texture_pro(
        target.texture,
        Rectangle.init(
          0.0,
          0.0,
          target.texture.width,
          -target.texture.height
        ),
        Rectangle.init(
          (get_screen_width() - GAME_SCREEN_WIDTH * scale) * 0.5,
          (get_screen_height() - GAME_SCREEN_HEIGHT * scale) * 0.5,
          GAME_SCREEN_WIDTH * scale,
          GAME_SCREEN_HEIGHT * scale
        ),
        Vector2.init(0, 0),
        0.0,
        WHITE
      )
    end
  end

  # De-Initialization
  unload_render_texture(target)   # Unload render texture
end
