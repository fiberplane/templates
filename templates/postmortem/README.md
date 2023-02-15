# [Postmortem Template](./template.jsonnet)

> A template to structure postmortems

This template splits the notebook into sections:

- an overview of the incident
- an investigation into the causes of the incident and what can be learnt
- a timeline of the incident

## Template Documentation

### Template Arguments

The template has several arguments which can be used to provide context for the
incident, based on the alert trigger. These are:

- `incidentId` - An identifier for the incident.
- `incidentTitle` - Together with the `incidentId`, this will determine the
  title of the notebook.
- `serviceName` - Name of the service that caused the incident.
- `environmentName` - The environment in which the incident occurred.

### Time Range

The template defaults to the last hour. Change the value of
`.setTimeRangeRelative(minutes=60)` to edit this.
