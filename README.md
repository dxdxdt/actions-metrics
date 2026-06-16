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
Updated: 2026-06-16T20:43:27.824503+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.046 |  |
| ap-east-1 | 0.654 |  |
| ap-east-2 | 0.589 |  |
| ap-northeast-1 | 0.474 |  |
| ap-northeast-2 | 0.581 |  |
| ap-northeast-3 | 0.501 |  |
| ap-south-1 | 0.894 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.730 |  |
| ap-southeast-2 | 0.608 |  |
| ap-southeast-3 | 0.782 |  |
| ap-southeast-4 | 0.648 |  |
| ap-southeast-5 | 0.746 |  |
| ap-southeast-6 | 0.644 |  |
| ap-southeast-7 | 0.833 |  |
| ca-central-1 | 0.294 | 16 |
| ca-west-1 | 0.187 |  |
| eu-central-1 | 0.577 |  |
| eu-central-2 | 0.597 |  |
| eu-north-1 | 0.614 |  |
| eu-south-1 | 0.619 |  |
| eu-south-2 | 0.601 |  |
| eu-west-1 | 0.496 |  |
| eu-west-2 | 0.518 |  |
| eu-west-3 | 0.550 |  |
| il-central-1 | 0.725 |  |
| me-central-1 | 0.941 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.679 |  |
| us-east-1 | 0.238 | 4762 |
| us-east-2 | 0.207 | 1634 |
| us-gov-east-1 | 0.220 | 1713 |
| us-gov-west-1 | 0.137 | 198 |
| us-west-1 | 0.080 | 3673 |
| us-west-2 | 0.136 | 163 |

