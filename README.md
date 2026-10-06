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
Updated: 2026-10-06T01:12:26.173120+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.942 |  |
| ap-east-1 | 0.731 |  |
| ap-east-2 | 0.671 |  |
| ap-northeast-1 | 0.560 |  |
| ap-northeast-2 | 0.680 |  |
| ap-northeast-3 | 0.582 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.988 |  |
| ap-southeast-1 | 0.834 |  |
| ap-southeast-2 | 0.709 |  |
| ap-southeast-3 | 0.871 |  |
| ap-southeast-4 | 0.754 |  |
| ap-southeast-5 | 0.833 |  |
| ap-southeast-6 | 0.770 |  |
| ap-southeast-7 | 0.920 |  |
| ca-central-1 | 0.150 | 18 |
| ca-west-1 | 0.243 |  |
| eu-central-1 | 0.459 |  |
| eu-central-2 | 0.477 |  |
| eu-north-1 | 0.510 |  |
| eu-south-1 | 0.487 |  |
| eu-south-2 | 0.473 |  |
| eu-west-1 | 0.365 |  |
| eu-west-2 | 0.411 |  |
| eu-west-3 | 0.432 |  |
| il-central-1 | 0.613 |  |
| me-central-1 | 0.835 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.198 |  |
| sa-east-1 | 0.573 |  |
| us-east-1 | 0.115 | 5138 |
| us-east-2 | 0.124 | 1690 |
| us-gov-east-1 | 0.107 | 1934 |
| us-gov-west-1 | 0.231 | 237 |
| us-west-1 | 0.175 | 4157 |
| us-west-2 | 0.233 | 193 |

