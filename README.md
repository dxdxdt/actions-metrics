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
Updated: 2026-03-15T17:22:17.166439+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.989 |  |
| ap-east-1 | 0.705 |  |
| ap-east-2 | 0.651 |  |
| ap-northeast-1 | 0.528 |  |
| ap-northeast-2 | 0.633 |  |
| ap-northeast-3 | 0.556 |  |
| ap-south-1 | 0.911 |  |
| ap-south-2 | 0.955 |  |
| ap-southeast-1 | 0.782 |  |
| ap-southeast-2 | 0.689 |  |
| ap-southeast-3 | 0.837 |  |
| ap-southeast-4 | 0.732 |  |
| ap-southeast-5 | 0.800 |  |
| ap-southeast-6 | 0.736 |  |
| ap-southeast-7 | 0.885 |  |
| ca-central-1 | 0.193 | 16 |
| ca-west-1 | 0.243 |  |
| eu-central-1 | 0.493 |  |
| eu-central-2 | 0.506 |  |
| eu-north-1 | 0.542 |  |
| eu-south-1 | 0.511 |  |
| eu-south-2 | 0.524 |  |
| eu-west-1 | 0.426 |  |
| eu-west-2 | 0.448 |  |
| eu-west-3 | 0.467 |  |
| il-central-1 | 0.659 |  |
| me-central-1 | 0.904 |  |
| me-south-1 | 0.822 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.583 |  |
| us-east-1 | 0.136 | 4284 |
| us-east-2 | 0.130 | 1425 |
| us-gov-east-1 | 0.143 | 1577 |
| us-gov-west-1 | 0.194 | 185 |
| us-west-1 | 0.180 | 3237 |
| us-west-2 | 0.193 | 148 |

