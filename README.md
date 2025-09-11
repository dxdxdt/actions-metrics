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
Updated: 2025-09-11T02:22:10.297903+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.027 |  |
| ap-east-1 | 0.702 |  |
| ap-northeast-1 | 0.502 |  |
| ap-northeast-2 | 0.610 |  |
| ap-south-1 | 1.022 |  |
| ap-southeast-1 | 0.760 |  |
| ap-southeast-2 | 0.647 |  |
| ca-central-1 | 0.241 | 13 |
| eu-central-1 | 0.548 |  |
| eu-north-1 | 0.584 |  |
| eu-south-1 | 0.577 |  |
| eu-west-1 | 0.463 |  |
| eu-west-2 | 0.504 |  |
| eu-west-3 | 0.526 |  |
| me-south-1 | 0.901 |  |
| sa-east-1 | 0.646 |  |
| us-east-1 | 0.193 | 3037 |
| us-east-2 | 0.234 | 802 |
| us-gov-east-1 | 0.200 | 927 |
| us-gov-west-1 | 0.162 | 15 |
| us-west-1 | 0.127 | 2017 |
| us-west-2 | 0.167 | 3 |

