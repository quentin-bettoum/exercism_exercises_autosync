use std::cmp::{
    Ord,
    Ordering::{Equal, Greater, Less},
};

pub fn find<T, U>(array: U, key: T) -> Option<usize>
where
    T: Ord,
    U: AsRef<[T]>,
{
    let array = array.as_ref();
    let mut low = 0;
    let mut high = array.len();

    while low < high {
        let mid = low + (high - low) / 2;
        match array[mid].cmp(&key) {
            Equal => return Some(mid),
            Less => low = mid + 1,
            Greater => high = mid,
        }
    }

    None
}
