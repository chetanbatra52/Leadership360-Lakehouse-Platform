import pandas as pd
import random

participants = pd.read_csv(
    "data/generated/participants.csv"
)

assessment_ids = [
    "A001",
    "A002",
    "A003",
    "A004",
    "A005"
]

competency_ids = [
    "C001",
    "C002",
    "C003",
    "C004",
    "C005",
    "C006",
    "C007",
    "C008",
    "C009",
    "C010"
]

records = []

for response_id in range(1, 10001):

    records.append({

        "ResponseID": response_id,

        "ParticipantID":
        random.choice(
            participants["ParticipantID"].tolist()
        ),

        "AssessmentID":
        random.choice(
            assessment_ids
        ),

        "CompetencyID":
        random.choice(
            competency_ids
        ),

        "Score":
        random.randint(1, 5),

        "ResponseDate":
        "2024-12-31"
    })

df = pd.DataFrame(records)

print(df.shape)

df.to_csv(
    "data/generated/survey_responses.csv",
    index=False
)

print("Survey responses generated")