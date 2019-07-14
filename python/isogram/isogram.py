"""
isogram module
"""
import re

def is_isogram(word):
    """
    check if word is isogram
    """
    lowercase_letters = re.sub(r"[^A-Za-z]", "", word.lower())
    return len(lowercase_letters) == len(set(lowercase_letters))
