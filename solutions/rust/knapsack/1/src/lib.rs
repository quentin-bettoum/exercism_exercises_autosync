#[derive(Debug)]
pub struct Item {
    pub weight: u32,
    pub value: u32,
}

pub fn maximum_value(max_weight: u32, items: &[Item]) -> u32 {
    let max_weight = max_weight as usize;
    let mut max_value_per_weight = vec![0; max_weight + 1];

    for item in items {
        let weight = item.weight as usize;
        for w in (weight..=max_weight).rev() {
            max_value_per_weight[w] =
                max_value_per_weight[w].max(max_value_per_weight[w - weight] + item.value);
        }
    }

    max_value_per_weight[max_weight]
}
