import re

LETTER_QTTY = 26

def is_pangram(phrase):
    unique_letters = __get_unique_letters_from__(phrase)
    return len(unique_letters) == LETTER_QTTY

def __get_unique_letters_from__(phrase):
    only_letters = re.sub(r"[^a-z]", "", phrase.lower())
    return set(only_letters)
