#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist(first_list: &[i32], second_list: &[i32]) -> Comparison {
    let len1 = first_list.len();
    let len2 = second_list.len();

    if first_list == second_list {
        return Comparison::Equal;
    } else if len1 == 0 && len2 > 0 {
        return Comparison::Sublist;
    } else if len2 == 0 && len1 > 0 {
        return Comparison::Superlist;
    }

    if len1 < len2 {
        for i in 0..=len2 - len1 {
            // if first_list.iter().eq(&second_list[i..i + len1]) {
            if first_list == &second_list[i..i + len1] {
                return Comparison::Sublist;
            }
        }
    } else if len2 < len1 {
        for i in 0..=len1 - len2 {
            // if second_list.iter().eq(&first_list[i..i + len2]) {
            if second_list == &first_list[i..i + len2] {
                return Comparison::Superlist;
            }
        }
    }

    return Comparison::Unequal;
}
