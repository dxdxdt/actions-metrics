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
Updated: 2026-06-13T13:30:22.124788+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.917 |  |
| ap-east-1 | 0.774 |  |
| ap-east-2 | 0.710 |  |
| ap-northeast-1 | 0.585 |  |
| ap-northeast-2 | 0.699 |  |
| ap-northeast-3 | 0.609 |  |
| ap-south-1 | 0.839 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.847 |  |
| ap-southeast-2 | 0.725 |  |
| ap-southeast-3 | 0.904 |  |
| ap-southeast-4 | 0.773 |  |
| ap-southeast-5 | 0.868 |  |
| ap-southeast-6 | 0.767 |  |
| ap-southeast-7 | 0.944 |  |
| ca-central-1 | 0.172 | 16 |
| ca-west-1 | 0.265 |  |
| eu-central-1 | 0.435 |  |
| eu-central-2 | 0.482 |  |
| eu-north-1 | 0.484 |  |
| eu-south-1 | 0.477 |  |
| eu-south-2 | 0.466 |  |
| eu-west-1 | 0.361 |  |
| eu-west-2 | 0.405 |  |
| eu-west-3 | 0.418 |  |
| il-central-1 | 0.599 |  |
| me-central-1 | 0.820 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.542 |  |
| us-east-1 | 0.117 | 4751 |
| us-east-2 | 0.124 | 1632 |
| us-gov-east-1 | 0.138 | 1712 |
| us-gov-west-1 | 0.261 | 198 |
| us-west-1 | 0.210 | 3661 |
| us-west-2 | 0.261 | 163 |

