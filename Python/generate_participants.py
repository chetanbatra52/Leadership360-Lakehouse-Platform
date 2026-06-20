import pandas as pd
import random
from faker import Faker

fake = Faker()

departments = [
    "Sales",
    "Marketing",
    "Technology",
    "Finance",
    "Operations",
    "HR"
]

regions = [
    "India",
    "APAC",
    "EMEA",
    "Americas"
]

levels = [
    "Associate",
    "Manager",
    "Senior Manager",
    "Director",
    "VP"
]

records = []

for i in range(10000):

    records.append({
        "ParticipantID": f"P{i+1000}",
        "ParticipantName": fake.name(),
        "Department": random.choice(departments),
        "Region": random.choice(regions),
        "JobLevel": random.choice(levels),
        "HireDate": fake.date_between(
            start_date="-8y",
            end_date="today"
        ),
        "ManagerID": f"M{random.randint(100,500)}"
    })

df = pd.DataFrame(records)
# Introduce null regions

for i in range(200):

    idx = random.randint(0, len(df)-1)

    df.loc[idx, "Region"] = None

df.to_csv(
    "data/generated/participants.csv",
    index=False
)

print(df.head())
print(df.shape)