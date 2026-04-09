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
Updated: 2026-04-09T15:15:21.804439+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.875 |  |
| ap-east-1 | 0.805 |  |
| ap-east-2 | 0.740 |  |
| ap-northeast-1 | 0.629 |  |
| ap-northeast-2 | 0.730 |  |
| ap-northeast-3 | 0.648 |  |
| ap-south-1 | 0.841 |  |
| ap-south-2 | 0.925 |  |
| ap-southeast-1 | 0.883 |  |
| ap-southeast-2 | 0.814 |  |
| ap-southeast-3 | 0.955 |  |
| ap-southeast-4 | 0.848 |  |
| ap-southeast-5 | 0.901 |  |
| ap-southeast-6 | 0.879 |  |
| ap-southeast-7 | 0.989 |  |
| ca-central-1 | 0.102 | 16 |
| ca-west-1 | 0.291 |  |
| eu-central-1 | 0.387 |  |
| eu-central-2 | 0.404 |  |
| eu-north-1 | 0.442 |  |
| eu-south-1 | 0.414 |  |
| eu-south-2 | 0.421 |  |
| eu-west-1 | 0.314 |  |
| eu-west-2 | 0.344 |  |
| eu-west-3 | 0.367 |  |
| il-central-1 | 0.560 |  |
| me-central-1 | 0.754 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.483 |  |
| us-east-1 | 0.054 | 4466 |
| us-east-2 | 0.091 | 1489 |
| us-gov-east-1 | 0.084 | 1636 |
| us-gov-west-1 | 0.309 | 192 |
| us-west-1 | 0.269 | 3382 |
| us-west-2 | 0.310 | 154 |

