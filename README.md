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
Updated: 2026-05-24T09:15:56.735569+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.974 |  |
| ap-east-1 | 0.731 |  |
| ap-east-2 | 0.673 |  |
| ap-northeast-1 | 0.552 |  |
| ap-northeast-2 | 0.660 |  |
| ap-northeast-3 | 0.583 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.796 |  |
| ap-southeast-2 | 0.707 |  |
| ap-southeast-3 | 0.860 |  |
| ap-southeast-4 | 0.748 |  |
| ap-southeast-5 | 0.820 |  |
| ap-southeast-6 | 0.754 |  |
| ap-southeast-7 | 0.918 |  |
| ca-central-1 | 0.158 | 16 |
| ca-west-1 | 0.225 |  |
| eu-central-1 | 0.483 |  |
| eu-central-2 | 0.503 |  |
| eu-north-1 | 0.522 |  |
| eu-south-1 | 0.503 |  |
| eu-south-2 | 0.514 |  |
| eu-west-1 | 0.392 |  |
| eu-west-2 | 0.435 |  |
| eu-west-3 | 0.463 |  |
| il-central-1 | 0.640 |  |
| me-central-1 | 0.871 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.220 |  |
| sa-east-1 | 0.584 |  |
| us-east-1 | 0.132 | 4682 |
| us-east-2 | 0.111 | 1610 |
| us-gov-east-1 | 0.115 | 1704 |
| us-gov-west-1 | 0.224 | 195 |
| us-west-1 | 0.170 | 3593 |
| us-west-2 | 0.216 | 159 |

