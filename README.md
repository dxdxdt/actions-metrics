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
Updated: 2026-01-24T03:21:32.611175+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.965 |  |
| ap-east-1 | 0.736 |  |
| ap-northeast-1 | 0.535 |  |
| ap-northeast-2 | 0.640 |  |
| ap-south-1 | 0.881 |  |
| ap-southeast-1 | 0.794 |  |
| ap-southeast-2 | 0.701 |  |
| ca-central-1 | 0.194 | 16 |
| ca-west-1 | 0.234 |  |
| eu-central-1 | 0.475 |  |
| eu-north-1 | 0.526 |  |
| eu-south-1 | 0.498 |  |
| eu-west-1 | 0.394 |  |
| eu-west-2 | 0.428 |  |
| eu-west-3 | 0.450 |  |
| me-south-1 | 0.804 |  |
| sa-east-1 | 0.576 |  |
| us-east-1 | 0.137 | 3990 |
| us-east-2 | 0.148 | 1275 |
| us-gov-east-1 | 0.152 | 1398 |
| us-gov-west-1 | 0.217 | 125 |
| us-west-1 | 0.175 | 2916 |
| us-west-2 | 0.229 | 110 |

