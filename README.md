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
Updated: 2025-07-13T08:16:05.232408+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.973 |  |
| ap-east-1 | 0.768 |  |
| ap-northeast-1 | 0.573 |  |
| ap-northeast-2 | 0.677 |  |
| ap-south-1 | 0.855 |  |
| ap-southeast-1 | 0.828 |  |
| ap-southeast-2 | 0.702 |  |
| ca-central-1 | 0.192 | 11 |
| eu-central-1 | 0.491 |  |
| eu-north-1 | 0.532 |  |
| eu-south-1 | 0.511 |  |
| eu-west-1 | 0.404 |  |
| eu-west-2 | 0.444 |  |
| eu-west-3 | 0.463 |  |
| me-south-1 | 0.864 |  |
| sa-east-1 | 0.588 |  |
| us-east-1 | 0.152 | 2434 |
| us-east-2 | 0.152 | 597 |
| us-gov-east-1 | 0.155 | 788 |
| us-gov-west-1 | 0.223 | 1 |
| us-west-1 | 0.176 | 1650 |
| us-west-2 | 0.224 |  |

