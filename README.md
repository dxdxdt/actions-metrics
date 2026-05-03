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
Updated: 2026-05-03T18:47:00.489031+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.030 |  |
| ap-east-1 | 0.677 |  |
| ap-east-2 | 0.614 |  |
| ap-northeast-1 | 0.493 |  |
| ap-northeast-2 | 0.615 |  |
| ap-northeast-3 | 0.525 |  |
| ap-south-1 | 0.875 |  |
| ap-south-2 | 0.867 |  |
| ap-southeast-1 | 0.749 |  |
| ap-southeast-2 | 0.634 |  |
| ap-southeast-3 | 0.808 |  |
| ap-southeast-4 | 0.673 |  |
| ap-southeast-5 | 0.768 |  |
| ap-southeast-6 | 0.730 |  |
| ap-southeast-7 | 0.853 |  |
| ca-central-1 | 0.254 | 16 |
| ca-west-1 | 0.215 |  |
| eu-central-1 | 0.560 |  |
| eu-central-2 | 0.567 |  |
| eu-north-1 | 0.582 |  |
| eu-south-1 | 0.560 |  |
| eu-south-2 | 0.579 |  |
| eu-west-1 | 0.455 |  |
| eu-west-2 | 0.491 |  |
| eu-west-3 | 0.522 |  |
| il-central-1 | 0.704 |  |
| me-central-1 | 0.921 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.655 |  |
| us-east-1 | 0.212 | 4591 |
| us-east-2 | 0.183 | 1561 |
| us-gov-east-1 | 0.195 | 1671 |
| us-gov-west-1 | 0.164 | 194 |
| us-west-1 | 0.104 | 3527 |
| us-west-2 | 0.161 | 157 |

