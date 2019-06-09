// Package gigasecond provides functionality for measuring
// Gigasecond date
package gigasecond

import "time"

const GigasecondDuration = 1e9

// AddGigasecond will add 10^9 to the time sent as param
func AddGigasecond(t time.Time) time.Time {
	return t.Add(time.Second * GigasecondDuration)
}
