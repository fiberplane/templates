# [Trigger Example Template](./template.jsonnet)

> A template to showcase how to work with Fiberplane Triggers

## Template Documentation

### Template Arguments

The template has several arguments which can be used to provide context for the
incident, based on the alert trigger. These are:

- `triggerUrl` - Webhook URL of the trigger.
- `json` - JSON payload of the trigger.
- `timestamp` - Timestamp at which the command was triggered.
- `query` - An example Prometheus query passed by the trigger.
