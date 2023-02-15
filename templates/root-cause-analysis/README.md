# [Root Cause Analysis (RCA) Template](./template.jsonnet)
> A template that can be used and / or altered to provide a consistent Root Cause Analaysis process based on best practice

## Template Documentation

### Template Arguments
The template has three arguments which can be used to provide context for the RCA, which can be provided as arguments when this notebook is create. These are:
- `incidentTitle` - This is the title of the incident that this RCA has been created for. This will be used as part of the notebook title, alongside the `incidentNumber`. Default value is an empty string
- `incidentNumber` - This is the incident number for the incident that this RCA has been created for. This will be used as part of the notebook title, alongside `incidentTitle`. Default value is an empty string
- `incidentCommander` - This is the name of the incident commander leading this RCA. This should ideally be the person who managed the incident. This person is identified as leading the RCA at the top of the notebook.

The title of the notebook has the following format:
`'RCA for Incident' + incidentTitle + ' ' + incidentNumber`
e.g:
`incidentTitle = Sample Incident`
`incidentNumber = 1234`
`incidentCommander = incidentPerson1`

`RCA for Incident Sample Incident 1234`

### Time Range
The template defaults to the last hour. Change the value of `.setTimeRangeRelative(minutes=60)` to edit this
