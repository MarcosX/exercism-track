// This is a "stub" file.  It's a little start on your solution.
// It's not a complete solution though; you have to write some code.

// Package bob should have a package comment that summarizes what it's about.
// https://golang.org/doc/effective_go.html#commentary
package bob

import (
	"regexp"
	"strings"
)

type Remark struct {
	empty     bool
	noLetters bool
	asking    bool
	screaming bool
}

func newRemark(remark string) Remark {
	cleanRemark := strings.TrimSpace(remark)
	return Remark{
		empty:     cleanRemark == "",
		noLetters: nil == regexp.MustCompile(`[a-zA-Z]`).Find([]byte(cleanRemark)),
		asking:    strings.HasSuffix(cleanRemark, "?"),
		screaming: cleanRemark == strings.ToUpper(cleanRemark),
	}
}

func (remark Remark) isSilence() bool {
	return remark.empty
}

func (remark Remark) isShouting() bool {
	return !remark.noLetters && remark.screaming
}

func (remark Remark) isQuestion() bool {
	return remark.asking && !remark.isShouting()
}

func (remark Remark) isShoutingQuestion() bool {
	return remark.asking && remark.isShouting()
}

// Hey should have a comment documenting it.
func Hey(remark string) string {
	r := newRemark(remark)
	switch {
	case r.isSilence():
		return "Fine. Be that way!"
	case r.isShoutingQuestion():
		return "Calm down, I know what I'm doing!"
	case r.isShouting():
		return "Whoa, chill out!"
	case r.isQuestion():
		return "Sure."
	default:
		return "Whatever."
	}
}
