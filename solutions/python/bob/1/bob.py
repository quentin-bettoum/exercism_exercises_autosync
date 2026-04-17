def response(hey_bob: str) -> str:
    sentence = hey_bob.strip()

    if sentence == "":
        return "Fine. Be that way!"

    is_question = sentence.endswith("?")
    is_yelled = sentence == sentence.upper() and any(c.isalpha() for c in sentence)

    match (is_question, is_yelled):
        case (True, True):
            return "Calm down, I know what I'm doing!"
        case (True, False):
            return "Sure."
        case (False, True):
            return "Whoa, chill out!"
        case _:
            return "Whatever."
