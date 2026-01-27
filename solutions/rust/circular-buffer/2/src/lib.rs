use std::collections::VecDeque;

pub struct CircularBuffer<T> {
    items: VecDeque<T>,
}

#[derive(Debug, PartialEq, Eq)]
pub enum Error {
    EmptyBuffer,
    FullBuffer,
}

impl<T> CircularBuffer<T> {
    pub fn new(capacity: usize) -> Self {
        Self {
            items: VecDeque::with_capacity(capacity),
        }
    }

    pub fn write(&mut self, element: T) -> Result<(), Error> {
        if self.is_full() {
            Err(Error::FullBuffer)
        } else {
            self.items.push_back(element);
            Ok(())
        }
    }

    pub fn read(&mut self) -> Result<T, Error> {
        if self.is_empty() {
            Err(Error::EmptyBuffer)
        } else {
            Ok(self.items.pop_front().unwrap())
        }
    }

    pub fn clear(&mut self) {
        self.items.clear();
    }

    pub fn overwrite(&mut self, element: T) {
        if self.is_full() {
            self.items.pop_front();
        }

        let _: Result<(), Error> = self.write(element);
    }

    fn is_full(&self) -> bool {
        self.items.len() == self.items.capacity()
    }

    fn is_empty(&self) -> bool {
        self.items.is_empty()
    }
}
