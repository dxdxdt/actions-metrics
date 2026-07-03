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
Updated: 2026-07-03T19:05:44.834120+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.978 |  |
| ap-east-1 | 0.700 |  |
| ap-east-2 | 0.641 |  |
| ap-northeast-1 | 0.525 |  |
| ap-northeast-2 | 0.623 |  |
| ap-northeast-3 | 0.548 |  |
| ap-south-1 | 0.916 |  |
| ap-south-2 | 0.919 |  |
| ap-southeast-1 | 0.775 |  |
| ap-southeast-2 | 0.688 |  |
| ap-southeast-3 | 0.831 |  |
| ap-southeast-4 | 0.728 |  |
| ap-southeast-5 | 0.797 |  |
| ap-southeast-6 | 0.705 |  |
| ap-southeast-7 | 0.878 |  |
| ca-central-1 | 0.182 | 16 |
| ca-west-1 | 0.229 |  |
| eu-central-1 | 0.493 |  |
| eu-central-2 | 0.522 |  |
| eu-north-1 | 0.540 |  |
| eu-south-1 | 0.521 |  |
| eu-south-2 | 0.526 |  |
| eu-west-1 | 0.409 |  |
| eu-west-2 | 0.439 |  |
| eu-west-3 | 0.477 |  |
| il-central-1 | 0.644 |  |
| me-central-1 | 0.889 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.199 |  |
| sa-east-1 | 0.610 |  |
| us-east-1 | 0.159 | 4813 |
| us-east-2 | 0.111 | 1652 |
| us-gov-east-1 | 0.121 | 1728 |
| us-gov-west-1 | 0.199 | 200 |
| us-west-1 | 0.141 | 3735 |
| us-west-2 | 0.195 | 164 |

