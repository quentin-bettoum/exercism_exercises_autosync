use std::fmt;

#[derive(Debug, PartialEq, Eq)]
pub struct Clock {
    hours: i16,
    minutes: i16,
}

impl Clock {
    pub fn new(hours: i16, minutes: i16) -> Self {
        Self {
            hours: (hours + minutes.div_euclid(60)).rem_euclid(24),
            minutes: minutes.rem_euclid(60),
        }
    }

    pub fn add_minutes(&self, minutes: i16) -> Self {
        Self::new(self.hours, self.minutes + minutes)
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}
