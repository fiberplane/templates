local fp = import 'fiberplane.libsonnet';
local c = fp.cell;
local fmt = fp.format;

function(
  incidentId='Incident ID',
  incidentTitle='Incident Title',
  serviceName='service-name',
  environmentName='environment-name',
  severity='low',
  status='open'
)
  fp.notebook
  .new(incidentId + ' - ' + incidentTitle)
  .setTimeRangeRelative(minutes=60)
  .addLabels({
    service: serviceName,
    environment: environmentName,
    status: status,
    severity: severity,
    type: 'incident',
  })
  .addCells([
    c.h1('Impact'),
    c.text(''),
    c.h1('Overview'),
    c.h1('Participants'),
    c.checkbox('Incident Commander', checked=false),
    c.checkbox('Role 1', checked=false),
    c.checkbox([fmt.bold(['Role 2: '])], checked=false),
    c.h1('Actions'),
    c.checkbox('Action 1', checked=false),
    c.checkbox('Action 2 ', checked=false),
    c.checkbox('...', checked=false),
    c.h1('Timeline'),
    c.text(''),
    c.divider(),
    c.h1('Incident Investigation'),
    c.h2('Theory one is that...'),
    c.text(''),
    c.h3('we think this because...'),
    c.text(''),
    c.h3('We can disprove this by...'),
    c.text(''),
    c.h3('Evidence'),
    c.text(''),
    c.h3('Conclusion'),
    c.h3(''),
    c.divider(),
    c.h1('Resolution'),
    c.text(''),
  ])
