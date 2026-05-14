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
Updated: 2026-05-14T09:29:10.980733+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.900 |  |
| ap-east-1 | 0.808 |  |
| ap-east-2 | 0.727 |  |
| ap-northeast-1 | 0.601 |  |
| ap-northeast-2 | 0.720 |  |
| ap-northeast-3 | 0.635 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.867 |  |
| ap-southeast-2 | 0.762 |  |
| ap-southeast-3 | 0.928 |  |
| ap-southeast-4 | 0.822 |  |
| ap-southeast-5 | 0.905 |  |
| ap-southeast-6 | 0.863 |  |
| ap-southeast-7 | 0.976 |  |
| ca-central-1 | 0.114 | 16 |
| ca-west-1 | 0.275 |  |
| eu-central-1 | 0.418 |  |
| eu-central-2 | 0.442 |  |
| eu-north-1 | 0.470 |  |
| eu-south-1 | 0.452 |  |
| eu-south-2 | 0.450 |  |
| eu-west-1 | 0.341 |  |
| eu-west-2 | 0.373 |  |
| eu-west-3 | 0.394 |  |
| il-central-1 | 0.580 |  |
| me-central-1 | 0.824 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.522 |  |
| us-east-1 | 0.076 | 4635 |
| us-east-2 | 0.085 | 1592 |
| us-gov-east-1 | 0.094 | 1689 |
| us-gov-west-1 | 0.281 | 195 |
| us-west-1 | 0.236 | 3561 |
| us-west-2 | 0.283 | 158 |

