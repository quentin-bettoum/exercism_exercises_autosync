use std::collections::{HashMap, HashSet};

pub struct School {
    students: HashMap<String, u32>,
}

impl School {
    pub fn new() -> School {
        School {
            students: HashMap::new(),
        }
    }

    pub fn add(&mut self, grade: u32, student: &str) {
        let student_name = student.to_string();
        self.students.entry(student_name).or_insert(grade);
    }

    pub fn grades(&self) -> Vec<u32> {
        let mut grades = self
            .students
            .iter()
            .map(|(_, &grade)| grade)
            .collect::<HashSet<u32>>()
            .into_iter()
            .collect::<Vec<u32>>();

        grades.sort();
        grades
    }

    pub fn grade(&self, grade: u32) -> Vec<String> {
        let mut grade = self
            .students
            .iter()
            .filter(|&(_, &g)| g == grade)
            .map(|(name, _)| name.to_owned())
            .collect::<Vec<String>>();

        grade.sort();
        grade
    }
}
