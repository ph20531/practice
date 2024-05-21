from datetime import datetime

def toISOFormat(data, *columns):
    for row in data:
        for column in columns:
            if column in row and isinstance(row[column], datetime):
                row[column] = row[column].isoformat()
    return data