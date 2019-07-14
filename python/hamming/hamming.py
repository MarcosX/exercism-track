"""
Hamming distance
"""
def distance(strand_a, strand_b):
    """
    calculate distance between strands with same length
    """
    if len(strand_a) != len(strand_b):
        raise ValueError("Mismatch in strands length")
    return sum(1 for dna_a, dna_b in zip(strand_a, strand_b) if dna_a != dna_b)
