local fp = import 'fiberplane.libsonnet';
local c = fp.cell;
local fmt = fp.format;

function(
  alertTitle='<Incident Template - This title will be populated by the alert name>',
  alertSummary='<Alert summary plus any other information you need to describe the incident>',
  alertSeverity='',
)
  fp.notebook
  .new(alertTitle)
  .setTimeRangeRelative(minutes=60)
  .addLabels({
    'notebook-type': 'Incident',
    'incident-status': 'Open',
  })
  .addCells([
    c.h1('Status: Open'),
    c.text(fmt.italics("As the notebook is created at the start of a new incident, the status defaults to Open. Change this as you move through the incident lifecycle. Example status' are: Open / Resolved / Mitigated / Observing")),
    c.h1('Severity: ' + alertSeverity),
    c.h1('Summary:', readOnly=true),
    c.text(alertSummary),
    c.h1('Impact:', readOnly=true),
    c.text(fmt.italics('describe the impact of the incident. Is a service completely down? Are you seeing partial failures? Try and be as specific as possible e.g 25% of users trying to log in to the website are getting errors. NOTE - this may need to be updated as the incident evolves')),
    c.h1('Participants:', readOnly=true),
    c.unorderedList([
      fmt.bold('Incident Commander: ').italics('name of the person leading the incident goes here'),
      fmt.bold('Role 1: ').italics("list all the people involved in this incident and the role they're performing here:"),
      fmt.bold('Role 2: ').italics('...'),
    ]),
    c.h1('Actions:', readOnly=true),
    c.checkbox(fmt.italics('an open action created as part of this incident investigation and resolution')),
    c.h1('Timeline:', readOnly=true),
    c.unorderedList([
      fmt.italics('Time when incident started'),
      fmt.italics('Time when incident was detected'),
      fmt.italics("all major updates to the incident ordered chronologically, in the format 'Timestamp - incident'"),
    ]),
    c.divider(readOnly=true),
    c.h1('Incident Analysis:', readOnly=true),
    c.text(fmt.italics('Incident resolution requires a process to systematically work through different hypothesis as to what the problem is, and therefore how you can resolve it. Multiple theories can be worked in parallel, especially if there are multiple people / teams working an incident.')),
    c.h2('Theory one is that:'),
    c.text(fmt.italics('Insert a possible explanation for this incident here e.g Our API server is down')),
    c.h3('We can disprove this by...'),
    c.text(fmt.italics('provide a means to disprove this explanation e.g We can see our API server processing requests')),
    c.h3('Evidence:'),
    c.text(fmt.italics('Display evidence to support or disprove this theory e.g a promQL query that displays a graph showing the API server processing requests. Explain the evidence and provide context so that someone else can understand what the evidence is telling them. It may be that data is required from multiple sources or even multiple teams in which case provide each bit in turn with an explanation beneath in a text cell')),
    c.h3('Conclusion:'),
    c.text(fmt.italics('Decide whether this theory is proven and you understand the nature of this incident, needs further analysis (add an action at the top!), or is disproven in which case move onto theory two...')),
    c.divider(readOnly=true),
    c.h2('Theory two is that:'),
    c.text(''),
    c.h3('We can disprove this by...'),
    c.text(''),
    c.h3('Evidence:'),
    c.text(''),
    c.h3('Conclusion:'),
    c.text(''),
    c.divider(readOnly=true),
    c.h1('Resolution:', readOnly=true),
    c.text(fmt.italics('If / when an incident is resolved, describe what the actual problem was and how it was resolved here. More detail is better! Each incident is an opportunity to learn for you and your team so the more information you can include, the more learning can be had by all!')),
  ])
