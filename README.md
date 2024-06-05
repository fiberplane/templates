# Templates

> Use-case-specific community templates

This repository contains example templates for various use cases, for and by the
Fiberplane community.

Do you have a template to share? Please see [CONTRIBUTING.md](CONTRIBUTING.md)
for more information.

## Overview

Fiberplane Templates are built with the [Jsonnet](https://jsonnet.org/) data
templating language.

Are you looking for our template engine? It is hosted in our
shared [fiberplane repository](fp-templates).

## Quickstart

The [Fiberplane CLI](https://github.com/fiberplane/fp) is the recommended way to
interact with templates (see the
[docs](https://fiberplane.com/docs/templates/) or run `fp help templates`).

## Structure of a Template

Most Fiberplane Templates export a Jsonnet function that accepts some parameters
and creates a notebook using the helper functions provided by the Fiberplane
Jsonnet library.

```jsonnet
local fp = import 'fiberplane.libsonnet';
local c = fp.cell;
local fmt = fp.format;

// Parameters are named and can have default values
function(incidentName='API Outage')
  fp.notebook
    .new('Incident Response for: ' + incidentName)
    .setTimeRangeRelative(minutes=60)
    .addCells([
      // The library exposes helper functions for creating every cell type
      c.h1('Heading'),
      c.text(
        // There are also helper functions for formatting text
        fmt.bold('Hello World!')
      )
    ])
```

# Example Templates

- [Incident Response](/templates/incident-response)
- [Root Cause Analysis](templates/root-cause-analysis)
- [Incident Analysis](templates/incident-analysis)
- [Postmortem](templates/postmortem)
- [Meeting Notes](templates/meeting-notes)
- [Kubernetes Sample](templates/kubernetes-sample)
- [Trigger Example](templates/trigger-example)
- [PagerDuty Integration](templates/pagerduty-integration)

Want to contribute or request a template for another use case?
[Open an issue!](https://github.com/fiberplane/templates/issues/new/choose)

## Template API

Please see our [Template API Reference](template-api).

## Getting Help

Please see [COMMUNITY.md](fp-com) for ways to reach out to us.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## Code of Conduct

See [CODE_OF_CONDUCT.md](fp-coc).

## License

Our templates are distributed under the terms of both the MIT license and the
Apache License (Version 2.0).

See [LICENSE-APACHE](LICENSE-APACHE) and [LICENSE-MIT](LICENSE-MIT).

[fp-com]: https://github.com/fiberplane/fiberplane/blob/main/COMMUNITY.md
[fp-coc]: https://github.com/fiberplane/fiberplane/blob/main/CODE_OF_CONDUCT.md
[fp-templates]: https://github.com/fiberplane/fiberplane/blob/main/fiberplane-templates
[template-api]: https://docs.fiberplane.com/reference/templates-api
