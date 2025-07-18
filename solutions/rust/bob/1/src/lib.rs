pub fn reply(mut message: &str) -> &str {
    message = message.trim();

    let is_question = message.ends_with("?");
    let is_yelled = is_yelled(message);
    if is_question && is_yelled {
        "Calm down, I know what I'm doing!"
    } else if is_question {
        "Sure."
    } else if is_yelled {
        "Whoa, chill out!"
    } else if message.is_empty() {
        "Fine. Be that way!"
    } else {
        "Whatever."
    }
}

fn is_yelled(message: &str) -> bool {
    message.chars().any(|c| c.is_alphabetic())
        && message
            .chars()
            .all(|c| !c.is_alphabetic() || c.is_uppercase())
}
