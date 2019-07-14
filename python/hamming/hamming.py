"""
Hamming distance
"""
def distance(strand_a, strand_b):
    """
    calculate distance between strands with same length
    """
    if len(strand_a) != len(strand_b):
        raise ValueError("Mismatch in strands length")
    return sum(sa != sb for sa, sb in zip(strand_a, strand_b))
