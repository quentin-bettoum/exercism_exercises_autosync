use core::cmp::{
    Ord,
    Ordering::{Equal, Greater, Less},
};

pub fn find<T: Ord, U: AsRef<[T]>>(array: U, key: T) -> Option<usize> {
    let array = array.as_ref();
    let mut low = 0;
    let mut high = array.len();

    while low < high {
        let mid = usize::midpoint(low, high);
        match array[mid].cmp(&key) {
            Equal => return Some(mid),
            Less => low = mid + 1,
            Greater => high = mid,
        }
    }

    None
}
