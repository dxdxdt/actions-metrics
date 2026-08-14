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
Updated: 2026-08-14T20:23:38.388618+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.991 |  |
| ap-east-1 | 0.692 |  |
| ap-east-2 | 0.633 |  |
| ap-northeast-1 | 0.514 |  |
| ap-northeast-2 | 0.617 |  |
| ap-northeast-3 | 0.542 |  |
| ap-south-1 | 0.910 |  |
| ap-south-2 | 0.936 |  |
| ap-southeast-1 | 0.766 |  |
| ap-southeast-2 | 0.667 |  |
| ap-southeast-3 | 0.824 |  |
| ap-southeast-4 | 0.709 |  |
| ap-southeast-5 | 0.789 |  |
| ap-southeast-6 | 0.702 |  |
| ap-southeast-7 | 0.869 |  |
| ca-central-1 | 0.232 | 18 |
| ca-west-1 | 0.246 |  |
| eu-central-1 | 0.510 |  |
| eu-central-2 | 0.530 |  |
| eu-north-1 | 0.548 |  |
| eu-south-1 | 0.532 |  |
| eu-south-2 | 0.546 |  |
| eu-west-1 | 0.425 |  |
| eu-west-2 | 0.469 |  |
| eu-west-3 | 0.493 |  |
| il-central-1 | 0.676 |  |
| me-central-1 | 0.903 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.216 |  |
| sa-east-1 | 0.626 |  |
| us-east-1 | 0.185 | 4996 |
| us-east-2 | 0.186 | 1679 |
| us-gov-east-1 | 0.167 | 1827 |
| us-gov-west-1 | 0.185 | 222 |
| us-west-1 | 0.129 | 3948 |
| us-west-2 | 0.186 | 177 |

