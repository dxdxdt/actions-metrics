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
Updated: 2026-08-24T10:30:05.179830+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.054 |  |
| ap-east-1 | 0.644 |  |
| ap-east-2 | 0.590 |  |
| ap-northeast-1 | 0.469 |  |
| ap-northeast-2 | 0.568 |  |
| ap-northeast-3 | 0.492 |  |
| ap-south-1 | 0.909 |  |
| ap-south-2 | 0.896 |  |
| ap-southeast-1 | 0.725 |  |
| ap-southeast-2 | 0.608 |  |
| ap-southeast-3 | 0.790 |  |
| ap-southeast-4 | 0.650 |  |
| ap-southeast-5 | 0.740 |  |
| ap-southeast-6 | 0.636 |  |
| ap-southeast-7 | 0.823 |  |
| ca-central-1 | 0.292 | 18 |
| ca-west-1 | 0.170 |  |
| eu-central-1 | 0.572 |  |
| eu-central-2 | 0.598 |  |
| eu-north-1 | 0.635 |  |
| eu-south-1 | 0.600 |  |
| eu-south-2 | 0.617 |  |
| eu-west-1 | 0.506 |  |
| eu-west-2 | 0.536 |  |
| eu-west-3 | 0.557 |  |
| il-central-1 | 0.738 |  |
| me-central-1 | 0.967 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.701 |  |
| us-east-1 | 0.243 | 5051 |
| us-east-2 | 0.248 | 1682 |
| us-gov-east-1 | 0.227 | 1878 |
| us-gov-west-1 | 0.117 | 226 |
| us-west-1 | 0.087 | 4045 |
| us-west-2 | 0.115 | 186 |

