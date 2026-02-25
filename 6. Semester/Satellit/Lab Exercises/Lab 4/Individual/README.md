# Output Description
The output of the program is a json file in the same format as the input but with only `MAX_PASSES_PER_DAY` passes. The passes are selected based on the following constraints:
* No overlap
* No duration below `MIN_DURATION_MINUTES`
* Sorted by the decision rule **Earliest finish time first**

An example of the output for `MAX_PASSES_PER_DAY = 3` would be:

```json
{
  "satellite_id": "Sentinel-1A",
  "date": "2026-02-18",
  "scheduled_passes": [
    {
      "pass_id": "P1",
      "start_time": "2026-02-18T05:30:00Z",
      "end_time": "2026-02-18T05:42:00Z"
    },
    {
      "pass_id": "P3",
      "start_time": "2026-02-18T06:10:00Z",
      "end_time": "2026-02-18T06:25:00Z"
    },
    {
      "pass_id": "P5",
      "start_time": "2026-02-18T07:00:00Z",
      "end_time": "2026-02-18T07:15:00Z"
    }
  ]
}
```