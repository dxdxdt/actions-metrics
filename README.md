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
Updated: 2025-03-15T21:11:33.906134+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.075 |  |
| ap-east-1 | 0.644 |  |
| ap-northeast-1 | 0.448 |  |
| ap-northeast-2 | 0.551 |  |
| ap-south-1 | 0.901 |  |
| ap-southeast-1 | 0.706 |  |
| ap-southeast-2 | 0.575 |  |
| ca-central-1 | 0.319 | 10 |
| eu-central-1 | 0.629 |  |
| eu-north-1 | 0.680 |  |
| eu-south-1 | 0.647 |  |
| eu-west-1 | 0.540 |  |
| eu-west-2 | 0.585 |  |
| eu-west-3 | 0.602 |  |
| me-south-1 | 0.976 |  |
| sa-east-1 | 0.704 |  |
| us-east-1 | 0.284 | 1279 |
| us-east-2 | 0.252 | 322 |
| us-gov-east-1 | 0.242 | 326 |
| us-gov-west-1 | 0.108 | 1 |
| us-west-1 | 0.052 | 868 |
| us-west-2 | 0.114 |  |

