# raylib [core] example - Keyboard input
require "../../raylib"
include Raylib

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - keyboard input") do
	ball_position = Vector2.init(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)

	set_target_fps(60)

	until window_should_close do
		# Update
	  ball_position.x += 2.0 if is_key_down(KEY_RIGHT)
	  ball_position.x -= 2.0 if is_key_down(KEY_LEFT)
	  ball_position.y -= 2.0 if is_key_down(KEY_UP)
	  ball_position.y += 2.0 if is_key_down(KEY_DOWN)

		# Draw
		draw do
			clear_background(RAYWHITE)
			draw_text("move the ball with arrow keys", 10, 10, 20, DARKGRAY)
			draw_circle_v(ball_position, 50, MAROON);
		end
	end
end
