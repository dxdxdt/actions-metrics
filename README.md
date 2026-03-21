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
Updated: 2026-03-21T14:20:44.676252+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.001 |  |
| ap-east-1 | 0.699 |  |
| ap-east-2 | 0.645 |  |
| ap-northeast-1 | 0.522 |  |
| ap-northeast-2 | 0.632 |  |
| ap-northeast-3 | 0.548 |  |
| ap-south-1 | 0.915 |  |
| ap-south-2 | 0.955 |  |
| ap-southeast-1 | 0.773 |  |
| ap-southeast-2 | 0.681 |  |
| ap-southeast-3 | 0.828 |  |
| ap-southeast-4 | 0.728 |  |
| ap-southeast-5 | 0.795 |  |
| ap-southeast-6 | 0.748 |  |
| ap-southeast-7 | 0.877 |  |
| ca-central-1 | 0.202 | 16 |
| ca-west-1 | 0.211 |  |
| eu-central-1 | 0.508 |  |
| eu-central-2 | 0.532 |  |
| eu-north-1 | 0.559 |  |
| eu-south-1 | 0.532 |  |
| eu-south-2 | 0.546 |  |
| eu-west-1 | 0.438 |  |
| eu-west-2 | 0.477 |  |
| eu-west-3 | 0.490 |  |
| il-central-1 | 0.681 |  |
| me-central-1 | 0.885 |  |
| me-south-1 | 0.837 |  |
| mx-central-1 | 0.202 |  |
| sa-east-1 | 0.618 |  |
| us-east-1 | 0.161 | 4322 |
| us-east-2 | 0.145 | 1445 |
| us-gov-east-1 | 0.134 | 1592 |
| us-gov-west-1 | 0.180 | 189 |
| us-west-1 | 0.172 | 3272 |
| us-west-2 | 0.181 | 150 |

