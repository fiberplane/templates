local fp = import 'fiberplane.libsonnet';
local c = fp.cell;
local fmt = fp.format;

function(
  title='Prometheus query (PromQL) examples to understand Kubernetes health'
)
  fp.notebook
  .new(title)
  .setTimeRangeRelative(minutes=120)
  .addLabels({
    promql: '',
    kubernetes: '',
    type: 'starter',
  })
  .addCells([
    c.h1('Pod & container metrics'),
    c.h3('Number of pods per namespace'),
    c.provider(
      title='Count of pods per namespace',
      intent='prometheus,timeseries',
      queryData='application/x-www-form-urlencoded,query=sum+by+%28namespace%29+%28kube_pod_info%29',
    ),
    c.h3('Unhealthy pods'),
    c.provider(
      title='',
      intent='prometheus,timeseries',
      queryData='application/x-www-form-urlencoded,query=min_over_time%28sum+by+%28namespace%2C+pod%29+%28kube_pod_status_phase%7Bphase%3D%7E%22Pending%7CUnknown%7CFailed%22%7D%29%5B15m%3A1m%5D%29+%3E+0',
    ),
    c.h3('Pods CrashLooping'),
    c.provider(
      title='',
      intent='prometheus,timeseries',
      queryData='application/x-www-form-urlencoded,query=increase%28kube_pod_container_status_restarts_total%5B15m%5D%29+%3E+3',
    ),
    c.h3('Containers with no CPU Limits set'),
    c.provider(
      title='',
      intent='prometheus,timeseries',
      queryData='application/x-www-form-urlencoded,query=count+by+%28namespace%29%28sum+by+%28namespace%2Cpod%2Ccontainer%29%28kube_pod_container_info%7Bcontainer%21%3D%22%22%7D%29+unless+sum+by+%28namespace%2Cpod%2Ccontainer%29%28kube_pod_container_resource_limits%7Bresource%3D%22cpu%22%7D%29%29',
    ),
    c.h1('Node metrics'),
    c.h3('Number of Nodes that are ready'),
    c.provider(
      title='',
      intent='prometheus,timeseries',
      queryData='application/x-www-form-urlencoded,query=sum%28kube_node_status_condition%7Bcondition%3D%22Ready%22%2C+status%3D%22true%22%7D%3D%3D1%29',
    ),
    c.h3('Number of nodes that are Unstable '),
    c.provider(
      title='',
      intent='prometheus,timeseries',
      queryData='application/x-www-form-urlencoded,query=sum%28changes%28kube_node_status_condition%7Bstatus%3D%22true%22%2Ccondition%3D%22Ready%22%7D%5B15m%5D%29%29+by+%28node%29+%3E+2',
    ),
    c.h3('CPU available per node for scheduling'),
    c.provider(
      title='',
      intent='prometheus,timeseries',
      queryData='application/x-www-form-urlencoded,query=sum+by+%28node%29+%28kube_node_status_allocatable_cpu_cores%29',
    ),
    c.h3('Memory available per node for scheduling'),
    c.provider(
      title='',
      intent='prometheus,timeseries',
      queryData='application/x-www-form-urlencoded,query=sum+by+%28node%29+%28kube_node_status_allocatable_memory_bytes%29',
    ),
    c.h3('Disk space usage per node '),
    c.provider(
      title='',
      intent='prometheus,timeseries',
      queryData='application/x-www-form-urlencoded,query=sum+by+%28kubernetes_node%2C+mountpoint%29+%28100+-+%28%28node_filesystem_avail_bytes+*+100%29+%2F+%28node_filesystem_size_bytes%29%29%29',
    ),
    c.h1('Cluster metrics'),
    c.h3('CPU overcommit '),
    c.text('(If this query returns a positive value, then the cluster has overcommitted the CPU)'),
    c.provider(
      title='',
      intent='prometheus,timeseries',
      queryData='application/x-www-form-urlencoded,query=sum%28kube_pod_container_resource_limits%7Bresource%3D%22cpu%22%7D%29+-+sum%28kube_node_status_capacity%7Bresource%3D%22cpu%22%7D%29',
    ),
    c.h3('Memory overcommit'),
    c.text('(If this query returns a positive value, then cluster has overcommitted the memory)'),
    c.provider(
      title='',
      intent='prometheus,timeseries',
      queryData='application/x-www-form-urlencoded,query=sum%28kube_pod_container_resource_limits%7Bresource%3D%22memory%22%7D%29+-+sum%28kube_node_status_capacity%7Bresource%3D%22memory%22%7D%29',
    ),
    c.h3('CPU idle by cluster'),
    c.provider(
      title='',
      intent='prometheus,timeseries',
      queryData='application/x-www-form-urlencoded,query=sum%28%28rate%28container_cpu_usage_seconds_total%7Bcontainer%21%3D%22POD%22%2Ccontainer%21%3D%22%22%7D%5B30m%5D%29+-+on+%28namespace%2Cpod%2Ccontainer%29+group_left+avg+by+%28namespace%2Cpod%2Ccontainer%29%28kube_pod_container_resource_requests%7Bresource%3D%22cpu%22%7D%29%29+*+-1+%3E0%29',
    ),
    c.h3('Memory idle by cluster'),
    c.provider(
      title='',
      intent='prometheus,timeseries',
      queryData='application/x-www-form-urlencoded,query=sum%28%28container_memory_usage_bytes%7Bcontainer%21%3D%22POD%22%2Ccontainer%21%3D%22%22%7D+-+on+%28namespace%2Cpod%2Ccontainer%29+avg+by+%28namespace%2Cpod%2Ccontainer%29%28kube_pod_container_resource_requests%7Bresource%3D%22memory%22%7D%29%29+*+-1+%3E0+%29+%2F+%281024*1024*1024%29',
    ),
  ])
