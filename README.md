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
Updated: 2026-04-17T23:33:10.733622+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.038 |  |
| ap-east-1 | 0.660 |  |
| ap-east-2 | 0.594 |  |
| ap-northeast-1 | 0.480 |  |
| ap-northeast-2 | 0.580 |  |
| ap-northeast-3 | 0.502 |  |
| ap-south-1 | 0.914 |  |
| ap-south-2 | 0.900 |  |
| ap-southeast-1 | 0.734 |  |
| ap-southeast-2 | 0.630 |  |
| ap-southeast-3 | 0.792 |  |
| ap-southeast-4 | 0.669 |  |
| ap-southeast-5 | 0.754 |  |
| ap-southeast-6 | 0.669 |  |
| ap-southeast-7 | 0.833 |  |
| ca-central-1 | 0.273 | 16 |
| ca-west-1 | 0.210 |  |
| eu-central-1 | 0.555 |  |
| eu-central-2 | 0.572 |  |
| eu-north-1 | 0.597 |  |
| eu-south-1 | 0.583 |  |
| eu-south-2 | 0.576 |  |
| eu-west-1 | 0.463 |  |
| eu-west-2 | 0.516 |  |
| eu-west-3 | 0.522 |  |
| il-central-1 | 0.716 |  |
| me-central-1 | 0.913 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.659 |  |
| us-east-1 | 0.217 | 4518 |
| us-east-2 | 0.202 | 1510 |
| us-gov-east-1 | 0.220 | 1654 |
| us-gov-west-1 | 0.158 | 194 |
| us-west-1 | 0.099 | 3427 |
| us-west-2 | 0.160 | 156 |

