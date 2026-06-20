import pandas as pd
import pyodbc

df = pd.read_csv(
    "data/generated/survey_responses.csv"
)

conn = pyodbc.connect(
    "Driver={ODBC Driver 17 for SQL Server};"
    "Server=A\\SQLEXPRESS;"
    "Database=Leadership360Lakehouse;"
    "Trusted_Connection=yes;"
)

cursor = conn.cursor()

count = 0

for _, row in df.iterrows():

    cursor.execute("""
    INSERT INTO landing.SurveyResponse
    (
        ParticipantID,
        AssessmentID,
        CompetencyID,
        Score,
        ResponseDate
    )
    VALUES (?, ?, ?, ?, ?)
    """,

    str(row["ParticipantID"]),
    str(row["AssessmentID"]),
    str(row["CompetencyID"]),
    int(row["Score"]),
    str(row["ResponseDate"])
    )

    count += 1

    if count % 1000 == 0:
        print(f"{count} loaded")

conn.commit()

cursor.close()
conn.close()

print("Completed")