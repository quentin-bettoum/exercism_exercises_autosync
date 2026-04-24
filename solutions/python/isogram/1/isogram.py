import re


def is_isogram(string: str) -> bool:
    return re.search(r"([a-z]).*\1", string, re.IGNORECASE) is None
