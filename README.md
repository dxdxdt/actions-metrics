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
Updated: 2026-07-17T15:07:45.180640+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.040 |  |
| ap-east-1 | 0.633 |  |
| ap-east-2 | 0.577 |  |
| ap-northeast-1 | 0.455 |  |
| ap-northeast-2 | 0.561 |  |
| ap-northeast-3 | 0.483 |  |
| ap-south-1 | 0.895 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.714 |  |
| ap-southeast-2 | 0.635 |  |
| ap-southeast-3 | 0.765 |  |
| ap-southeast-4 | 0.681 |  |
| ap-southeast-5 | 0.731 |  |
| ap-southeast-6 | 0.667 |  |
| ap-southeast-7 | 0.815 |  |
| ca-central-1 | 0.275 | 16 |
| ca-west-1 | 0.178 |  |
| eu-central-1 | 0.564 |  |
| eu-central-2 | 0.589 |  |
| eu-north-1 | 0.620 |  |
| eu-south-1 | 0.588 |  |
| eu-south-2 | 0.594 |  |
| eu-west-1 | 0.478 |  |
| eu-west-2 | 0.518 |  |
| eu-west-3 | 0.536 |  |
| il-central-1 | 0.712 |  |
| me-central-1 | 0.948 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.680 |  |
| us-east-1 | 0.223 | 4875 |
| us-east-2 | 0.240 | 1656 |
| us-gov-east-1 | 0.201 | 1763 |
| us-gov-west-1 | 0.128 | 203 |
| us-west-1 | 0.118 | 3792 |
| us-west-2 | 0.130 | 166 |

