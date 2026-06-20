import pyodbc

conn = pyodbc.connect(
    "Driver={ODBC Driver 17 for SQL Server};"
    "Server=A\\SQLEXPRESS;"
    "Database=Leadership360Lakehouse;"
    "Trusted_Connection=yes;"
)

cursor = conn.cursor()

cursor.execute("""
INSERT INTO landing.Participant
(
ParticipantID,
ParticipantName,
Department,
Region,
JobLevel,
HireDate,
ManagerID
)
VALUES
(
'PTEST',
'Test User',
'Sales',
'India',
'Manager',
'2024-01-01',
'M100'
)
""")

conn.commit()

print("Inserted")

cursor.close()
conn.close()