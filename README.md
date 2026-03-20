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
Updated: 2026-03-20T05:45:38.917722+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.027 |  |
| ap-east-1 | 0.663 |  |
| ap-east-2 | 0.607 |  |
| ap-northeast-1 | 0.486 |  |
| ap-northeast-2 | 0.598 |  |
| ap-northeast-3 | 0.510 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.746 |  |
| ap-southeast-2 | 0.645 |  |
| ap-southeast-3 | 0.799 |  |
| ap-southeast-4 | 0.685 |  |
| ap-southeast-5 | 0.760 |  |
| ap-southeast-6 | 0.707 |  |
| ap-southeast-7 | 0.846 |  |
| ca-central-1 | 0.263 | 16 |
| ca-west-1 | 0.234 |  |
| eu-central-1 | 0.525 |  |
| eu-central-2 | 0.564 |  |
| eu-north-1 | 0.580 |  |
| eu-south-1 | 0.566 |  |
| eu-south-2 | 0.569 |  |
| eu-west-1 | 0.461 |  |
| eu-west-2 | 0.499 |  |
| eu-west-3 | 0.520 |  |
| il-central-1 | 0.714 |  |
| me-central-1 | 0.897 |  |
| me-south-1 | 0.865 |  |
| mx-central-1 | 0.216 |  |
| sa-east-1 | 0.645 |  |
| us-east-1 | 0.195 | 4311 |
| us-east-2 | 0.208 | 1437 |
| us-gov-east-1 | 0.193 | 1590 |
| us-gov-west-1 | 0.170 | 189 |
| us-west-1 | 0.120 | 3265 |
| us-west-2 | 0.170 | 148 |

