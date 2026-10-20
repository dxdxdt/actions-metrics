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
Updated: 2026-10-20T12:27:21.008011+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.029 |  |
| ap-east-1 | 0.649 |  |
| ap-east-2 | 0.584 |  |
| ap-northeast-1 | 0.468 |  |
| ap-northeast-2 | 0.571 |  |
| ap-northeast-3 | 0.493 |  |
| ap-south-1 | 0.909 |  |
| ap-south-2 | 0.896 |  |
| ap-southeast-1 | 0.725 |  |
| ap-southeast-2 | 0.615 |  |
| ap-southeast-3 | 0.782 |  |
| ap-southeast-4 | 0.707 |  |
| ap-southeast-5 | 0.745 |  |
| ap-southeast-6 | 0.703 |  |
| ap-southeast-7 | 0.830 |  |
| ca-central-1 | 0.251 | 18 |
| ca-west-1 | 0.256 |  |
| eu-central-1 | 0.544 |  |
| eu-central-2 | 0.560 |  |
| eu-north-1 | 0.598 |  |
| eu-south-1 | 0.569 |  |
| eu-south-2 | 0.559 |  |
| eu-west-1 | 0.467 |  |
| eu-west-2 | 0.506 |  |
| eu-west-3 | 0.527 |  |
| il-central-1 | 0.714 |  |
| me-central-1 | 1.010 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.256 |  |
| sa-east-1 | 0.659 |  |
| us-east-1 | 0.212 | 5153 |
| us-east-2 | 0.211 | 1704 |
| us-gov-east-1 | 0.228 | 1950 |
| us-gov-west-1 | 0.154 | 239 |
| us-west-1 | 0.087 | 4180 |
| us-west-2 | 0.150 | 195 |

