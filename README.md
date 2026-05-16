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
Updated: 2026-05-16T22:38:47.715107+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.904 |  |
| ap-east-1 | 0.789 |  |
| ap-east-2 | 0.727 |  |
| ap-northeast-1 | 0.608 |  |
| ap-northeast-2 | 0.712 |  |
| ap-northeast-3 | 0.633 |  |
| ap-south-1 | 0.855 |  |
| ap-south-2 | 0.916 |  |
| ap-southeast-1 | 0.872 |  |
| ap-southeast-2 | 0.758 |  |
| ap-southeast-3 | 0.913 |  |
| ap-southeast-4 | 0.797 |  |
| ap-southeast-5 | 0.882 |  |
| ap-southeast-6 | 0.829 |  |
| ap-southeast-7 | 0.960 |  |
| ca-central-1 | 0.118 | 16 |
| ca-west-1 | 0.255 |  |
| eu-central-1 | 0.415 |  |
| eu-central-2 | 0.437 |  |
| eu-north-1 | 0.462 |  |
| eu-south-1 | 0.442 |  |
| eu-south-2 | 0.447 |  |
| eu-west-1 | 0.341 |  |
| eu-west-2 | 0.376 |  |
| eu-west-3 | 0.393 |  |
| il-central-1 | 0.590 |  |
| me-central-1 | 0.793 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.522 |  |
| us-east-1 | 0.076 | 4650 |
| us-east-2 | 0.081 | 1597 |
| us-gov-east-1 | 0.086 | 1696 |
| us-gov-west-1 | 0.277 | 195 |
| us-west-1 | 0.236 | 3569 |
| us-west-2 | 0.279 | 158 |

