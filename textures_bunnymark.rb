# raylib [textures] example - Bunnymark
require './raylib'
include Raylib

WINDOW_TITLE = "raylib [textures] example - bunnymark"
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

MAX_BUNNIES = 50000    # 50K bunnies limit

# This is the maximum amount of elements (quads) per batch
# NOTE: This value is defined in [rlgl] module and can be changed there
MAX_BATCH_ELEMENTS  = 8192

Bunny = Struct.new(
  :position, # Vector2
  :speed,    # Vector2
  :color     # Color
)

class TexturesBunnymarkScene
  def initialize
    @texBunny = load_texture("resources/wabbit_alpha.png")
    @bunnies = []

    set_target_fps(60)               # Set our game to run at 60 frames-per-second
  end

  def update
    if is_mouse_button_down(MOUSE_LEFT_BUTTON)
      # Create more bunnies
      0.upto(99) do
        if @bunnies.count < MAX_BUNNIES
          b = Bunny.new
          b.position = get_mouse_position
          b.speed = Vector2.init(
            get_random_value(-250, 250)/60.0,
            get_random_value(-250, 250)/60.0
            )
          b.color = Color.init(
            get_random_value(50, 240),
            get_random_value(80, 240),
            get_random_value(100, 240), 
            255
            )
          @bunnies.push(b)
        end
      end
    end

    # Update bunnies
    @bunnies.each do |e|
      e.position.x += e.speed.x
      e.position.y += e.speed.y

      if ((e.position.x + @texBunny.width/2) > get_screen_width) ||
          ((e.position.x + @texBunny.width/2) < 0)
          e.speed.x *= -1
      end

      if ((e.position.y + @texBunny.height/2) > get_screen_height()) ||
          ((e.position.y + @texBunny.height/2 - 40) < 0)
          e.speed.y *= -1
      end
    end
  end

  def draw
    clear_background(RAYWHITE);

    @bunnies.each do |e|
      # NOTE: When internal batch buffer limit is reached (MAX_BATCH_ELEMENTS),
      # a draw call is launched and buffer starts being filled again;
      # before issuing a draw call, updated vertex data from internal CPU buffer is send to GPU...
      # Process of sending data is costly and it could happen that GPU data has not been completely
      # processed for drawing while new data is tried to be sent (updating current in-use buffers)
      # it could generates a stall and consequently a frame drop, limiting the number of drawn bunnies
      draw_texture(@texBunny, e.position.x, e.position.y, e.color)
    end

    draw_rectangle(0, 0, SCREEN_WIDTH, 40, BLACK)
    draw_text("bunnies: #{@bunnies.count}", 120, 10, 20, GREEN)
    draw_text("batched draw calls: #{1 + @bunnies.count/MAX_BATCH_ELEMENTS}", 320, 10, 20, MAROON)

    draw_fps(10, 10);
  end

  def unsetup
    unload_texture(@texBunny)    # Unload bunny texture
  end
end

window(SCREEN_WIDTH, SCREEN_HEIGHT, WINDOW_TITLE) do
  scene = TexturesBunnymarkScene.new

  until window_should_close do
    scene.update

    draw do
      scene.draw
    end
  end

  scene.unsetup
end
