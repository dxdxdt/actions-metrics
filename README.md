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
Updated: 2026-02-13T18:36:24.505824+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.906 |  |
| ap-east-1 | 0.782 |  |
| ap-northeast-1 | 0.606 |  |
| ap-northeast-2 | 0.711 |  |
| ap-south-1 | 0.872 |  |
| ap-south-2 | 0.912 |  |
| ap-southeast-1 | 0.854 |  |
| ap-southeast-2 | 0.782 |  |
| ap-southeast-3 | 0.927 |  |
| ap-southeast-4 | 0.832 |  |
| ca-central-1 | 0.114 | 16 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.413 |  |
| eu-central-2 | 0.436 |  |
| eu-north-1 | 0.466 |  |
| eu-south-1 | 0.440 |  |
| eu-south-2 | 0.456 |  |
| eu-west-1 | 0.342 |  |
| eu-west-2 | 0.376 |  |
| eu-west-3 | 0.400 |  |
| il-central-1 | 0.589 |  |
| me-central-1 | 0.810 |  |
| me-south-1 | 0.768 |  |
| sa-east-1 | 0.510 |  |
| us-east-1 | 0.077 | 4117 |
| us-east-2 | 0.075 | 1339 |
| us-gov-east-1 | 0.096 | 1457 |
| us-gov-west-1 | 0.279 | 146 |
| us-west-1 | 0.269 | 3054 |
| us-west-2 | 0.279 | 125 |

