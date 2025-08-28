const POSSIBLE_ACTIONS: [(u8, &str); 5] = [
    (0b00001, "wink"),
    (0b00010, "double blink"),
    (0b00100, "close your eyes"),
    (0b01000, "jump"),
    (0b10000, "reverse"),
];

pub fn actions(n: u8) -> Vec<&'static str> {
    POSSIBLE_ACTIONS
        .iter()
        .fold(Vec::new(), |mut acc, i| match i {
            (b, "reverse") if (n & b) > 0 => {
                acc.reverse();
                acc
            }
            (b, action) if (n & b) > 0 => {
                acc.push(action);
                acc
            }
            _ => acc,
        })
}
