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
Updated: 2026-04-19T20:29:37.467774+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.918 |  |
| ap-east-1 | 0.771 |  |
| ap-east-2 | 0.711 |  |
| ap-northeast-1 | 0.594 |  |
| ap-northeast-2 | 0.691 |  |
| ap-northeast-3 | 0.617 |  |
| ap-south-1 | 0.876 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.852 |  |
| ap-southeast-2 | 0.760 |  |
| ap-southeast-3 | 0.896 |  |
| ap-southeast-4 | 0.801 |  |
| ap-southeast-5 | 0.871 |  |
| ap-southeast-6 | 0.820 |  |
| ap-southeast-7 | 0.953 |  |
| ca-central-1 | 0.131 | 16 |
| ca-west-1 | 0.256 |  |
| eu-central-1 | 0.430 |  |
| eu-central-2 | 0.447 |  |
| eu-north-1 | 0.481 |  |
| eu-south-1 | 0.449 |  |
| eu-south-2 | 0.468 |  |
| eu-west-1 | 0.352 |  |
| eu-west-2 | 0.384 |  |
| eu-west-3 | 0.411 |  |
| il-central-1 | 0.599 |  |
| me-central-1 | 0.816 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.528 |  |
| us-east-1 | 0.085 | 4527 |
| us-east-2 | 0.101 | 1516 |
| us-gov-east-1 | 0.106 | 1657 |
| us-gov-west-1 | 0.273 | 194 |
| us-west-1 | 0.219 | 3445 |
| us-west-2 | 0.279 | 156 |

