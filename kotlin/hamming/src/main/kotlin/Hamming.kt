object Hamming {

    fun compute(leftStrand: String, rightStrand: String): Int {
        if (leftStrand.length != rightStrand.length)
                throw IllegalArgumentException("left and right strands must be of equal length")
        return leftStrand.foldIndexed(0) { index, distance, base ->
            if (!base.equals(rightStrand.get(index))) distance + 1 else distance
        }
    }
}
