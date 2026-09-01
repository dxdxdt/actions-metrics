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
Updated: 2026-09-01T10:52:40.467191+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.075 |  |
| ap-east-1 | 0.606 |  |
| ap-east-2 | 0.550 |  |
| ap-northeast-1 | 0.429 |  |
| ap-northeast-2 | 0.535 |  |
| ap-northeast-3 | 0.456 |  |
| ap-south-1 | 0.882 |  |
| ap-south-2 | 0.850 |  |
| ap-southeast-1 | 0.688 |  |
| ap-southeast-2 | 0.598 |  |
| ap-southeast-3 | 0.741 |  |
| ap-southeast-4 | 0.639 |  |
| ap-southeast-5 | 0.703 |  |
| ap-southeast-6 | 0.625 |  |
| ap-southeast-7 | 0.786 |  |
| ca-central-1 | 0.323 | 18 |
| ca-west-1 | 0.155 |  |
| eu-central-1 | 0.592 |  |
| eu-central-2 | 0.619 |  |
| eu-north-1 | 0.641 |  |
| eu-south-1 | 0.646 |  |
| eu-south-2 | 0.632 |  |
| eu-west-1 | 0.515 |  |
| eu-west-2 | 0.546 |  |
| eu-west-3 | 0.572 |  |
| il-central-1 | 0.756 |  |
| me-central-1 | 0.970 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.258 |  |
| sa-east-1 | 0.718 |  |
| us-east-1 | 0.261 | 5076 |
| us-east-2 | 0.264 | 1685 |
| us-gov-east-1 | 0.280 | 1891 |
| us-gov-west-1 | 0.090 | 228 |
| us-west-1 | 0.086 | 4074 |
| us-west-2 | 0.090 | 190 |

