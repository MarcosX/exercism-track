package acronym

import (
  "strings"
  "unicode"
)

func Abbreviate(fullName string) (abbreviation string) {
  shouldSplit := func (c rune) bool {
    return !(unicode.IsLetter(c) || c == '\'')
  }
  words := strings.FieldsFunc(fullName, shouldSplit)
  for _, word := range words {
    abbreviation += string(word[0])
  }
  return strings.ToUpper(abbreviation)
}
