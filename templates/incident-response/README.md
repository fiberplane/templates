# [Incident Response Template](./template.jsonnet)
> A template that can be used and / or altered to provide a consistent response to incidents based on best practice

## Template Documentation

### Template Arguments
The template has three arguments which can be used to provide context for the incident, based on the alert trigger. These are:
- `alertTitle` - This will populate the title of the notebook. Default value is `_Incident Template - This title will be populated by the alert name_`
- `alertSeverity` - This will populate the 'Severity' cell. Default value is an empty string
- `alertSummary` - This will populate the text cell beneath the 'Summary:' heading. Default value is `_Alert summary plus any other information you need to describe the incident_`

### Time Range
The template defaults to the last hour. Change the value of `.setTimeRangeRelative(minutes=60)` to edit this
