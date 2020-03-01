extern crate rodio;
use std::ffi::CStr;
use std::io::BufReader;
use std::os::raw::c_char;
use std::thread;
use std::time::Duration;

#[no_mangle]
pub extern "C" fn play_once(ptr: *const c_char) {
    let cstr = unsafe { CStr::from_ptr(ptr) };
    let device = rodio::default_output_device().unwrap(); // instantiate rodio with the default speaker
    let file = std::fs::File::open(cstr.to_str().unwrap()).unwrap(); // open file
    let beep1 = rodio::play_once(&device, BufReader::new(file)).unwrap(); // play audio
    beep1.set_volume(0.2); //set volume (automatically set to 0 on mac apparently)
    println!("Started beep1");

    thread::sleep(Duration::from_millis(1500)); // wait 1.5 s until stop playing
    drop(beep1); // drop reference to beep1
    println!("Stopped beep1");
}
