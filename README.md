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
Updated: 2026-03-08T16:19:42.150835+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.924 |  |
| ap-east-1 | 0.758 |  |
| ap-east-2 | 0.701 |  |
| ap-northeast-1 | 0.581 |  |
| ap-northeast-2 | 0.693 |  |
| ap-northeast-3 | 0.605 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.928 |  |
| ap-southeast-1 | 0.843 |  |
| ap-southeast-2 | 0.746 |  |
| ap-southeast-3 | 0.893 |  |
| ap-southeast-4 | 0.785 |  |
| ap-southeast-5 | 0.857 |  |
| ap-southeast-6 | 0.819 |  |
| ap-southeast-7 | 0.937 |  |
| ca-central-1 | 0.130 | 16 |
| ca-west-1 | 0.240 |  |
| eu-central-1 | 0.429 |  |
| eu-central-2 | 0.443 |  |
| eu-north-1 | 0.484 |  |
| eu-south-1 | 0.466 |  |
| eu-south-2 | 0.463 |  |
| eu-west-1 | 0.357 |  |
| eu-west-2 | 0.388 |  |
| eu-west-3 | 0.408 |  |
| il-central-1 | 0.603 |  |
| me-central-1 | 0.810 |  |
| me-south-1 | 0.773 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.532 |  |
| us-east-1 | 0.092 | 4241 |
| us-east-2 | 0.102 | 1408 |
| us-gov-east-1 | 0.097 | 1546 |
| us-gov-west-1 | 0.256 | 175 |
| us-west-1 | 0.232 | 3195 |
| us-west-2 | 0.253 | 144 |

