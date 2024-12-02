use std::error::Error;
use std::fs;

fn main() -> Result<(), Box<dyn Error>> {
    let raw_string = fs::read_to_string("01in")?;
    let lines: Vec<&str> = raw_string.lines().collect();
    let length = lines.len();

    let mut left_arr: Vec<i32> = Vec::new();
    let mut right_arr: Vec<i32> = Vec::new();

    for i in 0..length {
        let line: Vec<&str> = lines[i].split("   ").collect();
        let left: i32 = line[0].parse()?;
        let right: i32 = line[1].parse()?;
        left_arr.push(left);
        right_arr.push(right);
    }

    left_arr.sort();
    right_arr.sort();

    let mut total: i32 = 0;
    for i in 0..length {
        total += (right_arr[i] - left_arr[i]).abs();
    }

    println!("{total}");
    Ok(())
}
