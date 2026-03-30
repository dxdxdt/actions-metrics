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
Updated: 2026-03-30T04:40:01.028797+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.969 |  |
| ap-east-1 | 0.711 |  |
| ap-east-2 | 0.647 |  |
| ap-northeast-1 | 0.529 |  |
| ap-northeast-2 | 0.637 |  |
| ap-northeast-3 | 0.552 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.927 |  |
| ap-southeast-1 | 0.789 |  |
| ap-southeast-2 | 0.698 |  |
| ap-southeast-3 | 0.848 |  |
| ap-southeast-4 | 0.801 |  |
| ap-southeast-5 | 0.814 |  |
| ap-southeast-6 | 0.731 |  |
| ap-southeast-7 | 0.898 |  |
| ca-central-1 | 0.198 | 16 |
| ca-west-1 | 0.251 |  |
| eu-central-1 | 0.474 |  |
| eu-central-2 | 0.498 |  |
| eu-north-1 | 0.535 |  |
| eu-south-1 | 0.506 |  |
| eu-south-2 | 0.526 |  |
| eu-west-1 | 0.418 |  |
| eu-west-2 | 0.451 |  |
| eu-west-3 | 0.463 |  |
| il-central-1 | 0.667 |  |
| me-central-1 | 0.854 |  |
| me-south-1 | 0.834 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.592 |  |
| us-east-1 | 0.144 | 4396 |
| us-east-2 | 0.146 | 1466 |
| us-gov-east-1 | 0.155 | 1615 |
| us-gov-west-1 | 0.221 | 190 |
| us-west-1 | 0.166 | 3318 |
| us-west-2 | 0.223 | 152 |

