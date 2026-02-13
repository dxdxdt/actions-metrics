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
Updated: 2026-02-13T17:35:31.083726+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.950 |  |
| ap-east-1 | 0.740 |  |
| ap-northeast-1 | 0.570 |  |
| ap-northeast-2 | 0.667 |  |
| ap-south-1 | 0.907 |  |
| ap-south-2 | 0.964 |  |
| ap-southeast-1 | 0.818 |  |
| ap-southeast-2 | 0.732 |  |
| ap-southeast-3 | 0.869 |  |
| ap-southeast-4 | 0.774 |  |
| ca-central-1 | 0.118 | 16 |
| ca-west-1 | 0.205 |  |
| eu-central-1 | 0.461 |  |
| eu-central-2 | 0.476 |  |
| eu-north-1 | 0.505 |  |
| eu-south-1 | 0.481 |  |
| eu-south-2 | 0.502 |  |
| eu-west-1 | 0.388 |  |
| eu-west-2 | 0.418 |  |
| eu-west-3 | 0.454 |  |
| il-central-1 | 0.623 |  |
| me-central-1 | 0.841 |  |
| me-south-1 | 0.801 |  |
| sa-east-1 | 0.547 |  |
| us-east-1 | 0.105 | 4116 |
| us-east-2 | 0.076 | 1339 |
| us-gov-east-1 | 0.083 | 1457 |
| us-gov-west-1 | 0.221 | 146 |
| us-west-1 | 0.239 | 3054 |
| us-west-2 | 0.217 | 125 |

