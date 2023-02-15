# [Incident Response Template](./template.jsonnet)

> A template that can be used and / or altered to provide a consistent response
> to incidents based on best practice

This template provides a structure for investigating an incident. It focuses on
a hypothesis-driven investigation technique that helps give context to the
investigation for people to follow during the investigation.

This also allows for greater learning after the incident by providing better
understanding of why actions were taken.

## Template Documentation

### Template Arguments

The template has several arguments which can be used to provide context for the
incident, based on the alert trigger. These are:

- `incidentId` - An identifier for the incident.
- `incidentTitle` - Together with the `incidentId`, this will determine the
  title of the notebook.
- `serviceName` - Name of the service that caused the incident.
- `environmentName` - The environment in which the incident occurred.
- `severity` - Severity of the incident, defaults to "low".
- `status` - Whether the incident is resolved or ongoing. Defaults to "open".

### Time Range

The template defaults to the last hour. Change the value of
`.setTimeRangeRelative(minutes=60)` to edit this.
