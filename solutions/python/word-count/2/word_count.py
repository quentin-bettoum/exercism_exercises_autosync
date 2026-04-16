import re
from collections import Counter


def count_words(sentence: str) -> dict[str, int]:
    # words = re.findall(r"\b[\w']+\b", sentence.lower().replace("_", " "))
    # return {word: words.count(word) for word in words}
    return Counter(re.findall(r"\b[\w']+\b", sentence.lower().replace("_", " ")))
