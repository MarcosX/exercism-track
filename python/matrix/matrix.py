"""
matrix parsing from string
"""
class Matrix:
    """
    Matrix class to parse string
    """


    def __init__(self, matrix_string):
        """
        split string and parse elements to int
        """
        self.rows = [[int(i) for i in row.split()] for row in matrix_string.split("\n")]

    def row(self, index):
        """
        get single row
        """
        return self.rows[index-1]

    def column(self, index):
        """
        build a column
        """
        return [row[index-1] for row in self.rows]
