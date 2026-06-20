import pyodbc

conn = pyodbc.connect(
    "Driver={ODBC Driver 17 for SQL Server};"
    "Server=A\\SQLEXPRESS;"
    "Database=Leadership360Lakehouse;"
    "Trusted_Connection=yes;"
)

print("Connected Successfully")

conn.close()