// This is a "stub" file.  It's a little start on your solution.
// It's not a complete solution though; you have to write some code.

// Package acronym should have a package comment that summarizes what it's about.
// https://golang.org/doc/effective_go.html#commentary
package acronym

import (
  "strings"
  "unicode"
)

// Abbreviate should have a comment documenting it.
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
