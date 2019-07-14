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
        self.rows = list(map(self.convert_row_to_int, matrix_string.split("\n")))

    @staticmethod
    def convert_row_to_int(row):
        """
        split a row and cast element to int
        """
        return list(map(int, row.split()))

    def row(self, index):
        """
        get single row
        """
        return self.rows[index-1]

    def column(self, index):
        """
        build a column
        """
        return list(map(lambda row: row[index-1], self.rows))
