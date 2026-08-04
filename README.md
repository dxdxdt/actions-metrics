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
Updated: 2026-08-04T22:55:05.460500+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.040 |  |
| ap-east-1 | 0.646 |  |
| ap-east-2 | 0.585 |  |
| ap-northeast-1 | 0.470 |  |
| ap-northeast-2 | 0.578 |  |
| ap-northeast-3 | 0.495 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.875 |  |
| ap-southeast-1 | 0.721 |  |
| ap-southeast-2 | 0.621 |  |
| ap-southeast-3 | 0.774 |  |
| ap-southeast-4 | 0.665 |  |
| ap-southeast-5 | 0.742 |  |
| ap-southeast-6 | 0.652 |  |
| ap-southeast-7 | 0.825 |  |
| ca-central-1 | 0.282 | 17 |
| ca-west-1 | 0.208 |  |
| eu-central-1 | 0.555 |  |
| eu-central-2 | 0.578 |  |
| eu-north-1 | 0.597 |  |
| eu-south-1 | 0.588 |  |
| eu-south-2 | 0.594 |  |
| eu-west-1 | 0.494 |  |
| eu-west-2 | 0.516 |  |
| eu-west-3 | 0.537 |  |
| il-central-1 | 0.719 |  |
| me-central-1 | 0.933 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.252 |  |
| sa-east-1 | 0.679 |  |
| us-east-1 | 0.241 | 4939 |
| us-east-2 | 0.216 | 1674 |
| us-gov-east-1 | 0.211 | 1801 |
| us-gov-west-1 | 0.136 | 211 |
| us-west-1 | 0.102 | 3884 |
| us-west-2 | 0.135 | 172 |

