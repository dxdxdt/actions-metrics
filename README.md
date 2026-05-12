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
Updated: 2026-05-12T08:42:50.836087+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.979 |  |
| ap-east-1 | 0.720 |  |
| ap-east-2 | 0.650 |  |
| ap-northeast-1 | 0.539 |  |
| ap-northeast-2 | 0.636 |  |
| ap-northeast-3 | 0.550 |  |
| ap-south-1 | 0.896 |  |
| ap-south-2 | 0.894 |  |
| ap-southeast-1 | 0.788 |  |
| ap-southeast-2 | 0.693 |  |
| ap-southeast-3 | 0.848 |  |
| ap-southeast-4 | 0.730 |  |
| ap-southeast-5 | 0.818 |  |
| ap-southeast-6 | 0.737 |  |
| ap-southeast-7 | 0.887 |  |
| ca-central-1 | 0.214 | 16 |
| ca-west-1 | 0.237 |  |
| eu-central-1 | 0.499 |  |
| eu-central-2 | 0.506 |  |
| eu-north-1 | 0.534 |  |
| eu-south-1 | 0.526 |  |
| eu-south-2 | 0.512 |  |
| eu-west-1 | 0.411 |  |
| eu-west-2 | 0.441 |  |
| eu-west-3 | 0.461 |  |
| il-central-1 | 0.641 |  |
| me-central-1 | 0.893 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.599 |  |
| us-east-1 | 0.157 | 4629 |
| us-east-2 | 0.167 | 1589 |
| us-gov-east-1 | 0.155 | 1686 |
| us-gov-west-1 | 0.221 | 195 |
| us-west-1 | 0.161 | 3553 |
| us-west-2 | 0.286 | 158 |

