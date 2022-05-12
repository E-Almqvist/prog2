extern crate sdl2;
use sdl2::pixels::Color;
use sdl2::rect::Rect;
use sdl2::render::Canvas;
//use sdl2::ttf::Font;

pub fn create_window(title: &str, width: u32, height: u32) 
    -> (sdl2::video::Window, sdl2::Sdl, sdl2::VideoSubsystem) 
{
    let ctx = sdl2::init().unwrap();
    let vid_sys = ctx.video().unwrap();

    let window = vid_sys.window(title, width, height)
                        .position_centered()
                        .build()
                        .unwrap();
    return (window, ctx, vid_sys);
}

/*
pub fn text(x: u32, y: u32, text: &str, font_path: &str) {
    let ttf_context = sdl2::ttf::init();
    let mut font = ttf_context.load_font(font_path, 128);
    font.set_style(sdl2::ttf::FontStyle::BOLD);

    // render a surface, and convert it to a texture bound to the canvas
    let surface = font
        .render(text)
        .blended(Color::RGBA(255, 255, 255, 255))
        .map_err(|e| e.to_string())?;
}
*/

pub fn set_pixel(canvas: &mut Canvas<sdl2::video::Window>, x: i32, y: i32, color: Color) {
    canvas.set_draw_color(color);
    canvas.fill_rect(Rect::new(x, y, 1, 1));
}
