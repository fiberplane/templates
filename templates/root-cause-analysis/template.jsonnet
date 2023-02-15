local fp = import 'fiberplane.libsonnet';
local c = fp.cell;
local fmt = fp.format;

function(
  incidentTitle='',
  incidentNumber='',
  incidentCommander='',
)
  fp.notebook
  .new('RCA for Incident: ' + incidentTitle + ' ' + incidentNumber)
  .setTimeRangeRelative(minutes=60)
  .addCells([
    c.text('Incident Commander: ' + incidentCommander),
    c.h1('The Issue', readOnly=true),
    c.text(fmt.italics('provide a description of the incident that occurred here. Add any images and queries to your monitoring services below to better illustrate the issue.')),
    c.h1('RCA investigation (The five whys)', readOnly=true),
    c.text(fmt.italics('use the five whys method to dig into how this issue occurred. Starting at a high level, ask why the incident occurred. Keep it factual and AVOID BLAME! We want to know why the event occurred in a technical sense.')),
    c.h3('Why did this incident occur?'),
    c.text(fmt.italics('A description of why this incident occurred, the event that caused the incident')),
    c.h3('Why did this event occur?'),
    c.text(fmt.italics('The second why. Drill into why this event occurred or how this event happened')),
    c.h3(fmt.italics("The third why? Replace this with an actual 'why' question that asks why the answer to the second why happened")),
    c.text(fmt.italics('an answer to the third why')),
    c.h3(fmt.italics("The fourth why? Replace this with an actual 'why' question that asks why the answer to the third why happened")),
    c.text(fmt.italics('an answer to the fourth why')),
    c.h3(fmt.italics("The fifth why? Replace this with an actual 'why' question that asks why the answer to the fourth why happened")),
    c.text(fmt.italics('an answer to the fifth why. By now hopefully you are getting to the root causes, the events that took place that created the incident. It is rare for there to be a single reason, but hopefully the reasons for the incident can be found in the answer to these five why questions. If not, feel free to ask more questions!')),
    c.h1('Root Cause', readOnly=true),
    c.text(fmt.italics('use this section to summarise in bullet points the reasons for the incident, as exposed by the series of questions above')),
    c.orderedList([
      fmt.italics('the primary, or most impactful cause of the incident'),
      fmt.italics('the secondary cause'),
      fmt.italics('all other causes'),
    ]),
    c.h1('Resolution', readOnly=true),
    c.text(fmt.italics('describe the action taken to resolve this incident. Someone reading this should know what to do to resolve an incident if a repeat incident occurs')),
    c.unorderedList([
      fmt.italics('bullet point the actions if there were more than one'),
    ]),
    c.h1('Post Mortem considerations:', readOnly=true),
    c.text(fmt.italics('This RCA document is a completely factual document. If this was an incident that warrants a post mortem to look at what you can learn from it, and what improvements can be made then this should be held as a separate meeting at a later date once this RCA document has been distributed and digested by everyone. Use this section to bullet point anything that comes up as part of this RCA that perhaps should be discussed in that later meeting')),
    c.unorderedList([
      fmt.italics('A thing you might want to look into as a learning opportunity in the post mortem meeting'),
      fmt.italics('Another thing you might want to look into as a learning opportunity in the post mortem meeting'),
      fmt.italics('Another thing for discussion and so on...'),
    ]),
    c.h2('Timeline:', readOnly=true),
    c.text(fmt.italics('A factual sequence of events. This should all be available in the notebook created for this incident. Start with when the incident started, then when it was discovered and continue through all the major events that took place in the incident. Each item should be of the format <time + date event occurred>: <Description of event>. Do use queries and pictures to better describe any event')),
    c.unorderedList([
      fmt.italics('<Date and time>: Incident started. Add in what actually happened at this time to start the incident e.g The API server started returning errors'),
      fmt.italics('<Date and time>: The event was discovered. How did this happen? Was an alert triggered? Did a user complain?'),
      fmt.italics('<Date and time>: Continue through the sequence of events'),
    ]),
  ])
