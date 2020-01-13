# raylib [textures] example - Background scrolling
require "../../raylib"
include Raylib

WINDOW_TITLE = "raylib [textures] example - @background scrolling"
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

class TexturesBackgroundScrollingScene
  def initialize
    # NOTE: Be careful, background width must be equal or bigger than screen width
    # if not, texture should be draw more than two times for scrolling effect
    @background = load_texture("resources/cyberpunk_street_background.png")
    @midground = load_texture("resources/cyberpunk_street_midground.png")
    @foreground = load_texture("resources/cyberpunk_street_foreground.png")

    @scrolling_back = 0.0
    @scrolling_mid = 0.0
    @scrolling_fore = 0.0

    # Set our game to run at 60 frames-per-second
    set_target_fps(60)
  end

  def update
    # Update
    @scrolling_back -= 0.1
    @scrolling_mid -= 0.5
    @scrolling_fore -= 1.0

    # NOTE: Texture is scaled twice its size, so it sould be considered on scrolling
    @scrolling_back = 0 if (@scrolling_back <= -@background.width*2)
    @scrolling_mid = 0 if (@scrolling_mid <= -@midground.width*2)
    @scrolling_fore = 0 if (@scrolling_fore <= -@foreground.width*2)
  end

  def draw
    clear_background(get_color(0x052c46ff))

    # Draw @background image twice
    # NOTE: Texture is scaled twice its size
    draw_texture_ex(@background, Vector2.init(@scrolling_back, 20), 0.0, 2.0, WHITE)
    draw_texture_ex(@background, Vector2.init(@background.width*2 + @scrolling_back, 20), 0.0, 2.0, WHITE)

    # Draw @midground image twice
    draw_texture_ex(@midground, Vector2.init(@scrolling_mid, 20), 0.0, 2.0, WHITE)
    draw_texture_ex(@midground, Vector2.init(@midground.width*2 + @scrolling_mid, 20), 0.0, 2.0, WHITE)

    # Draw @foreground image twice
    draw_texture_ex(@foreground, Vector2.init(@scrolling_fore, 70), 0.0, 2.0, WHITE)
    draw_texture_ex(@foreground, Vector2.init(@foreground.width*2 + @scrolling_fore, 70), 0.0, 2.0, WHITE)

    draw_text("BACKGROUND SCROLLING & PARALLAX", 10, 10, 20, RED)
    draw_text("(c) Cyberpunk Street Environment by Luis Zuno (@ansimuz)", SCREEN_WIDTH - 330, SCREEN_HEIGHT - 20, 10, RAYWHITE)
  end

  def unsetup
    unload_texture(@background)  # Unload background texture
    unload_texture(@midground)   # Unload midground texture
    unload_texture(@foreground)  # Unload foreground texture
  end
end

window(SCREEN_WIDTH, SCREEN_HEIGHT, WINDOW_TITLE) do
  scene = TexturesBackgroundScrollingScene.new

  until window_should_close do
    scene.update

    draw do
      scene.draw
    end
  end

  scene.unsetup
end
