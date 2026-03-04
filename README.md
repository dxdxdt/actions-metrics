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
Updated: 2026-03-04T14:34:10.084017+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.995 |  |
| ap-east-1 | 0.696 |  |
| ap-east-2 | 0.638 |  |
| ap-northeast-1 | 0.516 |  |
| ap-northeast-2 | 0.623 |  |
| ap-northeast-3 | 0.540 |  |
| ap-south-1 | 0.923 |  |
| ap-south-2 | 0.937 |  |
| ap-southeast-1 | 0.770 |  |
| ap-southeast-2 | 0.673 |  |
| ap-southeast-3 | 0.826 |  |
| ap-southeast-4 | 0.713 |  |
| ap-southeast-5 | 0.793 |  |
| ap-southeast-6 | 0.756 |  |
| ap-southeast-7 | 0.875 |  |
| ca-central-1 | 0.210 | 16 |
| ca-west-1 | 0.234 |  |
| eu-central-1 | 0.511 |  |
| eu-central-2 | 0.534 |  |
| eu-north-1 | 0.564 |  |
| eu-south-1 | 0.548 |  |
| eu-south-2 | 0.555 |  |
| eu-west-1 | 0.432 |  |
| eu-west-2 | 0.465 |  |
| eu-west-3 | 0.490 |  |
| il-central-1 | 0.688 |  |
| me-central-1 | 0.885 |  |
| me-south-1 | 0.853 |  |
| mx-central-1 | 0.212 |  |
| sa-east-1 | 0.617 |  |
| us-east-1 | 0.168 | 4217 |
| us-east-2 | 0.182 | 1397 |
| us-gov-east-1 | 0.154 | 1529 |
| us-gov-west-1 | 0.178 | 170 |
| us-west-1 | 0.160 | 3171 |
| us-west-2 | 0.178 | 140 |

