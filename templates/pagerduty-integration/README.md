# [PagerDuty Integration Template](./template.jsonnet)

> A template which will expand whenever a PagerDuty incident is triggered

Fiberplane only supports the `incident.triggered` event type at the moment, which means
that the passed JSON payload is guaranteed to be of type `incident`.

Thus, we know which fields are defined in the passed argument `pagerduty_event`
and can be used to extract specific info from the webhook event such as the
affected service, priority etc.

You can validate your template using our CLI:

```bash
fp templates validate ./template.jsonnet "{\"pagerduty_event\":{\"data\":{\"number\":1,\"title\":\"we got a problem\!\",\"id\":\"not provided\",\"html_url\":\"https://example.com\",\"service\":{\"summary\":\"api\"}}}}"
```

You can modify the last argument to fit the payload that you expect to receive and which fields you actually use in the template.
