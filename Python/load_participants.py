import pandas as pd
import pyodbc

# Read CSV
df = pd.read_csv(
    "data/generated/participants.csv"
)

# Replace null regions

df["Region"] = df["Region"].fillna("Unknown")

print("Null Regions:", df["Region"].isna().sum())

# Convert all string columns properly

df["ParticipantID"] = df["ParticipantID"].astype(str)
df["ParticipantName"] = df["ParticipantName"].astype(str)
df["Department"] = df["Department"].astype(str)
df["JobLevel"] = df["JobLevel"].astype(str)
df["ManagerID"] = df["ManagerID"].astype(str)

# Handle null regions

df["Region"] = df["Region"].where(
    pd.notnull(df["Region"]),
    None
)


# SQL Connection
conn = pyodbc.connect(
    "Driver={ODBC Driver 17 for SQL Server};"
    "Server=A\\SQLEXPRESS;"
    "Database=Leadership360Lakehouse;"
    "Trusted_Connection=yes;"
)

cursor = conn.cursor()

count = 0
print(df.dtypes)
print(df.head())
print(df.loc[59])
for index, row in df.iterrows():

    try:

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
        VALUES (?, ?, ?, ?, ?, ?, ?)
        """,

        str(row["ParticipantID"]),
        str(row["ParticipantName"]),
        str(row["Department"]),
        row["Region"],
        str(row["JobLevel"]),
        str(row["HireDate"]),
        str(row["ManagerID"])
        )

    except Exception as e:

        print("FAILED ROW")
        print("Index:", index)
        print(row)
        print(e)

        break

conn.commit()

cursor.close()
conn.close()

print("Load Completed")