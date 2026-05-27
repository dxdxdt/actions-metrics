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
Updated: 2026-05-27T02:40:42.105580+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.042 |  |
| ap-east-1 | 0.649 |  |
| ap-east-2 | 0.585 |  |
| ap-northeast-1 | 0.464 |  |
| ap-northeast-2 | 0.569 |  |
| ap-northeast-3 | 0.492 |  |
| ap-south-1 | 0.894 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.727 |  |
| ap-southeast-2 | 0.632 |  |
| ap-southeast-3 | 0.780 |  |
| ap-southeast-4 | 0.673 |  |
| ap-southeast-5 | 0.742 |  |
| ap-southeast-6 | 0.667 |  |
| ap-southeast-7 | 0.825 |  |
| ca-central-1 | 0.284 | 16 |
| ca-west-1 | 0.199 |  |
| eu-central-1 | 0.550 |  |
| eu-central-2 | 0.580 |  |
| eu-north-1 | 0.597 |  |
| eu-south-1 | 0.589 |  |
| eu-south-2 | 0.589 |  |
| eu-west-1 | 0.474 |  |
| eu-west-2 | 0.518 |  |
| eu-west-3 | 0.528 |  |
| il-central-1 | 0.716 |  |
| me-central-1 | 0.989 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.258 |  |
| sa-east-1 | 0.675 |  |
| us-east-1 | 0.220 | 4689 |
| us-east-2 | 0.222 | 1611 |
| us-gov-east-1 | 0.211 | 1706 |
| us-gov-west-1 | 0.146 | 195 |
| us-west-1 | 0.107 | 3609 |
| us-west-2 | 0.148 | 161 |

