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
Updated: 2026-11-14T08:22:36.517251+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.727 |  |
| ap-east-1 | 0.549 |  |
| ap-east-2 | 0.498 |  |
| ap-northeast-1 | 0.415 |  |
| ap-northeast-2 | 0.486 |  |
| ap-northeast-3 | 0.428 |  |
| ap-south-1 | 0.639 |  |
| ap-south-2 | 0.655 |  |
| ap-southeast-1 | 0.605 |  |
| ap-southeast-2 | 0.545 |  |
| ap-southeast-3 | 0.642 |  |
| ap-southeast-4 | 0.601 |  |
| ap-southeast-5 | 0.615 |  |
| ap-southeast-6 | 0.558 |  |
| ap-southeast-7 | 0.674 |  |
| ca-central-1 | 0.132 | 18 |
| ca-west-1 | 0.154 |  |
| eu-central-1 | 0.353 |  |
| eu-central-2 | 0.367 |  |
| eu-north-1 | 0.390 |  |
| eu-south-1 | 0.371 |  |
| eu-south-2 | 0.361 |  |
| eu-west-1 | 0.292 |  |
| eu-west-2 | 0.318 |  |
| eu-west-3 | 0.333 |  |
| il-central-1 | 0.481 |  |
| me-central-1 | 0.618 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.651 |  |
| mx-central-1 | 0.194 |  |
| sa-east-1 | 0.434 |  |
| us-east-1 | 0.097 | 5184 |
| us-east-2 | 0.119 | 1727 |
| us-gov-east-1 | 0.123 | 1960 |
| us-gov-west-1 | 0.171 | 247 |
| us-west-1 | 0.157 | 4216 |
| us-west-2 | 0.166 | 197 |

