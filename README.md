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
Updated: 2026-06-18T00:10:13.805198+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.884 |  |
| ap-east-1 | 0.795 |  |
| ap-east-2 | 0.742 |  |
| ap-northeast-1 | 0.616 |  |
| ap-northeast-2 | 0.721 |  |
| ap-northeast-3 | 0.640 |  |
| ap-south-1 | 0.847 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.867 |  |
| ap-southeast-2 | 0.768 |  |
| ap-southeast-3 | 0.915 |  |
| ap-southeast-4 | 0.816 |  |
| ap-southeast-5 | 0.889 |  |
| ap-southeast-6 | 0.808 |  |
| ap-southeast-7 | 0.971 |  |
| ca-central-1 | 0.132 | 16 |
| ca-west-1 | 0.285 |  |
| eu-central-1 | 0.406 |  |
| eu-central-2 | 0.426 |  |
| eu-north-1 | 0.440 |  |
| eu-south-1 | 0.432 |  |
| eu-south-2 | 0.467 |  |
| eu-west-1 | 0.320 |  |
| eu-west-2 | 0.357 |  |
| eu-west-3 | 0.387 |  |
| il-central-1 | 0.560 |  |
| me-central-1 | 0.795 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.510 |  |
| us-east-1 | 0.075 | 4767 |
| us-east-2 | 0.109 | 1635 |
| us-gov-east-1 | 0.101 | 1713 |
| us-gov-west-1 | 0.286 | 198 |
| us-west-1 | 0.242 | 3676 |
| us-west-2 | 0.289 | 163 |

