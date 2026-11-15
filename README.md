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
Updated: 2026-11-15T07:24:08.955711+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.719 |  |
| ap-east-1 | 0.541 |  |
| ap-east-2 | 0.492 |  |
| ap-northeast-1 | 0.406 |  |
| ap-northeast-2 | 0.485 |  |
| ap-northeast-3 | 0.424 |  |
| ap-south-1 | 0.677 |  |
| ap-south-2 | 0.746 |  |
| ap-southeast-1 | 0.599 |  |
| ap-southeast-2 | 0.522 |  |
| ap-southeast-3 | 0.640 |  |
| ap-southeast-4 | 0.585 |  |
| ap-southeast-5 | 0.613 |  |
| ap-southeast-6 | 0.540 |  |
| ap-southeast-7 | 0.673 |  |
| ca-central-1 | 0.131 | 18 |
| ca-west-1 | 0.185 |  |
| eu-central-1 | 0.358 |  |
| eu-central-2 | 0.368 |  |
| eu-north-1 | 0.390 |  |
| eu-south-1 | 0.377 |  |
| eu-south-2 | 0.368 |  |
| eu-west-1 | 0.298 |  |
| eu-west-2 | 0.320 |  |
| eu-west-3 | 0.339 |  |
| il-central-1 | 0.471 |  |
| me-central-1 | 0.621 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.653 |  |
| mx-central-1 | 0.137 |  |
| sa-east-1 | 0.437 |  |
| us-east-1 | 0.102 | 5185 |
| us-east-2 | 0.106 | 1727 |
| us-gov-east-1 | 0.111 | 1962 |
| us-gov-west-1 | 0.170 | 247 |
| us-west-1 | 0.126 | 4217 |
| us-west-2 | 0.171 | 197 |

