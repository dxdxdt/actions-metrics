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
Updated: 2026-04-19T23:29:47.619348+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.964 |  |
| ap-east-1 | 0.719 |  |
| ap-east-2 | 0.660 |  |
| ap-northeast-1 | 0.535 |  |
| ap-northeast-2 | 0.643 |  |
| ap-northeast-3 | 0.563 |  |
| ap-south-1 | 0.888 |  |
| ap-south-2 | 0.902 |  |
| ap-southeast-1 | 0.801 |  |
| ap-southeast-2 | 0.707 |  |
| ap-southeast-3 | 0.853 |  |
| ap-southeast-4 | 0.750 |  |
| ap-southeast-5 | 0.819 |  |
| ap-southeast-6 | 0.752 |  |
| ap-southeast-7 | 0.902 |  |
| ca-central-1 | 0.201 | 16 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.475 |  |
| eu-central-2 | 0.495 |  |
| eu-north-1 | 0.518 |  |
| eu-south-1 | 0.499 |  |
| eu-south-2 | 0.500 |  |
| eu-west-1 | 0.390 |  |
| eu-west-2 | 0.427 |  |
| eu-west-3 | 0.449 |  |
| il-central-1 | 0.653 |  |
| me-central-1 | 0.847 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.576 |  |
| us-east-1 | 0.136 | 4529 |
| us-east-2 | 0.156 | 1516 |
| us-gov-east-1 | 0.155 | 1657 |
| us-gov-west-1 | 0.228 | 194 |
| us-west-1 | 0.176 | 3446 |
| us-west-2 | 0.234 | 156 |

