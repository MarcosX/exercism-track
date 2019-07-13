def latest(scores):
    score = scores[0]
    for s in scores:
        if(score > s and s > 0):
            score = s
    return score


def personal_best(scores):
    score = scores[0]
    for s in scores:
        if(score < s and s > 0):
            score = s
    return score


def personal_top_three(scores):
    score = []
    for s in scores:
        if(len(score) < 3):
            score.append(s)
        elif(min(score) < s and s > 0 and s not in score):
            score.remove(min(score))
            score.append(s)
    score.sort(reverse=True)
    return score
