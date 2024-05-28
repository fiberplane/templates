# [PagerDuty Integration Template](./template.jsonnet)

> A template which will expand whenever a PagerDuty incident is triggered

Fiberplane only supports the `incident.triggered` event type at the moment, which means
that the passed JSON payload is guaranteed to be of type `incident`.

Thus, we know which fields are defined in the passed argument `pagerduty_event`
and can be used to extract specific info from the webhook event such as the
affected service, priority etc.
