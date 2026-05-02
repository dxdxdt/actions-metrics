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
Updated: 2026-05-02T17:38:50.122277+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.951 |  |
| ap-east-1 | 0.749 |  |
| ap-east-2 | 0.685 |  |
| ap-northeast-1 | 0.571 |  |
| ap-northeast-2 | 0.677 |  |
| ap-northeast-3 | 0.598 |  |
| ap-south-1 | 0.825 |  |
| ap-south-2 | 0.856 |  |
| ap-southeast-1 | 0.824 |  |
| ap-southeast-2 | 0.746 |  |
| ap-southeast-3 | 0.881 |  |
| ap-southeast-4 | 0.785 |  |
| ap-southeast-5 | 0.839 |  |
| ap-southeast-6 | 0.779 |  |
| ap-southeast-7 | 0.928 |  |
| ca-central-1 | 0.165 | 16 |
| ca-west-1 | 0.235 |  |
| eu-central-1 | 0.464 |  |
| eu-central-2 | 0.468 |  |
| eu-north-1 | 0.507 |  |
| eu-south-1 | 0.476 |  |
| eu-south-2 | 0.483 |  |
| eu-west-1 | 0.369 |  |
| eu-west-2 | 0.401 |  |
| eu-west-3 | 0.439 |  |
| il-central-1 | 0.607 |  |
| me-central-1 | 0.902 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.556 |  |
| us-east-1 | 0.114 | 4586 |
| us-east-2 | 0.119 | 1558 |
| us-gov-east-1 | 0.123 | 1670 |
| us-gov-west-1 | 0.258 | 194 |
| us-west-1 | 0.210 | 3518 |
| us-west-2 | 0.246 | 157 |

