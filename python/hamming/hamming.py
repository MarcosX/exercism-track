"""
Hamming distance
"""
def distance(strand_a, strand_b):
    """
    calculate distance between strands with same length
    """
    if len(strand_a) != len(strand_b):
        raise ValueError("Mismatch in strands length")
    zipped_strands = zip(strand_a, strand_b)
    different_strands = lambda strand_tuple: strand_tuple[0] != strand_tuple[1]
    return len(list(filter(different_strands, zipped_strands)))
