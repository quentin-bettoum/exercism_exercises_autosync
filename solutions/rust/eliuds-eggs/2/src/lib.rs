pub fn egg_count(display_value: u32) -> usize {
    // format!("{:b}", display_value)
    //     .chars()
    //     .filter(|&c| c == '1')
    //     .count()
    display_value.count_ones() as usize
}
