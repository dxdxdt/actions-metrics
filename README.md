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
Updated: 2026-06-14T17:12:05.348411+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.038 |  |
| ap-east-1 | 0.643 |  |
| ap-east-2 | 0.580 |  |
| ap-northeast-1 | 0.467 |  |
| ap-northeast-2 | 0.574 |  |
| ap-northeast-3 | 0.490 |  |
| ap-south-1 | 0.930 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.718 |  |
| ap-southeast-2 | 0.608 |  |
| ap-southeast-3 | 0.773 |  |
| ap-southeast-4 | 0.649 |  |
| ap-southeast-5 | 0.740 |  |
| ap-southeast-6 | 0.637 |  |
| ap-southeast-7 | 0.825 |  |
| ca-central-1 | 0.283 | 16 |
| ca-west-1 | 0.198 |  |
| eu-central-1 | 0.560 |  |
| eu-central-2 | 0.594 |  |
| eu-north-1 | 0.613 |  |
| eu-south-1 | 0.603 |  |
| eu-south-2 | 0.597 |  |
| eu-west-1 | 0.481 |  |
| eu-west-2 | 0.521 |  |
| eu-west-3 | 0.541 |  |
| il-central-1 | 0.722 |  |
| me-central-1 | 0.941 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.679 |  |
| us-east-1 | 0.233 | 4757 |
| us-east-2 | 0.199 | 1633 |
| us-gov-east-1 | 0.206 | 1712 |
| us-gov-west-1 | 0.128 | 198 |
| us-west-1 | 0.074 | 3666 |
| us-west-2 | 0.130 | 163 |

