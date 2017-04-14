import re

def is_isogram(word):
  return len(re.sub(r"[^A-Za-z]", "", word.lower())) == len(set(re.sub(r"[^a-z]", "", word.lower())))
