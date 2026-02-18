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
Updated: 2026-02-18T18:42:18.434529+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.022 |  |
| ap-east-1 | 0.675 |  |
| ap-east-2 | 0.611 |  |
| ap-northeast-1 | 0.493 |  |
| ap-northeast-2 | 0.601 |  |
| ap-northeast-3 | 0.519 |  |
| ap-south-1 | 0.942 |  |
| ap-south-2 | 0.932 |  |
| ap-southeast-1 | 0.750 |  |
| ap-southeast-2 | 0.661 |  |
| ap-southeast-3 | 0.810 |  |
| ap-southeast-4 | 0.703 |  |
| ap-southeast-5 | 0.772 |  |
| ap-southeast-6 | 0.704 |  |
| ap-southeast-7 | 0.858 |  |
| ca-central-1 | 0.236 | 16 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.519 |  |
| eu-central-2 | 0.539 |  |
| eu-north-1 | 0.575 |  |
| eu-south-1 | 0.556 |  |
| eu-south-2 | 0.564 |  |
| eu-west-1 | 0.452 |  |
| eu-west-2 | 0.490 |  |
| eu-west-3 | 0.508 |  |
| il-central-1 | 0.713 |  |
| me-central-1 | 0.910 |  |
| me-south-1 | 0.864 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.620 |  |
| us-east-1 | 0.177 | 4139 |
| us-east-2 | 0.167 | 1354 |
| us-gov-east-1 | 0.163 | 1490 |
| us-gov-west-1 | 0.172 | 155 |
| us-west-1 | 0.148 | 3075 |
| us-west-2 | 0.178 | 127 |

