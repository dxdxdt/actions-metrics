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
Updated: 2026-04-17T01:52:13.520583+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.056 |  |
| ap-east-1 | 0.643 |  |
| ap-east-2 | 0.576 |  |
| ap-northeast-1 | 0.463 |  |
| ap-northeast-2 | 0.566 |  |
| ap-northeast-3 | 0.486 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.718 |  |
| ap-southeast-2 | 0.613 |  |
| ap-southeast-3 | 0.770 |  |
| ap-southeast-4 | 0.651 |  |
| ap-southeast-5 | 0.739 |  |
| ap-southeast-6 | 0.643 |  |
| ap-southeast-7 | 0.823 |  |
| ca-central-1 | 0.284 | 16 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.563 |  |
| eu-central-2 | 0.584 |  |
| eu-north-1 | 0.625 |  |
| eu-south-1 | 0.593 |  |
| eu-south-2 | 0.605 |  |
| eu-west-1 | 0.502 |  |
| eu-west-2 | 0.526 |  |
| eu-west-3 | 0.540 |  |
| il-central-1 | 0.749 |  |
| me-central-1 | 0.958 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.694 |  |
| us-east-1 | 0.226 | 4512 |
| us-east-2 | 0.215 | 1506 |
| us-gov-east-1 | 0.212 | 1652 |
| us-gov-west-1 | 0.139 | 193 |
| us-west-1 | 0.079 | 3424 |
| us-west-2 | 0.140 | 156 |

