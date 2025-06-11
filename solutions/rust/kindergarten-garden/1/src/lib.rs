use std::collections::HashMap;

const STUDENTS: [&str; 12] = [
    "Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph",
    "Kincaid", "Larry",
];

pub fn plants(diagram: &str, student: &str) -> Vec<&'static str> {
    let plants = HashMap::from([
        ('G', "Grass"),
        ('C', "Clover"),
        ('R', "Radish"),
        ('V', "Violet"),
    ]);
    let student_index = STUDENTS.iter().position(|s| *s == student).unwrap() + 1;

    let chunked = diagram
        .lines()
        .map(|l| {
            l.chars()
                .collect::<Vec<char>>()
                .chunks(2)
                .nth(student_index)
                .map(|pair| pair.iter().map(|w| plants.get(w)))
        })
        .filter_map(|w| w)
        .collect::<Vec<&str>>();
}
