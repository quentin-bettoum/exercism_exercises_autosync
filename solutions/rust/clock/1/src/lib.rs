use std::fmt;

#[derive(Debug)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        Self { hours, minutes }.normalize_time()
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Self::new(self.hours, self.minutes + minutes)
    }

    fn normalize_time(mut self) -> Self {
        while self.minutes < 0 {
            self.minutes += 60;
            self.hours -= 1;
        }

        while self.hours < 0 {
            self.hours += 24;
        }

        while self.minutes >= 60 {
            self.hours += 1;
            self.minutes -= 60;
        }

        self.hours = self.hours % 24;

        return self;
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(
            f,
            "{}:{}",
            format!("{:02}", self.hours),
            format!("{:02}", self.minutes)
        )
    }
}

impl PartialEq for Clock {
    fn eq(&self, other: &Self) -> bool {
        self.minutes == other.minutes && self.hours == other.hours
    }
}
