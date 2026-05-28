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
Updated: 2026-05-28T20:17:34.295139+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.990 |  |
| ap-east-1 | 0.702 |  |
| ap-east-2 | 0.644 |  |
| ap-northeast-1 | 0.524 |  |
| ap-northeast-2 | 0.629 |  |
| ap-northeast-3 | 0.549 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.923 |  |
| ap-southeast-1 | 0.776 |  |
| ap-southeast-2 | 0.689 |  |
| ap-southeast-3 | 0.834 |  |
| ap-southeast-4 | 0.723 |  |
| ap-southeast-5 | 0.799 |  |
| ap-southeast-6 | 0.719 |  |
| ap-southeast-7 | 0.880 |  |
| ca-central-1 | 0.194 | 16 |
| ca-west-1 | 0.322 |  |
| eu-central-1 | 0.509 |  |
| eu-central-2 | 0.522 |  |
| eu-north-1 | 0.554 |  |
| eu-south-1 | 0.530 |  |
| eu-south-2 | 0.536 |  |
| eu-west-1 | 0.414 |  |
| eu-west-2 | 0.464 |  |
| eu-west-3 | 0.490 |  |
| il-central-1 | 0.658 |  |
| me-central-1 | 0.893 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.206 |  |
| sa-east-1 | 0.625 |  |
| us-east-1 | 0.158 | 4694 |
| us-east-2 | 0.126 | 1613 |
| us-gov-east-1 | 0.137 | 1707 |
| us-gov-west-1 | 0.198 | 195 |
| us-west-1 | 0.145 | 3614 |
| us-west-2 | 0.194 | 161 |

