use std::collections::HashMap;
use std::error::Error;
use std::fs;

fn main() -> Result<(), Box<dyn Error>> {
    let raw_string = fs::read_to_string("01in")?;
    let lines: Vec<&str> = raw_string.lines().collect();
    let length = lines.len();

    let mut left_arr: Vec<i32> = Vec::new();
    let mut hash_map: HashMap<i32, i32> = HashMap::new();

    for i in 0..length {
        let line: Vec<&str> = lines[i].split("   ").collect();
        let left: i32 = line[0].parse()?;
        let right: i32 = line[1].parse()?;

        left_arr.push(left);
        *hash_map.entry(right).or_insert(0) += right;
    }

    let mut total = 0;
    for i in 0..length {
        total += *hash_map.entry(left_arr[i]).or_insert(0);
    }
    println!("{total}");

    Ok(())
}
