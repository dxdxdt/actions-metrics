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
Updated: 2026-05-26T07:37:47.672994+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.047 |  |
| ap-east-1 | 0.651 |  |
| ap-east-2 | 0.588 |  |
| ap-northeast-1 | 0.469 |  |
| ap-northeast-2 | 0.577 |  |
| ap-northeast-3 | 0.495 |  |
| ap-south-1 | 0.934 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.724 |  |
| ap-southeast-2 | 0.625 |  |
| ap-southeast-3 | 0.778 |  |
| ap-southeast-4 | 0.663 |  |
| ap-southeast-5 | 0.748 |  |
| ap-southeast-6 | 0.667 |  |
| ap-southeast-7 | 0.830 |  |
| ca-central-1 | 0.290 | 16 |
| ca-west-1 | 0.290 |  |
| eu-central-1 | 0.554 |  |
| eu-central-2 | 0.591 |  |
| eu-north-1 | 0.582 |  |
| eu-south-1 | 0.588 |  |
| eu-south-2 | 0.587 |  |
| eu-west-1 | 0.470 |  |
| eu-west-2 | 0.510 |  |
| eu-west-3 | 0.528 |  |
| il-central-1 | 0.712 |  |
| me-central-1 | 0.972 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.206 |  |
| sa-east-1 | 0.671 |  |
| us-east-1 | 0.223 | 4688 |
| us-east-2 | 0.211 | 1611 |
| us-gov-east-1 | 0.188 | 1706 |
| us-gov-west-1 | 0.153 | 195 |
| us-west-1 | 0.086 | 3605 |
| us-west-2 | 0.145 | 160 |

