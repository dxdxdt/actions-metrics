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
Updated: 2026-05-03T12:52:40.163048+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.980 |  |
| ap-east-1 | 0.717 |  |
| ap-east-2 | 0.656 |  |
| ap-northeast-1 | 0.543 |  |
| ap-northeast-2 | 0.648 |  |
| ap-northeast-3 | 0.571 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.918 |  |
| ap-southeast-1 | 0.794 |  |
| ap-southeast-2 | 0.707 |  |
| ap-southeast-3 | 0.851 |  |
| ap-southeast-4 | 0.755 |  |
| ap-southeast-5 | 0.810 |  |
| ap-southeast-6 | 0.772 |  |
| ap-southeast-7 | 0.894 |  |
| ca-central-1 | 0.175 | 16 |
| ca-west-1 | 0.270 |  |
| eu-central-1 | 0.501 |  |
| eu-central-2 | 0.501 |  |
| eu-north-1 | 0.544 |  |
| eu-south-1 | 0.510 |  |
| eu-south-2 | 0.519 |  |
| eu-west-1 | 0.406 |  |
| eu-west-2 | 0.442 |  |
| eu-west-3 | 0.463 |  |
| il-central-1 | 0.637 |  |
| me-central-1 | 0.840 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.194 |  |
| sa-east-1 | 0.594 |  |
| us-east-1 | 0.132 | 4590 |
| us-east-2 | 0.139 | 1561 |
| us-gov-east-1 | 0.122 | 1671 |
| us-gov-west-1 | 0.220 | 194 |
| us-west-1 | 0.163 | 3523 |
| us-west-2 | 0.221 | 157 |

