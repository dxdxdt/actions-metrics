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
Updated: 2025-11-13T08:18:23.248248+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.047 |  |
| ap-east-1 | 0.685 |  |
| ap-northeast-1 | 0.487 |  |
| ap-northeast-2 | 0.597 |  |
| ap-south-1 | 0.883 |  |
| ap-southeast-1 | 0.743 |  |
| ap-southeast-2 | 0.625 |  |
| ca-central-1 | 0.254 | 15 |
| eu-central-1 | 0.560 |  |
| eu-north-1 | 0.609 |  |
| eu-south-1 | 0.582 |  |
| eu-west-1 | 0.488 |  |
| eu-west-2 | 0.513 |  |
| eu-west-3 | 0.543 |  |
| me-south-1 | 0.920 |  |
| sa-east-1 | 0.661 |  |
| us-east-1 | 0.215 | 3497 |
| us-east-2 | 0.189 | 1043 |
| us-gov-east-1 | 0.190 | 1161 |
| us-gov-west-1 | 0.145 | 74 |
| us-west-1 | 0.106 | 2424 |
| us-west-2 | 0.147 | 31 |

