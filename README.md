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
Updated: 2025-12-06T02:41:24.802440+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.937 |  |
| ap-east-1 | 0.782 |  |
| ap-northeast-1 | 0.590 |  |
| ap-northeast-2 | 0.700 |  |
| ap-south-1 | 0.838 |  |
| ap-southeast-1 | 0.856 |  |
| ap-southeast-2 | 0.738 |  |
| ca-central-1 | 0.142 | 15 |
| eu-central-1 | 0.445 |  |
| eu-north-1 | 0.492 |  |
| eu-south-1 | 0.476 |  |
| eu-west-1 | 0.364 |  |
| eu-west-2 | 0.407 |  |
| eu-west-3 | 0.425 |  |
| me-south-1 | 0.774 |  |
| sa-east-1 | 0.553 |  |
| us-east-1 | 0.108 | 3640 |
| us-east-2 | 0.124 | 1131 |
| us-gov-east-1 | 0.116 | 1232 |
| us-gov-west-1 | 0.247 | 84 |
| us-west-1 | 0.212 | 2591 |
| us-west-2 | 0.250 | 58 |

