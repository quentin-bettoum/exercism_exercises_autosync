import re


def count_words(sentence: str) -> dict[str, int]:
    counts: dict[str, int] = {}
    for match in re.findall(r"\b[\w']+\b", sentence.replace("_", " ")):
        word = str(match).lower()
        counts[word] = counts.get(word, 0) + 1
    return counts
