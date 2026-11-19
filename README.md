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
Updated: 2026-11-19T08:12:58.728655+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.688 |  |
| ap-east-1 | 0.555 |  |
| ap-east-2 | 0.510 |  |
| ap-northeast-1 | 0.420 |  |
| ap-northeast-2 | 0.493 |  |
| ap-northeast-3 | 0.440 |  |
| ap-south-1 | 0.674 |  |
| ap-south-2 | 0.686 |  |
| ap-southeast-1 | 0.615 |  |
| ap-southeast-2 | 0.541 |  |
| ap-southeast-3 | 0.654 |  |
| ap-southeast-4 | 0.610 |  |
| ap-southeast-5 | 0.627 |  |
| ap-southeast-6 | 0.559 |  |
| ap-southeast-7 | 0.691 |  |
| ca-central-1 | 0.120 | 18 |
| ca-west-1 | 0.217 |  |
| eu-central-1 | 0.338 |  |
| eu-central-2 | 0.360 |  |
| eu-north-1 | 0.390 |  |
| eu-south-1 | 0.359 |  |
| eu-south-2 | 0.347 |  |
| eu-west-1 | 0.282 |  |
| eu-west-2 | 0.311 |  |
| eu-west-3 | 0.326 |  |
| il-central-1 | 0.464 |  |
| me-central-1 | 0.607 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.650 |  |
| mx-central-1 | 0.175 |  |
| sa-east-1 | 0.426 |  |
| us-east-1 | 0.086 | 5190 |
| us-east-2 | 0.101 | 1730 |
| us-gov-east-1 | 0.112 | 1962 |
| us-gov-west-1 | 0.181 | 247 |
| us-west-1 | 0.148 | 4220 |
| us-west-2 | 0.182 | 199 |

