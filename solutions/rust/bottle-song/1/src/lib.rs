const NUMBERS_MAPPING: [&str; 11] = [
    "no", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
];

pub fn recite(start_bottles: u32, take_down: u32) -> String {
    let stop_bottle = start_bottles - take_down + 1;
    let mut verses = String::default();

    for n in (stop_bottle..=start_bottles).rev() {
        if !verses.is_empty() {
            verses.push_str("\n\n");
        }

        let hanging_on_the_wall = format!(
            "{} {} hanging on the wall,\n",
            capitalize(NUMBERS_MAPPING[n as usize]),
            green_bottle(n.try_into().unwrap())
        );

        verses.push_str(&hanging_on_the_wall);
        verses.push_str(&hanging_on_the_wall);
        verses.push_str("And if one green bottle should accidentally fall,\n");
        verses.push_str(&format!(
            "There'll be {} {} hanging on the wall.",
            NUMBERS_MAPPING[(n as usize) - 1],
            green_bottle((n as i32) - 1)
        ));
    }

    verses
}

fn capitalize(s: &str) -> String {
    s.chars().nth(0).unwrap().to_uppercase().to_string() + &s[1..]
}

fn green_bottle(n: i32) -> String {
    let mut gb = String::from("green bottles");

    if n == 1 {
        gb.pop();
    }

    gb
}
