# raylib [core] example - window scale letterbox
require "./raylib"
include Raylib

def max(a, b)
  a > b ? a : b
end

def min(a, b)
  a < b ? a : b
end

windowWidth = 800
windowHeight = 450

# Enable config flags for resizable window and vertical synchro
# SetConfigFlags(FLAG_WINDOW_RESIZABLE | FLAG_VSYNC_HINT);
set_config_flags(4 | 64)
init_window(windowWidth, windowHeight, "raylib [core] example - window scale letterbox")
set_window_min_size(320, 240)

gameScreenWidth = 640
gameScreenHeight = 480

# Render texture initialization, used to hold the rendering result so we can easily resize it
target = load_render_texture(gameScreenWidth, gameScreenHeight)
set_texture_filter(target.texture, 1); # FILTER_BILINEAR = 1 # Texture scale filter to use

colors = []
1.upto(10) { |e| colors.push(Color.init(get_random_value(100, 250), get_random_value(50, 150), get_random_value(10, 100), 255)) }

set_target_fps(60);  # Set our game to run at 60 frames-per-second
#--------------------------------------------------------------------------------------

# Main game loop
while (!window_should_close()) # Detect window close button or ESC key
  # Update
  #----------------------------------------------------------------------------------
  # Compute required framebuffer scaling
  scale = min(get_screen_width() / gameScreenWidth, get_screen_height() / gameScreenHeight)

  if is_key_pressed(KEY_SPACE)
    # Recalculate random colors for the bars
    colors = []
    1.upto(10) { |e| colors.push(Color.init(get_random_value(100, 250), get_random_value(50, 150), get_random_value(10, 100), 255)) }
  end
  #----------------------------------------------------------------------------------

  # Draw
  #----------------------------------------------------------------------------------
  begin_drawing()
  clear_background(BLACK)

  # Draw everything in the render texture, note this will not be rendered on screen, yet
  begin_texture_mode(target)

  clear_background(RAYWHITE);  # Clear render texture background color

  0.upto(9) { |i| draw_rectangle(0, (gameScreenHeight / 10) * i, gameScreenWidth, gameScreenHeight / 10, colors[i]) }

  draw_text("If executed inside a window,\nyou can resize the window,\nand see the screen scaling!", 10, 25, 20, WHITE)

  end_texture_mode()

  # Draw RenderTexture2D to window, properly scaled
  draw_texture_pro(target.texture, Rectangle.init(0.0, 0.0, target.texture.width, -target.texture.height),
                   Rectangle.init(get_screen_width() - gameScreenWidth * scale * 0.5, get_screen_height() - gameScreenHeight * scale * 0.5,
                                  gameScreenWidth * scale, gameScreenHeight * scale), Vector2.init(0, 0), 0.0, WHITE)

  end_drawing()
  #--------------------------------------------------------------------------------------
end

# De-Initialization
#--------------------------------------------------------------------------------------
unload_render_texture(target);  # Unload render texture

close_window()                  # Close window and OpenGL context
#--------------------------------------------------------------------------------------
