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
Updated: 2026-02-22T07:31:53.273939+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.911 |  |
| ap-east-1 | 0.780 |  |
| ap-east-2 | 0.707 |  |
| ap-northeast-1 | 0.591 |  |
| ap-northeast-2 | 0.716 |  |
| ap-northeast-3 | 0.631 |  |
| ap-south-1 | 0.864 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.868 |  |
| ap-southeast-2 | 0.753 |  |
| ap-southeast-3 | 0.920 |  |
| ap-southeast-4 | 0.795 |  |
| ap-southeast-5 | 0.880 |  |
| ap-southeast-6 | 0.845 |  |
| ap-southeast-7 | 0.966 |  |
| ca-central-1 | 0.114 | 16 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.414 |  |
| eu-central-2 | 0.434 |  |
| eu-north-1 | 0.474 |  |
| eu-south-1 | 0.452 |  |
| eu-south-2 | 0.448 |  |
| eu-west-1 | 0.343 |  |
| eu-west-2 | 0.377 |  |
| eu-west-3 | 0.391 |  |
| il-central-1 | 0.607 |  |
| me-central-1 | 0.817 |  |
| me-south-1 | 0.780 |  |
| mx-central-1 | 0.217 |  |
| sa-east-1 | 0.536 |  |
| us-east-1 | 0.083 | 4160 |
| us-east-2 | 0.085 | 1369 |
| us-gov-east-1 | 0.086 | 1499 |
| us-gov-west-1 | 0.275 | 160 |
| us-west-1 | 0.241 | 3095 |
| us-west-2 | 0.262 | 129 |

