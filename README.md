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
Updated: 2026-11-26T13:24:09.065572+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.780 |  |
| ap-east-1 | 0.478 |  |
| ap-east-2 | 0.433 |  |
| ap-northeast-1 | 0.344 |  |
| ap-northeast-2 | 0.413 |  |
| ap-northeast-3 | 0.355 |  |
| ap-south-1 | 0.706 |  |
| ap-south-2 | 0.691 |  |
| ap-southeast-1 | 0.556 |  |
| ap-southeast-2 | 0.470 |  |
| ap-southeast-3 | 0.593 |  |
| ap-southeast-4 | 0.516 |  |
| ap-southeast-5 | 0.565 |  |
| ap-southeast-6 | 0.511 |  |
| ap-southeast-7 | 0.629 |  |
| ca-central-1 | 0.169 | 18 |
| ca-west-1 | 0.119 |  |
| eu-central-1 | 0.413 |  |
| eu-central-2 | 0.416 |  |
| eu-north-1 | 0.445 |  |
| eu-south-1 | 0.427 |  |
| eu-south-2 | 0.420 |  |
| eu-west-1 | 0.346 |  |
| eu-west-2 | 0.375 |  |
| eu-west-3 | 0.395 |  |
| il-central-1 | 0.530 |  |
| me-central-1 | 0.720 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.713 |  |
| mx-central-1 | 0.162 |  |
| sa-east-1 | 0.498 |  |
| sa-west-1 | 0.506 |  |
| us-east-1 | 0.155 | 5195 |
| us-east-2 | 0.132 | 1731 |
| us-gov-east-1 | 0.141 | 1967 |
| us-gov-west-1 | 0.076 | 251 |
| us-west-1 | 0.089 | 4226 |
| us-west-2 | 0.075 | 200 |

