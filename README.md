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
Updated: 2026-06-29T19:46:02.058047+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.976 |  |
| ap-east-1 | 0.699 |  |
| ap-east-2 | 0.637 |  |
| ap-northeast-1 | 0.518 |  |
| ap-northeast-2 | 0.623 |  |
| ap-northeast-3 | 0.543 |  |
| ap-south-1 | 0.888 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.776 |  |
| ap-southeast-2 | 0.665 |  |
| ap-southeast-3 | 0.834 |  |
| ap-southeast-4 | 0.720 |  |
| ap-southeast-5 | 0.796 |  |
| ap-southeast-6 | 0.711 |  |
| ap-southeast-7 | 0.881 |  |
| ca-central-1 | 0.235 | 16 |
| ca-west-1 | 0.237 |  |
| eu-central-1 | 0.492 |  |
| eu-central-2 | 0.525 |  |
| eu-north-1 | 0.532 |  |
| eu-south-1 | 0.535 |  |
| eu-south-2 | 0.528 |  |
| eu-west-1 | 0.411 |  |
| eu-west-2 | 0.458 |  |
| eu-west-3 | 0.474 |  |
| il-central-1 | 0.646 |  |
| me-central-1 | 0.894 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.216 |  |
| sa-east-1 | 0.602 |  |
| us-east-1 | 0.163 | 4803 |
| us-east-2 | 0.179 | 1646 |
| us-gov-east-1 | 0.170 | 1723 |
| us-gov-west-1 | 0.205 | 199 |
| us-west-1 | 0.143 | 3721 |
| us-west-2 | 0.202 | 163 |

