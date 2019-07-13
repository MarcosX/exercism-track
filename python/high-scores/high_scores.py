"""
Functions to retrieve score informations
"""
def latest(scores):
    """
    get the latest score
    """
    return min(filter(lambda s: s > 0, scores))


def personal_best(scores):
    """
    get the highest score
    """
    return max(scores)


def personal_top_three(scores):
    """
    get the top three highest score
    """
    return sorted(scores, reverse=True)[:3]
