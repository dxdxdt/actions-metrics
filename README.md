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
Updated: 2026-03-25T16:02:43.919736+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.928 |  |
| ap-east-1 | 0.764 |  |
| ap-east-2 | 0.710 |  |
| ap-northeast-1 | 0.585 |  |
| ap-northeast-2 | 0.694 |  |
| ap-northeast-3 | 0.613 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.933 |  |
| ap-southeast-1 | 0.845 |  |
| ap-southeast-2 | 0.764 |  |
| ap-southeast-3 | 0.895 |  |
| ap-southeast-4 | 0.810 |  |
| ap-southeast-5 | 0.861 |  |
| ap-southeast-6 | 0.825 |  |
| ap-southeast-7 | 0.949 |  |
| ca-central-1 | 0.106 | 16 |
| ca-west-1 | 0.243 |  |
| eu-central-1 | 0.437 |  |
| eu-central-2 | 0.450 |  |
| eu-north-1 | 0.490 |  |
| eu-south-1 | 0.463 |  |
| eu-south-2 | 0.474 |  |
| eu-west-1 | 0.366 |  |
| eu-west-2 | 0.396 |  |
| eu-west-3 | 0.413 |  |
| il-central-1 | 0.613 |  |
| me-central-1 | 0.819 |  |
| me-south-1 | 0.761 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.536 |  |
| us-east-1 | 0.086 | 4358 |
| us-east-2 | 0.070 | 1453 |
| us-gov-east-1 | 0.071 | 1603 |
| us-gov-west-1 | 0.273 | 190 |
| us-west-1 | 0.226 | 3295 |
| us-west-2 | 0.275 | 151 |

