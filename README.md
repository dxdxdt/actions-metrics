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
Updated: 2026-02-11T20:31:21.425840+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.972 |  |
| ap-east-1 | 0.725 |  |
| ap-northeast-1 | 0.548 |  |
| ap-northeast-2 | 0.655 |  |
| ap-south-1 | 0.894 |  |
| ap-south-2 | 0.940 |  |
| ap-southeast-1 | 0.804 |  |
| ap-southeast-2 | 0.706 |  |
| ap-southeast-3 | 0.857 |  |
| ap-southeast-4 | 0.746 |  |
| ca-central-1 | 0.165 | 16 |
| ca-west-1 | 0.222 |  |
| eu-central-1 | 0.470 |  |
| eu-central-2 | 0.489 |  |
| eu-north-1 | 0.524 |  |
| eu-south-1 | 0.506 |  |
| eu-south-2 | 0.502 |  |
| eu-west-1 | 0.396 |  |
| eu-west-2 | 0.427 |  |
| eu-west-3 | 0.463 |  |
| il-central-1 | 0.661 |  |
| me-central-1 | 0.851 |  |
| me-south-1 | 0.841 |  |
| sa-east-1 | 0.579 |  |
| us-east-1 | 0.135 | 4106 |
| us-east-2 | 0.124 | 1332 |
| us-gov-east-1 | 0.128 | 1452 |
| us-gov-west-1 | 0.215 | 143 |
| us-west-1 | 0.193 | 3042 |
| us-west-2 | 0.216 | 125 |

