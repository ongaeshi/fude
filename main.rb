require "./raylib"
include Raylib

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

window(SCREEN_WIDTH, SCREEN_HEIGHT, "fude") do
	set_target_fps(60)

	until window_should_close do
		# Update
		# TODO: Update your variables here

		# Draw
		draw do
			clear_background(RAYWHITE)
			draw_text("Hello, World!", 190, 200, 20, LIGHTGRAY);
		end
	end
end
