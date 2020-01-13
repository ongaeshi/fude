# raylib [audio] example - Module playing (streaming)
require './raylib'
include Raylib

MAX_CIRCLES = 64

CircleWave = Struct.new(:position, :radius, :alpha, :speed, :color)

# Initialization
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

# SetConfigFlags(FLAG_MSAA_4X_HINT)  # NOTE: Try to enable MSAA 4X

window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [audio] example - module playing (streaming)") do
  init_audio_device      # Initialize audio device

  colors = [ORANGE, RED, GOLD, LIME, BLUE, VIOLET, BROWN, LIGHTGRAY, PINK, YELLOW, GREEN, SKYBLUE, PURPLE, BEIGE]

  # Creates ome circles for visual effect
  circles = []

  (MAX_CIRCLES-1).downto(0) do |i|
    circles[i] = CircleWave.new
    circles[i].alpha = 0.0
    circles[i].radius = get_random_value(10, 40)
    circles[i].position = Vector3.new
    circles[i].position.x = get_random_value(circles[i].radius, SCREEN_WIDTH - circles[i].radius)
    circles[i].position.y = get_random_value(circles[i].radius, SCREEN_HEIGHT - circles[i].radius)
    circles[i].speed = get_random_value(1, 100)/2000.0
    circles[i].color = colors[get_random_value(0, 13)]
  end

  music = load_music_stream("resources/mini1111.xm")

  play_music_stream(music)

  time_played = 0.0
  pause = false

  set_target_fps(60)       # Set our game to run at 60 frames-per-second

  # Main game loop
  until window_should_close do    # Detect window close button or ESC key
    # Update
    update_music_stream(music)      # Update music buffer with new stream data

    # Restart music playing (stop and play)
    if is_key_pressed(KEY_SPACE)
      stop_music_stream(music)
      play_music_stream(music)
    end

    # Pause/Resume music playing
    if is_key_pressed(KEY_P)
      pause = !pause

      if (pause)
        pause_music_stream(music)
      else
        resume_music_stream(music)
      end
    end

    # Get time_played scaled to bar dimensions
    time_played = get_music_time_played(music)/get_music_time_length(music)*(SCREEN_WIDTH - 40)

    # Color circles animation
    (MAX_CIRCLES-1).downto(0) do |i|
      break if pause

      circles[i].alpha += circles[i].speed
      circles[i].radius += circles[i].speed*10.0

      circles[i].speed *= -1 if (circles[i].alpha > 1.0)

      if (circles[i].alpha <= 0.0)
        circles[i].alpha = 0.0
        circles[i].radius = get_random_value(10, 40)
        circles[i].position.x = get_random_value(circles[i].radius, SCREEN_WIDTH - circles[i].radius)
        circles[i].position.y = get_random_value(circles[i].radius, SCREEN_HEIGHT - circles[i].radius)
        circles[i].color = colors[get_random_value(0, 13)]
        circles[i].speed = get_random_value(1, 100)/2000.0
      end
    end

    # Draw
    draw do
      clear_background(RAYWHITE)

      (MAX_CIRCLES-1).downto(0) do |i|
        draw_circle_v(circles[i].position, circles[i].radius, fade(circles[i].color, circles[i].alpha))
      end

      # Draw time bar
      draw_rectangle(20, SCREEN_HEIGHT - 20 - 12, SCREEN_WIDTH - 40, 12, LIGHTGRAY)
      draw_rectangle(20, SCREEN_HEIGHT - 20 - 12, time_played, 12, MAROON)
      draw_rectangle_lines(20, SCREEN_HEIGHT - 20 - 12, SCREEN_WIDTH - 40, 12, GRAY)
    end
  end

  # De-Initialization
  unload_music_stream(music)      # Unload music stream buffers from RAM
  close_audio_device              # Close audio device (music streaming is automatically stopped)
end
