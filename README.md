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
Updated: 2025-11-11T08:18:17.346274+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.022 |  |
| ap-east-1 | 0.705 |  |
| ap-northeast-1 | 0.509 |  |
| ap-northeast-2 | 0.618 |  |
| ap-south-1 | 0.886 |  |
| ap-southeast-1 | 0.765 |  |
| ap-southeast-2 | 0.645 |  |
| ca-central-1 | 0.248 | 15 |
| eu-central-1 | 0.542 |  |
| eu-north-1 | 0.584 |  |
| eu-south-1 | 0.560 |  |
| eu-west-1 | 0.461 |  |
| eu-west-2 | 0.507 |  |
| eu-west-3 | 0.522 |  |
| me-south-1 | 0.893 |  |
| sa-east-1 | 0.646 |  |
| us-east-1 | 0.195 | 3481 |
| us-east-2 | 0.194 | 1035 |
| us-gov-east-1 | 0.192 | 1158 |
| us-gov-west-1 | 0.167 | 74 |
| us-west-1 | 0.120 | 2408 |
| us-west-2 | 0.171 | 30 |

