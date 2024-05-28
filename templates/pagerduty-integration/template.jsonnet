// For documentation on Fiberplane Templates, see: https://docs.fiberplane.com/docs/templates
local fp = import 'fiberplane.libsonnet';
local c = fp.cell;
local fmt = fp.format;
local fm = fp.frontMatter;

function(
  incident_id='no incident provided',
  pagerduty_frontmatter={},
  pagerduty_event={},
)
  fp.notebook
  .new('PagerDuty incident #' + pagerduty_event.data.number)
  .addFrontMatter(
    fm.pagerdutyIncident(pagerduty_frontmatter) // This will add this PagerDuty event, formatted as FrontMatter, to the notebooks front matter
  )
  .addCells([
    c.h1(pagerduty_event.data.title + ' (PagerDuty incident)'), // you can access specific webhook payload items by using the dot notation
    c.text('A PagerDuty incident was triggered. The incident ID is:'),
    c.code(incident_id, 'text'),

    c.text('Service ' + pagerduty_event.data.service.summary + ' has a problem!'),
    c.text(fmt.link('See on PagerDuty', pagerduty_event.data.html_url)),
  ])
