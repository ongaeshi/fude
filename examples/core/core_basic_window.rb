# raylib [core] example - Basic window
require './raylib'
include Raylib

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - basic window") do
	set_target_fps(60)

	until window_should_close do
		# Update
		# TODO: Update your variables here

		# Draw
		draw do
			clear_background(RAYWHITE)
			draw_text("Congrats! You created your first window!", 190, 200, 20, LIGHTGRAY);
		end
	end
end
