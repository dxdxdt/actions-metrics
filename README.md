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
Updated: 2026-03-19T20:29:25.310374+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.072 |  |
| ap-east-1 | 0.645 |  |
| ap-east-2 | 0.583 |  |
| ap-northeast-1 | 0.463 |  |
| ap-northeast-2 | 0.569 |  |
| ap-northeast-3 | 0.487 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.722 |  |
| ap-southeast-2 | 0.605 |  |
| ap-southeast-3 | 0.772 |  |
| ap-southeast-4 | 0.645 |  |
| ap-southeast-5 | 0.738 |  |
| ap-southeast-6 | 0.645 |  |
| ap-southeast-7 | 0.820 |  |
| ca-central-1 | 0.286 | 16 |
| ca-west-1 | 0.190 |  |
| eu-central-1 | 0.571 |  |
| eu-central-2 | 0.588 |  |
| eu-north-1 | 0.629 |  |
| eu-south-1 | 0.588 |  |
| eu-south-2 | 0.597 |  |
| eu-west-1 | 0.497 |  |
| eu-west-2 | 0.539 |  |
| eu-west-3 | 0.539 |  |
| il-central-1 | 0.760 |  |
| me-central-1 | 0.962 |  |
| me-south-1 | 0.914 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.682 |  |
| us-east-1 | 0.237 | 4310 |
| us-east-2 | 0.218 | 1437 |
| us-gov-east-1 | 0.217 | 1589 |
| us-gov-west-1 | 0.136 | 189 |
| us-west-1 | 0.079 | 3261 |
| us-west-2 | 0.138 | 148 |

