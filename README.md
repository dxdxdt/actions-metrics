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
Updated: 2026-05-03T09:16:06.328438+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.908 |  |
| ap-east-1 | 0.780 |  |
| ap-east-2 | 0.720 |  |
| ap-northeast-1 | 0.601 |  |
| ap-northeast-2 | 0.720 |  |
| ap-northeast-3 | 0.636 |  |
| ap-south-1 | 0.814 |  |
| ap-south-2 | 0.894 |  |
| ap-southeast-1 | 0.855 |  |
| ap-southeast-2 | 0.776 |  |
| ap-southeast-3 | 0.919 |  |
| ap-southeast-4 | 0.823 |  |
| ap-southeast-5 | 0.889 |  |
| ap-southeast-6 | 0.833 |  |
| ap-southeast-7 | 0.967 |  |
| ca-central-1 | 0.093 | 16 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.425 |  |
| eu-central-2 | 0.433 |  |
| eu-north-1 | 0.463 |  |
| eu-south-1 | 0.436 |  |
| eu-south-2 | 0.445 |  |
| eu-west-1 | 0.331 |  |
| eu-west-2 | 0.372 |  |
| eu-west-3 | 0.396 |  |
| il-central-1 | 0.570 |  |
| me-central-1 | 0.787 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.514 |  |
| us-east-1 | 0.068 | 4589 |
| us-east-2 | 0.067 | 1560 |
| us-gov-east-1 | 0.073 | 1671 |
| us-gov-west-1 | 0.303 | 194 |
| us-west-1 | 0.237 | 3522 |
| us-west-2 | 0.298 | 157 |

