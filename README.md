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
Updated: 2026-03-16T15:58:43.352828+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.949 |  |
| ap-east-1 | 0.734 |  |
| ap-east-2 | 0.672 |  |
| ap-northeast-1 | 0.546 |  |
| ap-northeast-2 | 0.664 |  |
| ap-northeast-3 | 0.580 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.809 |  |
| ap-southeast-2 | 0.712 |  |
| ap-southeast-3 | 0.877 |  |
| ap-southeast-4 | 0.752 |  |
| ap-southeast-5 | 0.825 |  |
| ap-southeast-6 | 0.754 |  |
| ap-southeast-7 | 0.919 |  |
| ca-central-1 | 0.185 | 16 |
| ca-west-1 | 0.258 |  |
| eu-central-1 | 0.453 |  |
| eu-central-2 | 0.486 |  |
| eu-north-1 | 0.526 |  |
| eu-south-1 | 0.490 |  |
| eu-south-2 | 0.491 |  |
| eu-west-1 | 0.397 |  |
| eu-west-2 | 0.419 |  |
| eu-west-3 | 0.441 |  |
| il-central-1 | 0.645 |  |
| me-central-1 | 0.834 |  |
| me-south-1 | 0.794 |  |
| mx-central-1 | 0.249 |  |
| sa-east-1 | 0.564 |  |
| us-east-1 | 0.130 | 4290 |
| us-east-2 | 0.154 | 1429 |
| us-gov-east-1 | 0.154 | 1577 |
| us-gov-west-1 | 0.234 | 186 |
| us-west-1 | 0.195 | 3242 |
| us-west-2 | 0.235 | 148 |

