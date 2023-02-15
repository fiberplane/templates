# [Kubernetes Sample Template](./template.jsonnet)

> A template to showcase how to work with Kubernetes

This template includes some example queries to understand Kubernetes health. It
gives metrics pertaining to Pods, Containers, Nodes and Clusters which are vital
in understanding the health of any kubernetes deployment.

## Template Documentation

### Template Arguments

The template acceps a single argument:

- `title` - The title to use for the notebook.

### Time Range

The template defaults to the last two hours. Change the value of
`.setTimeRangeRelative(minutes=120)` to edit this.
