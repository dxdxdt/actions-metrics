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
Updated: 2026-02-25T21:29:30.354031+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.044 |  |
| ap-east-1 | 0.671 |  |
| ap-east-2 | 0.608 |  |
| ap-northeast-1 | 0.489 |  |
| ap-northeast-2 | 0.599 |  |
| ap-northeast-3 | 0.516 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.902 |  |
| ap-southeast-1 | 0.741 |  |
| ap-southeast-2 | 0.632 |  |
| ap-southeast-3 | 0.796 |  |
| ap-southeast-4 | 0.672 |  |
| ap-southeast-5 | 0.759 |  |
| ap-southeast-6 | 0.670 |  |
| ap-southeast-7 | 0.842 |  |
| ca-central-1 | 0.243 | 16 |
| ca-west-1 | 0.187 |  |
| eu-central-1 | 0.550 |  |
| eu-central-2 | 0.570 |  |
| eu-north-1 | 0.601 |  |
| eu-south-1 | 0.571 |  |
| eu-south-2 | 0.603 |  |
| eu-west-1 | 0.457 |  |
| eu-west-2 | 0.497 |  |
| eu-west-3 | 0.532 |  |
| il-central-1 | 0.725 |  |
| me-central-1 | 0.913 |  |
| me-south-1 | 0.884 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.652 |  |
| us-east-1 | 0.198 | 4183 |
| us-east-2 | 0.178 | 1379 |
| us-gov-east-1 | 0.177 | 1510 |
| us-gov-west-1 | 0.149 | 162 |
| us-west-1 | 0.120 | 3119 |
| us-west-2 | 0.148 | 131 |

