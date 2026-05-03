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
Updated: 2026-05-03T17:41:05.933195+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.958 |  |
| ap-east-1 | 0.734 |  |
| ap-east-2 | 0.674 |  |
| ap-northeast-1 | 0.542 |  |
| ap-northeast-2 | 0.678 |  |
| ap-northeast-3 | 0.583 |  |
| ap-south-1 | 0.851 |  |
| ap-south-2 | 0.871 |  |
| ap-southeast-1 | 0.811 |  |
| ap-southeast-2 | 0.705 |  |
| ap-southeast-3 | 0.857 |  |
| ap-southeast-4 | 0.746 |  |
| ap-southeast-5 | 0.828 |  |
| ap-southeast-6 | 0.796 |  |
| ap-southeast-7 | 0.911 |  |
| ca-central-1 | 0.184 | 16 |
| ca-west-1 | 0.261 |  |
| eu-central-1 | 0.489 |  |
| eu-central-2 | 0.497 |  |
| eu-north-1 | 0.526 |  |
| eu-south-1 | 0.505 |  |
| eu-south-2 | 0.509 |  |
| eu-west-1 | 0.396 |  |
| eu-west-2 | 0.432 |  |
| eu-west-3 | 0.449 |  |
| il-central-1 | 0.632 |  |
| me-central-1 | 0.847 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.582 |  |
| us-east-1 | 0.144 | 4591 |
| us-east-2 | 0.142 | 1561 |
| us-gov-east-1 | 0.150 | 1671 |
| us-gov-west-1 | 0.235 | 194 |
| us-west-1 | 0.170 | 3526 |
| us-west-2 | 0.233 | 157 |

