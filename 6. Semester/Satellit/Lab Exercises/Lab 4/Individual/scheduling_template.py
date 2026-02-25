""""
Individual Lab 4 — Scheduling & Flight Plan

You must:
- Apply all constraints
- Implement one decision rule
- Produce flight_plan.json
"""

import json
from datetime import datetime
import pandas as pd

MIN_DURATION_MINUTES = 8
MAX_PASSES_PER_DAY = 3


def parse_time(ts):
    return datetime.strptime(ts, "%Y-%m-%dT%H:%M:%SZ")


def duration_minutes(start, end):
    return (end - start).total_seconds() / 60


def load_passes(filename):
    with open(filename, "r") as f:
        data = json.load(f)

    return data["satellite_id"], data["date"], data["passes"]


def filter_valid_passes(passes):
    """
    You must:
    - Reject passes where end <= start
    - Reject passes with duration < MIN_DURATION_MINUTES
    """

    valid = []

    for p in passes:
        start = parse_time(p["start_time"])
        end = parse_time(p["end_time"])

        if end <= start:
            continue
        if duration_minutes(start, end) < MIN_DURATION_MINUTES:
            continue
        
        valid.append(p)

    return valid


def schedule_passes(passes):
    """
    You must:
    - Choose and implement ONE decision rule
    - Ensure no overlapping passes
    - Respect MAX_PASSES_PER_DAY
    """
    scheduled = []

    df = pd.DataFrame(passes)
    df["end_time"] = pd.to_datetime(df["end_time"])
    df = df.sort_values(by="end_time")
    df["end_time"] = df["end_time"].dt.strftime("%Y-%m-%dT%H:%M:%SZ")
    parsed = json.loads(df.to_json(orient="records"))

    scheduled.append(parsed[0])
    for p in parsed[1:]:
        if len(scheduled) == MAX_PASSES_PER_DAY:
            break
        if parse_time(p["start_time"]) <= parse_time(scheduled[-1]["end_time"]):
            continue
        scheduled.append(p)

    return scheduled


def generate_flight_plan(satellite_id, date, scheduled_passes):
    """
    Output format must match specification.
    """
    flight_plan = {
        "satellite_id": satellite_id,
        "date": date,
        "scheduled_passes": scheduled_passes
    }

    return flight_plan


def main():
    satellite_id, date, passes = load_passes("official_passes.json")

    valid_passes = filter_valid_passes(passes)
    scheduled = schedule_passes(valid_passes)

    flight_plan = generate_flight_plan(
        satellite_id,
        date,
        scheduled
    )

    with open("flight_plan.json", "w") as f:
        json.dump(flight_plan, f, indent=2)

    print("Flight plan generated.")


if __name__ == "__main__":
    main()
