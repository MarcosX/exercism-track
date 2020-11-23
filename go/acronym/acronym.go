// This is a "stub" file.  It's a little start on your solution.
// It's not a complete solution though; you have to write some code.

// Package acronym should have a package comment that summarizes what it's about.
// https://golang.org/doc/effective_go.html#commentary
package acronym

import (
  "strings"
  "regexp"
)

// Abbreviate should have a comment documenting it.
func Abbreviate(s string) (abbreviation string) {
  formattedString := strings.ReplaceAll(s, "'", "")
  re := regexp.MustCompile("[a-zA-Z]+")
  wordsRange := re.FindAllIndex([]byte(formattedString), -1)
  for _, wordRange := range wordsRange {
    firstLetter := string(formattedString[wordRange[0]])
    abbreviation += firstLetter
  }
	return strings.ToUpper(abbreviation)
}
