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
Updated: 2026-04-20T20:40:41.302461+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.962 |  |
| ap-east-1 | 0.737 |  |
| ap-east-2 | 0.681 |  |
| ap-northeast-1 | 0.551 |  |
| ap-northeast-2 | 0.662 |  |
| ap-northeast-3 | 0.591 |  |
| ap-south-1 | 0.898 |  |
| ap-south-2 | 0.970 |  |
| ap-southeast-1 | 0.810 |  |
| ap-southeast-2 | 0.737 |  |
| ap-southeast-3 | 0.877 |  |
| ap-southeast-4 | 0.768 |  |
| ap-southeast-5 | 0.834 |  |
| ap-southeast-6 | 0.758 |  |
| ap-southeast-7 | 0.915 |  |
| ca-central-1 | 0.178 | 16 |
| ca-west-1 | 0.286 |  |
| eu-central-1 | 0.460 |  |
| eu-central-2 | 0.481 |  |
| eu-north-1 | 0.521 |  |
| eu-south-1 | 0.475 |  |
| eu-south-2 | 0.502 |  |
| eu-west-1 | 0.379 |  |
| eu-west-2 | 0.409 |  |
| eu-west-3 | 0.442 |  |
| il-central-1 | 0.641 |  |
| me-central-1 | 0.841 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.575 |  |
| us-east-1 | 0.135 | 4534 |
| us-east-2 | 0.146 | 1519 |
| us-gov-east-1 | 0.146 | 1657 |
| us-gov-west-1 | 0.241 | 194 |
| us-west-1 | 0.187 | 3450 |
| us-west-2 | 0.239 | 156 |

