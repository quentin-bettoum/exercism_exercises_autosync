pub fn build_proverb(list: &[&str]) -> String {
    let mut text = String::default();

    if list.is_empty() {
        return text;
    }

    for e in list.windows(2) {
        text.push_str(&format!("For want of a {} the {} was lost.\n", e[0], e[1]));
    }

    text.push_str(&format!(
        "And all for the want of a {}.",
        list.first().unwrap()
    ));

    text
}
