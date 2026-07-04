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
Updated: 2026-07-04T23:55:23.802116+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.055 |  |
| ap-east-1 | 0.642 |  |
| ap-east-2 | 0.579 |  |
| ap-northeast-1 | 0.461 |  |
| ap-northeast-2 | 0.561 |  |
| ap-northeast-3 | 0.488 |  |
| ap-south-1 | 0.886 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.720 |  |
| ap-southeast-2 | 0.605 |  |
| ap-southeast-3 | 0.778 |  |
| ap-southeast-4 | 0.651 |  |
| ap-southeast-5 | 0.739 |  |
| ap-southeast-6 | 0.645 |  |
| ap-southeast-7 | 0.829 |  |
| ca-central-1 | 0.296 | 16 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.571 |  |
| eu-central-2 | 0.597 |  |
| eu-north-1 | 0.627 |  |
| eu-south-1 | 0.609 |  |
| eu-south-2 | 0.604 |  |
| eu-west-1 | 0.493 |  |
| eu-west-2 | 0.532 |  |
| eu-west-3 | 0.548 |  |
| il-central-1 | 0.726 |  |
| me-central-1 | 0.960 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.205 |  |
| sa-east-1 | 0.670 |  |
| us-east-1 | 0.240 | 4820 |
| us-east-2 | 0.225 | 1652 |
| us-gov-east-1 | 0.217 | 1729 |
| us-gov-west-1 | 0.141 | 200 |
| us-west-1 | 0.079 | 3743 |
| us-west-2 | 0.142 | 164 |

