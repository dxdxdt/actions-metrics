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
Updated: 2026-03-01T21:16:26.207378+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.073 |  |
| ap-east-1 | 0.639 |  |
| ap-east-2 | 0.571 |  |
| ap-northeast-1 | 0.450 |  |
| ap-northeast-2 | 0.555 |  |
| ap-northeast-3 | 0.474 |  |
| ap-south-1 | 0.918 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.705 |  |
| ap-southeast-2 | 0.593 |  |
| ap-southeast-3 | 0.758 |  |
| ap-southeast-4 | 0.631 |  |
| ap-southeast-5 | 0.728 |  |
| ap-southeast-6 | 0.631 |  |
| ap-southeast-7 | 0.804 |  |
| ca-central-1 | 0.318 | 16 |
| ca-west-1 | 0.200 |  |
| eu-central-1 | 0.580 |  |
| eu-central-2 | 0.601 |  |
| eu-north-1 | 0.642 |  |
| eu-south-1 | 0.627 |  |
| eu-south-2 | 0.617 |  |
| eu-west-1 | 0.512 |  |
| eu-west-2 | 0.545 |  |
| eu-west-3 | 0.563 |  |
| il-central-1 | 0.784 |  |
| me-central-1 | 0.964 |  |
| me-south-1 | 0.916 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.702 |  |
| us-east-1 | 0.253 | 4207 |
| us-east-2 | 0.224 | 1387 |
| us-gov-east-1 | 0.225 | 1519 |
| us-gov-west-1 | 0.119 | 167 |
| us-west-1 | 0.072 | 3152 |
| us-west-2 | 0.121 | 136 |

