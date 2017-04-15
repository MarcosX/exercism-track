import re

def is_pangram(phrase):
  single_letters = re.sub(r"[^A-Za-z]", "", phrase.lower())
  return len(set(single_letters)) == 26
