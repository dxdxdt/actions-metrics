# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-09-19T19:49:48.595686+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.877 |  |
| ap-east-1 | 0.788 |  |
| ap-east-2 | 0.721 |  |
| ap-northeast-1 | 0.607 |  |
| ap-northeast-2 | 0.706 |  |
| ap-northeast-3 | 0.633 |  |
| ap-south-1 | 0.835 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.888 |  |
| ap-southeast-2 | 0.759 |  |
| ap-southeast-3 | 0.919 |  |
| ap-southeast-4 | 0.807 |  |
| ap-southeast-5 | 0.886 |  |
| ap-southeast-6 | 0.806 |  |
| ap-southeast-7 | 0.968 |  |
| ca-central-1 | 0.113 | 18 |
| ca-west-1 | 0.295 |  |
| eu-central-1 | 0.394 |  |
| eu-central-2 | 0.411 |  |
| eu-north-1 | 0.455 |  |
| eu-south-1 | 0.431 |  |
| eu-south-2 | 0.436 |  |
| eu-west-1 | 0.326 |  |
| eu-west-2 | 0.359 |  |
| eu-west-3 | 0.374 |  |
| il-central-1 | 0.564 |  |
| me-central-1 | 0.792 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.502 |  |
| us-east-1 | 0.063 | 5108 |
| us-east-2 | 0.086 | 1686 |
| us-gov-east-1 | 0.098 | 1919 |
| us-gov-west-1 | 0.297 | 234 |
| us-west-1 | 0.232 | 4126 |
| us-west-2 | 0.297 | 192 |

