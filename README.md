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
Updated: 2026-03-08T08:22:44.465009+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.007 |  |
| ap-east-1 | 0.676 |  |
| ap-east-2 | 0.620 |  |
| ap-northeast-1 | 0.498 |  |
| ap-northeast-2 | 0.612 |  |
| ap-northeast-3 | 0.524 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.878 |  |
| ap-southeast-1 | 0.753 |  |
| ap-southeast-2 | 0.636 |  |
| ap-southeast-3 | 0.805 |  |
| ap-southeast-4 | 0.676 |  |
| ap-southeast-5 | 0.770 |  |
| ap-southeast-6 | 0.674 |  |
| ap-southeast-7 | 0.856 |  |
| ca-central-1 | 0.242 | 16 |
| ca-west-1 | 0.203 |  |
| eu-central-1 | 0.524 |  |
| eu-central-2 | 0.548 |  |
| eu-north-1 | 0.571 |  |
| eu-south-1 | 0.568 |  |
| eu-south-2 | 0.560 |  |
| eu-west-1 | 0.453 |  |
| eu-west-2 | 0.493 |  |
| eu-west-3 | 0.505 |  |
| il-central-1 | 0.705 |  |
| me-central-1 | 0.920 |  |
| me-south-1 | 0.886 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.633 |  |
| us-east-1 | 0.212 | 4239 |
| us-east-2 | 0.193 | 1408 |
| us-gov-east-1 | 0.196 | 1542 |
| us-gov-west-1 | 0.166 | 174 |
| us-west-1 | 0.110 | 3195 |
| us-west-2 | 0.167 | 143 |

