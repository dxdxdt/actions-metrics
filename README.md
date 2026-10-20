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
Updated: 2026-10-20T21:03:53.053247+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.035 |  |
| ap-east-1 | 0.637 |  |
| ap-east-2 | 0.568 |  |
| ap-northeast-1 | 0.453 |  |
| ap-northeast-2 | 0.553 |  |
| ap-northeast-3 | 0.478 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.888 |  |
| ap-southeast-1 | 0.719 |  |
| ap-southeast-2 | 0.605 |  |
| ap-southeast-3 | 0.770 |  |
| ap-southeast-4 | 0.688 |  |
| ap-southeast-5 | 0.732 |  |
| ap-southeast-6 | 0.667 |  |
| ap-southeast-7 | 0.813 |  |
| ca-central-1 | 0.273 | 18 |
| ca-west-1 | 0.276 |  |
| eu-central-1 | 0.544 |  |
| eu-central-2 | 0.563 |  |
| eu-north-1 | 0.599 |  |
| eu-south-1 | 0.575 |  |
| eu-south-2 | 0.558 |  |
| eu-west-1 | 0.476 |  |
| eu-west-2 | 0.511 |  |
| eu-west-3 | 0.530 |  |
| il-central-1 | 0.711 |  |
| me-central-1 | 0.945 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.669 |  |
| us-east-1 | 0.219 | 5153 |
| us-east-2 | 0.243 | 1704 |
| us-gov-east-1 | 0.253 | 1950 |
| us-gov-west-1 | 0.151 | 239 |
| us-west-1 | 0.083 | 4182 |
| us-west-2 | 0.150 | 195 |

