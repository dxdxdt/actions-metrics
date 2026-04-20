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
Updated: 2026-04-20T22:36:41.697243+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.087 |  |
| ap-east-1 | 0.645 |  |
| ap-east-2 | 0.586 |  |
| ap-northeast-1 | 0.465 |  |
| ap-northeast-2 | 0.570 |  |
| ap-northeast-3 | 0.493 |  |
| ap-south-1 | 0.900 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.718 |  |
| ap-southeast-2 | 0.607 |  |
| ap-southeast-3 | 0.778 |  |
| ap-southeast-4 | 0.643 |  |
| ap-southeast-5 | 0.736 |  |
| ap-southeast-6 | 0.671 |  |
| ap-southeast-7 | 0.818 |  |
| ca-central-1 | 0.287 | 16 |
| ca-west-1 | 0.200 |  |
| eu-central-1 | 0.579 |  |
| eu-central-2 | 0.597 |  |
| eu-north-1 | 0.630 |  |
| eu-south-1 | 0.605 |  |
| eu-south-2 | 0.609 |  |
| eu-west-1 | 0.487 |  |
| eu-west-2 | 0.535 |  |
| eu-west-3 | 0.567 |  |
| il-central-1 | 0.758 |  |
| me-central-1 | 0.947 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.697 |  |
| us-east-1 | 0.237 | 4534 |
| us-east-2 | 0.210 | 1519 |
| us-gov-east-1 | 0.219 | 1657 |
| us-gov-west-1 | 0.127 | 194 |
| us-west-1 | 0.074 | 3452 |
| us-west-2 | 0.127 | 156 |

