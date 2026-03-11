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
Updated: 2026-03-11T22:21:25.776130+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.990 |  |
| ap-east-1 | 0.712 |  |
| ap-east-2 | 0.655 |  |
| ap-northeast-1 | 0.528 |  |
| ap-northeast-2 | 0.639 |  |
| ap-northeast-3 | 0.558 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.924 |  |
| ap-southeast-1 | 0.785 |  |
| ap-southeast-2 | 0.701 |  |
| ap-southeast-3 | 0.844 |  |
| ap-southeast-4 | 0.736 |  |
| ap-southeast-5 | 0.809 |  |
| ap-southeast-6 | 0.740 |  |
| ap-southeast-7 | 0.887 |  |
| ca-central-1 | 0.175 | 16 |
| ca-west-1 | 0.210 |  |
| eu-central-1 | 0.494 |  |
| eu-central-2 | 0.505 |  |
| eu-north-1 | 0.536 |  |
| eu-south-1 | 0.513 |  |
| eu-south-2 | 0.514 |  |
| eu-west-1 | 0.423 |  |
| eu-west-2 | 0.451 |  |
| eu-west-3 | 0.463 |  |
| il-central-1 | 0.654 |  |
| me-central-1 | 0.861 |  |
| me-south-1 | 0.816 |  |
| mx-central-1 | 0.219 |  |
| sa-east-1 | 0.592 |  |
| us-east-1 | 0.145 | 4260 |
| us-east-2 | 0.124 | 1419 |
| us-gov-east-1 | 0.121 | 1564 |
| us-gov-west-1 | 0.198 | 179 |
| us-west-1 | 0.183 | 3212 |
| us-west-2 | 0.200 | 144 |

