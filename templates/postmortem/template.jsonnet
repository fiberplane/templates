local fp = import 'fiberplane.libsonnet';
local c = fp.cell;
local fmt = fp.format;

function(
  incidentId='Incident ID',
  incidentTitle='Incident Title',
  environment='environment-name',
  service='service-name',
)
  fp.notebook
  .new('Postmortem: ' + incidentId + ' - ' + incidentTitle)
  .setTimeRangeRelative(minutes=60)
  .addLabels({
    postmortem: '',
    environment: environment,
    service: service,
    type: 'postmortem',
  })
  .addCells([
    c.h1('Incident Overview'),
    c.text(),
    c.h1('Impact'),
    c.text(),
    c.h1('Fix'),
    c.text(),
    c.divider(),
    c.h1('Contributing factors'),
    c.text(),
    c.h1('What did we learn?'),
    c.text(),
    c.h1('Actions'),
    c.listItem.unordered('Action 1'),
    c.listItem.unordered('Action 2...'),
    c.divider(),
    c.h1('Timeline'),
    c.text(),
  ])
