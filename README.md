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
Updated: 2026-03-20T15:36:33.974113+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.935 |  |
| ap-east-1 | 0.760 |  |
| ap-east-2 | 0.703 |  |
| ap-northeast-1 | 0.581 |  |
| ap-northeast-2 | 0.691 |  |
| ap-northeast-3 | 0.603 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.904 |  |
| ap-southeast-1 | 0.839 |  |
| ap-southeast-2 | 0.746 |  |
| ap-southeast-3 | 0.887 |  |
| ap-southeast-4 | 0.798 |  |
| ap-southeast-5 | 0.859 |  |
| ap-southeast-6 | 0.820 |  |
| ap-southeast-7 | 0.948 |  |
| ca-central-1 | 0.126 | 16 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.444 |  |
| eu-central-2 | 0.463 |  |
| eu-north-1 | 0.498 |  |
| eu-south-1 | 0.469 |  |
| eu-south-2 | 0.483 |  |
| eu-west-1 | 0.374 |  |
| eu-west-2 | 0.402 |  |
| eu-west-3 | 0.419 |  |
| il-central-1 | 0.613 |  |
| me-central-1 | 0.819 |  |
| me-south-1 | 0.782 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.541 |  |
| us-east-1 | 0.093 | 4315 |
| us-east-2 | 0.090 | 1440 |
| us-gov-east-1 | 0.091 | 1591 |
| us-gov-west-1 | 0.251 | 189 |
| us-west-1 | 0.237 | 3267 |
| us-west-2 | 0.244 | 148 |

