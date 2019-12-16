/*******************************************************************************************
*
*   raylib [core] example - 2d camera
*
*   This example has been created using raylib 1.5 (www.raylib.com)
*   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
*
*   Copyright (c) 2016 Ramon Santamaria (@raysan5)
*
********************************************************************************************/

#include "raylib.h"

#define MAX_BUILDINGS   100

int main(void)
{
    # Initialization
    #--------------------------------------------------------------------------------------
    const int screenWidth = 800;
    const int screenHeight = 450;

    init_window(screenWidth, screenHeight, "raylib [core] example - 2d camera");

    Rectangle player = { 400, 280, 40, 40 };
    Rectangle buildings[MAX_BUILDINGS] = { 0 };
    Color buildColors[MAX_BUILDINGS] = { 0 };

    int spacing = 0;

    for (int i = 0; i < MAX_BUILDINGS; i++)
    {
        buildings[i].width = get_random_value(50, 200);
        buildings[i].height = get_random_value(100, 800);
        buildings[i].y = screenHeight - 130 - buildings[i].height;
        buildings[i].x = -6000 + spacing;

        spacing += buildings[i].width;

        buildColors[i] = (Color){ get_random_value(200, 240), get_random_value(200, 240), get_random_value(200, 250), 255 };
    }

    Camera2D camera = { 0 };
    camera.target = (Vector2){ player.x + 20, player.y + 20 };
    camera.offset = (Vector2){ screenWidth/2, screenHeight/2 };
    camera.rotation = 0.0;
    camera.zoom = 1.0;

    set_target_fps(60);                   # Set our game to run at 60 frames-per-second
    #--------------------------------------------------------------------------------------

    # Main game loop
    while (!window_should_close())        # Detect window close button or ESC key
    {
        # Update
        #----------------------------------------------------------------------------------
        
        # Player movement
        if (is_key_down(KEY_RIGHT)) player.x += 2;
        else if (is_key_down(KEY_LEFT)) player.x -= 2;

        # Camera target follows player
        camera.target = (Vector2){ player.x + 20, player.y + 20 };

        # Camera rotation controls
        if (is_key_down(KEY_A)) camera.rotation--;
        else if (is_key_down(KEY_S)) camera.rotation++;

        # Limit camera rotation to 80 degrees (-40 to 40)
        if (camera.rotation > 40) camera.rotation = 40;
        else if (camera.rotation < -40) camera.rotation = -40;

        # Camera zoom controls
        camera.zoom += ((float)get_mouse_wheel_move()*0.05);

        if (camera.zoom > 3.0) camera.zoom = 3.0;
        else if (camera.zoom < 0.1) camera.zoom = 0.1;

        # Camera reset (zoom and rotation)
        if (is_key_pressed(KEY_R))
        {
            camera.zoom = 1.0;
            camera.rotation = 0.0;
        }
        #----------------------------------------------------------------------------------

        # Draw
        #----------------------------------------------------------------------------------
        begin_drawing();

            clear_background(RAYWHITE);

            begin_mode2d(camera);

                draw_rectangle(-6000, 320, 13000, 8000, DARKGRAY);

                for (int i = 0; i < MAX_BUILDINGS; i++) draw_rectangle_rec(buildings[i], buildColors[i]);

                draw_rectangle_rec(player, RED);

                draw_line(camera.target.x, -screenHeight*10, camera.target.x, screenHeight*10, GREEN);
                draw_line(-screenWidth*10, camera.target.y, screenWidth*10, camera.target.y, GREEN);

            end_mode2d();

            draw_text("SCREEN AREA", 640, 10, 20, RED);

            draw_rectangle(0, 0, screenWidth, 5, RED);
            draw_rectangle(0, 5, 5, screenHeight - 10, RED);
            draw_rectangle(screenWidth - 5, 5, 5, screenHeight - 10, RED);
            draw_rectangle(0, screenHeight - 5, screenWidth, 5, RED);

            draw_rectangle( 10, 10, 250, 113, fade(SKYBLUE, 0.5));
            draw_rectangle_lines( 10, 10, 250, 113, BLUE);

            draw_text("Free 2d camera controls:", 20, 20, 10, BLACK);
            draw_text("- Right/Left to move Offset", 40, 40, 10, DARKGRAY);
            draw_text("- Mouse Wheel to Zoom in-out", 40, 60, 10, DARKGRAY);
            draw_text("- A / S to Rotate", 40, 80, 10, DARKGRAY);
            draw_text("- R to reset Zoom and Rotation", 40, 100, 10, DARKGRAY);

        end_drawing();
        #----------------------------------------------------------------------------------
    }

    # De-Initialization
    #--------------------------------------------------------------------------------------
    close_window();        # Close window and OpenGL context
    #--------------------------------------------------------------------------------------

    return 0;
}
