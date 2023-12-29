import java.time.LocalDate
import java.time.LocalDateTime

class Gigasecond(date: LocalDateTime) {
    val date: LocalDateTime = date.plusSeconds(1_000_000_000)

    constructor(date: LocalDate) : this(date.atStartOfDay())
}
