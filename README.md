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
Updated: 2026-06-11T23:16:24.188153+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.907 |  |
| ap-east-1 | 0.789 |  |
| ap-east-2 | 0.727 |  |
| ap-northeast-1 | 0.592 |  |
| ap-northeast-2 | 0.715 |  |
| ap-northeast-3 | 0.639 |  |
| ap-south-1 | 0.856 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.864 |  |
| ap-southeast-2 | 0.744 |  |
| ap-southeast-3 | 0.919 |  |
| ap-southeast-4 | 0.788 |  |
| ap-southeast-5 | 0.883 |  |
| ap-southeast-6 | 0.787 |  |
| ap-southeast-7 | 0.969 |  |
| ca-central-1 | 0.127 | 16 |
| ca-west-1 | 0.278 |  |
| eu-central-1 | 0.417 |  |
| eu-central-2 | 0.448 |  |
| eu-north-1 | 0.469 |  |
| eu-south-1 | 0.468 |  |
| eu-south-2 | 0.454 |  |
| eu-west-1 | 0.348 |  |
| eu-west-2 | 0.375 |  |
| eu-west-3 | 0.401 |  |
| il-central-1 | 0.580 |  |
| me-central-1 | 0.795 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.522 |  |
| us-east-1 | 0.082 | 4744 |
| us-east-2 | 0.094 | 1631 |
| us-gov-east-1 | 0.103 | 1711 |
| us-gov-west-1 | 0.275 | 198 |
| us-west-1 | 0.216 | 3658 |
| us-west-2 | 0.276 | 162 |

