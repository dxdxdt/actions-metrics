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
Updated: 2026-11-27T04:40:54.057056+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.692 |  |
| ap-east-1 | 0.561 |  |
| ap-east-2 | 0.519 |  |
| ap-northeast-1 | 0.422 |  |
| ap-northeast-2 | 0.498 |  |
| ap-northeast-3 | 0.440 |  |
| ap-south-1 | 0.661 |  |
| ap-south-2 | 0.714 |  |
| ap-southeast-1 | 0.621 |  |
| ap-southeast-2 | 0.540 |  |
| ap-southeast-3 | 0.667 |  |
| ap-southeast-4 | 0.603 |  |
| ap-southeast-5 | 0.635 |  |
| ap-southeast-6 | 0.571 |  |
| ap-southeast-7 | 0.699 |  |
| ca-central-1 | 0.101 | 18 |
| ca-west-1 | 0.127 |  |
| eu-central-1 | 0.344 |  |
| eu-central-2 | 0.346 |  |
| eu-north-1 | 0.383 |  |
| eu-south-1 | 0.352 |  |
| eu-south-2 | 0.344 |  |
| eu-west-1 | 0.274 |  |
| eu-west-2 | 0.307 |  |
| eu-west-3 | 0.327 |  |
| il-central-1 | 0.458 |  |
| me-central-1 | 0.619 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.651 |  |
| mx-central-1 | 0.170 |  |
| sa-east-1 | 0.417 |  |
| sa-west-1 | 0.435 |  |
| us-east-1 | 0.078 | 5196 |
| us-east-2 | 0.081 | 1731 |
| us-gov-east-1 | 0.078 | 1968 |
| us-gov-west-1 | 0.174 | 251 |
| us-west-1 | 0.143 | 4226 |
| us-west-2 | 0.177 | 200 |

