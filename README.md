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
Updated: 2026-11-01T15:38:29.638153+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.715 |  |
| ap-east-1 | 0.549 |  |
| ap-east-2 | 0.508 |  |
| ap-northeast-1 | 0.416 |  |
| ap-northeast-2 | 0.495 |  |
| ap-northeast-3 | 0.435 |  |
| ap-south-1 | 0.685 |  |
| ap-south-2 | 0.762 |  |
| ap-southeast-1 | 0.607 |  |
| ap-southeast-2 | 0.532 |  |
| ap-southeast-3 | 0.650 |  |
| ap-southeast-4 | 0.597 |  |
| ap-southeast-5 | 0.621 |  |
| ap-southeast-6 | 0.550 |  |
| ap-southeast-7 | 0.684 |  |
| ca-central-1 | 0.105 | 18 |
| ca-west-1 | 0.150 |  |
| eu-central-1 | 0.358 |  |
| eu-central-2 | 0.377 |  |
| eu-north-1 | 0.388 |  |
| eu-south-1 | 0.362 |  |
| eu-south-2 | 0.366 |  |
| eu-west-1 | 0.294 |  |
| eu-west-2 | 0.320 |  |
| eu-west-3 | 0.337 |  |
| il-central-1 | 0.464 |  |
| me-central-1 | 0.603 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.155 |  |
| sa-east-1 | 0.445 |  |
| us-east-1 | 0.102 | 5168 |
| us-east-2 | 0.073 | 1719 |
| us-gov-east-1 | 0.081 | 1958 |
| us-gov-west-1 | 0.170 | 241 |
| us-west-1 | 0.127 | 4203 |
| us-west-2 | 0.171 | 195 |

