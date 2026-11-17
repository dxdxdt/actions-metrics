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
Updated: 2026-11-17T01:20:41.267196+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.755 |  |
| ap-east-1 | 0.508 |  |
| ap-east-2 | 0.462 |  |
| ap-northeast-1 | 0.384 |  |
| ap-northeast-2 | 0.438 |  |
| ap-northeast-3 | 0.385 |  |
| ap-south-1 | 0.675 |  |
| ap-south-2 | 0.676 |  |
| ap-southeast-1 | 0.582 |  |
| ap-southeast-2 | 0.495 |  |
| ap-southeast-3 | 0.623 |  |
| ap-southeast-4 | 0.539 |  |
| ap-southeast-5 | 0.595 |  |
| ap-southeast-6 | 0.540 |  |
| ap-southeast-7 | 0.655 |  |
| ca-central-1 | 0.145 | 18 |
| ca-west-1 | 0.114 |  |
| eu-central-1 | 0.381 |  |
| eu-central-2 | 0.390 |  |
| eu-north-1 | 0.415 |  |
| eu-south-1 | 0.401 |  |
| eu-south-2 | 0.397 |  |
| eu-west-1 | 0.316 |  |
| eu-west-2 | 0.346 |  |
| eu-west-3 | 0.365 |  |
| il-central-1 | 0.498 |  |
| me-central-1 | 0.682 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.672 |  |
| mx-central-1 | 0.173 |  |
| sa-east-1 | 0.470 |  |
| us-east-1 | 0.123 | 5187 |
| us-east-2 | 0.117 | 1729 |
| us-gov-east-1 | 0.119 | 1962 |
| us-gov-west-1 | 0.106 | 247 |
| us-west-1 | 0.113 | 4218 |
| us-west-2 | 0.110 | 198 |

