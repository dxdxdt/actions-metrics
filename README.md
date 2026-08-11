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
Updated: 2026-08-11T10:43:38.145602+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.026 |  |
| ap-east-1 | 0.647 |  |
| ap-east-2 | 0.587 |  |
| ap-northeast-1 | 0.470 |  |
| ap-northeast-2 | 0.572 |  |
| ap-northeast-3 | 0.494 |  |
| ap-south-1 | 0.916 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.726 |  |
| ap-southeast-2 | 0.615 |  |
| ap-southeast-3 | 0.786 |  |
| ap-southeast-4 | 0.661 |  |
| ap-southeast-5 | 0.746 |  |
| ap-southeast-6 | 0.667 |  |
| ap-southeast-7 | 0.836 |  |
| ca-central-1 | 0.281 | 18 |
| ca-west-1 | 0.199 |  |
| eu-central-1 | 0.538 |  |
| eu-central-2 | 0.569 |  |
| eu-north-1 | 0.611 |  |
| eu-south-1 | 0.571 |  |
| eu-south-2 | 0.573 |  |
| eu-west-1 | 0.466 |  |
| eu-west-2 | 0.506 |  |
| eu-west-3 | 0.522 |  |
| il-central-1 | 0.702 |  |
| me-central-1 | 0.973 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.205 |  |
| sa-east-1 | 0.655 |  |
| us-east-1 | 0.213 | 4974 |
| us-east-2 | 0.221 | 1679 |
| us-gov-east-1 | 0.215 | 1820 |
| us-gov-west-1 | 0.154 | 216 |
| us-west-1 | 0.090 | 3922 |
| us-west-2 | 0.154 | 176 |

