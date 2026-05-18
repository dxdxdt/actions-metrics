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
Updated: 2026-05-18T23:58:47.572778+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.994 |  |
| ap-east-1 | 0.695 |  |
| ap-east-2 | 0.631 |  |
| ap-northeast-1 | 0.514 |  |
| ap-northeast-2 | 0.623 |  |
| ap-northeast-3 | 0.544 |  |
| ap-south-1 | 0.911 |  |
| ap-south-2 | 0.925 |  |
| ap-southeast-1 | 0.770 |  |
| ap-southeast-2 | 0.678 |  |
| ap-southeast-3 | 0.823 |  |
| ap-southeast-4 | 0.717 |  |
| ap-southeast-5 | 0.787 |  |
| ap-southeast-6 | 0.733 |  |
| ap-southeast-7 | 0.873 |  |
| ca-central-1 | 0.201 | 16 |
| ca-west-1 | 0.243 |  |
| eu-central-1 | 0.518 |  |
| eu-central-2 | 0.524 |  |
| eu-north-1 | 0.551 |  |
| eu-south-1 | 0.528 |  |
| eu-south-2 | 0.536 |  |
| eu-west-1 | 0.421 |  |
| eu-west-2 | 0.480 |  |
| eu-west-3 | 0.492 |  |
| il-central-1 | 0.679 |  |
| me-central-1 | 0.895 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.200 |  |
| sa-east-1 | 0.631 |  |
| us-east-1 | 0.172 | 4660 |
| us-east-2 | 0.127 | 1602 |
| us-gov-east-1 | 0.137 | 1697 |
| us-gov-west-1 | 0.188 | 195 |
| us-west-1 | 0.131 | 3578 |
| us-west-2 | 0.185 | 158 |

