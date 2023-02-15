local fp = import 'fiberplane.libsonnet';
local c = fp.cell;
local fmt = fp.format;

local templateCode = |||
  local fp = import 'fiberplane.libsonnet';
  local c = fp.cell;
  local fmt = fp.format;

  function(triggerUrl='', json={}, timestamp='2022-11-16T15:31:26Z', query='')
    fp.notebook.new('Example trigger-created notebook')
    .addLabels({ onboarding: '' })
    .addCells([
      c.text('We created this notebook from the Webhook post request you just sent to:'),
      c.text(fmt.link(triggerUrl, null)),
      c.text('Here is the data that we received from the Webhook:'),
      c.h3(['The ', fmt.code('json'), ' parameter:'],),
      c.code(std.manifestJsonEx(json, '  '), syntax="json"),
      c.h3(['The ', fmt.code('timestamp'), ' parameter:'],),
      c.text(['The command was run on ', fmt.timestamp(timestamp)]),
      c.h3(['The ', fmt.code('query'), ' parameter:'],),
      c.prometheus(query),
      c.text('As you can see, we can use the data from the Webhook to create a notebook that is tailored to the specific alert that triggered it.'),
      c.divider(),
      c.text("In case you're curious, here is the template code that generated this notebook:"),
      c.code("// Redacted for recursion's sake ;)"),
      c.divider(),
      c.h2('Next steps'),
      c.text([
        'Try and modify anything in the initial ',
        fmt.code('curl'),
        ' command that you posted and run it again. See how the generated notebook changes accordingly.',
      ]),
      c.text('You can use Webhook triggers to create powerful workflows in Fiberplane. Create a template with a Webhook trigger, attach the URL to your alert manager and use Fiberplane to create incident or deploy runbooks.'),
      c.text([
        'Learn more about Webhook Triggers on our docs site at: ',
        fmt.link('https://docs.fiberplane.com/templates/working-with-triggers', null),
      ]),
      c.text('If you have any questions - shoot us a message at support@fiberplane.com or by opening up the chatbox in the bottom right!'),
    ])
|||;

function(
  triggerUrl='',
  json={},
  timestamp='2022-11-16T15:31:26Z',
  query=''
)
  fp.notebook.new('Example trigger-created notebook 📟')
  .addLabels({ onboarding: '' })
  .addCells([
    c.text('We created this notebook from the Webhook post request you just sent to:'),
    c.text(fmt.link(triggerUrl, null)),
    c.text('Here is the data that we received from the Webhook:'),
    c.h3(['The ', fmt.code('json'), ' parameter:'],),
    c.code(std.manifestJsonEx(json, '  '), stynax='json'),
    c.h3(['The ', fmt.code('timestamp'), ' parameter:'],),
    c.text(['The command was run on ', fmt.timestamp(timestamp)]),
    c.h3(['The ', fmt.code('query'), ' parameter:'],),
    c.prometheus(query),
    c.text('As you can see, we can use the data from the Webhook to create a notebook that is tailored to the specific alert that triggered it.'),
    c.divider(),
    c.text("In case you're curious, here is the template code that generated this notebook:"),
    c.code(templateCode),
    c.divider(),
    c.h2('Next steps'),
    c.text([
      'Try and modify anything in the initial ',
      fmt.code('curl'),
      ' command that you posted and run it again. See how the generated notebook changes accordingly.',
    ]),
    c.text('You can use Webhook triggers to create powerful workflows in Fiberplane. Create a template with a Webhook trigger, attach the URL to your alert manager and use Fiberplane to create incident or deploy runbooks.'),
    c.text([
      'Learn more about Webhook Triggers on our docs site at: ',
      fmt.link('https://docs.fiberplane.com/templates/working-with-triggers', null),
    ]),
    c.text('If you have any questions - shoot us a message at support@fiberplane.com or by opening up the chatbox in the bottom right!'),
  ])
