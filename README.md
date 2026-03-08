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
Updated: 2026-03-08T06:34:12.058804+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.026 |  |
| ap-east-1 | 0.677 |  |
| ap-east-2 | 0.620 |  |
| ap-northeast-1 | 0.497 |  |
| ap-northeast-2 | 0.610 |  |
| ap-northeast-3 | 0.523 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.749 |  |
| ap-southeast-2 | 0.639 |  |
| ap-southeast-3 | 0.804 |  |
| ap-southeast-4 | 0.679 |  |
| ap-southeast-5 | 0.773 |  |
| ap-southeast-6 | 0.682 |  |
| ap-southeast-7 | 0.856 |  |
| ca-central-1 | 0.241 | 16 |
| ca-west-1 | 0.202 |  |
| eu-central-1 | 0.532 |  |
| eu-central-2 | 0.555 |  |
| eu-north-1 | 0.575 |  |
| eu-south-1 | 0.568 |  |
| eu-south-2 | 0.576 |  |
| eu-west-1 | 0.446 |  |
| eu-west-2 | 0.498 |  |
| eu-west-3 | 0.523 |  |
| il-central-1 | 0.710 |  |
| me-central-1 | 0.913 |  |
| me-south-1 | 0.871 |  |
| mx-central-1 | 0.248 |  |
| sa-east-1 | 0.637 |  |
| us-east-1 | 0.205 | 4238 |
| us-east-2 | 0.195 | 1408 |
| us-gov-east-1 | 0.194 | 1542 |
| us-gov-west-1 | 0.161 | 174 |
| us-west-1 | 0.111 | 3194 |
| us-west-2 | 0.164 | 143 |

