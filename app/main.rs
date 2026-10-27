use std::{env, fs, thread};
use std::time::{Duration, SystemTime, UNIX_EPOCH};

fn main() {
    let host = fs::read_to_string("/etc/hostname").unwrap_or_default().trim().to_string();
    let greeting = env::var("GREETING").unwrap_or_else(|_| "Hello".to_string());

    loop {
        let secs = SystemTime::now().duration_since(UNIX_EPOCH).unwrap().as_secs();
        println!("{} | host={} | unix_time={}", greeting, host, secs);
        thread::sleep(Duration::from_secs(5));
    }
}


