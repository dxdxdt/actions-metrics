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
Updated: 2026-02-28T20:18:16.018484+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.913 |  |
| ap-east-1 | 0.773 |  |
| ap-east-2 | 0.718 |  |
| ap-northeast-1 | 0.596 |  |
| ap-northeast-2 | 0.700 |  |
| ap-northeast-3 | 0.619 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.919 |  |
| ap-southeast-1 | 0.849 |  |
| ap-southeast-2 | 0.755 |  |
| ap-southeast-3 | 0.906 |  |
| ap-southeast-4 | 0.796 |  |
| ap-southeast-5 | 0.873 |  |
| ap-southeast-6 | 0.805 |  |
| ap-southeast-7 | 0.948 |  |
| ca-central-1 | 0.103 | 16 |
| ca-west-1 | 0.234 |  |
| eu-central-1 | 0.420 |  |
| eu-central-2 | 0.442 |  |
| eu-north-1 | 0.466 |  |
| eu-south-1 | 0.444 |  |
| eu-south-2 | 0.457 |  |
| eu-west-1 | 0.338 |  |
| eu-west-2 | 0.378 |  |
| eu-west-3 | 0.404 |  |
| il-central-1 | 0.581 |  |
| me-central-1 | 0.794 |  |
| me-south-1 | 0.746 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.519 |  |
| us-east-1 | 0.075 | 4201 |
| us-east-2 | 0.075 | 1384 |
| us-gov-east-1 | 0.081 | 1519 |
| us-gov-west-1 | 0.257 | 166 |
| us-west-1 | 0.249 | 3142 |
| us-west-2 | 0.265 | 134 |

