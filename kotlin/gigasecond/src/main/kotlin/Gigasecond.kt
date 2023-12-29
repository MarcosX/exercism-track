import java.time.LocalDate
import java.time.LocalDateTime
import java.time.ZoneOffset

class Gigasecond(date: LocalDateTime) {
    val date: LocalDateTime =
            LocalDateTime.ofInstant(
                    date.toInstant(ZoneOffset.UTC).plusMillis(1_000_000_000_000),
                    ZoneOffset.UTC.normalized()
            )

    constructor(date: LocalDate) : this(date.atStartOfDay()) {}
}
