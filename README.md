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
Updated: 2026-04-11T19:30:23.124727+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.903 |  |
| ap-east-1 | 0.788 |  |
| ap-east-2 | 0.727 |  |
| ap-northeast-1 | 0.609 |  |
| ap-northeast-2 | 0.711 |  |
| ap-northeast-3 | 0.630 |  |
| ap-south-1 | 0.859 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.862 |  |
| ap-southeast-2 | 0.787 |  |
| ap-southeast-3 | 0.921 |  |
| ap-southeast-4 | 0.829 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.867 |  |
| ap-southeast-7 | 0.960 |  |
| ca-central-1 | 0.095 | 16 |
| ca-west-1 | 0.255 |  |
| eu-central-1 | 0.411 |  |
| eu-central-2 | 0.429 |  |
| eu-north-1 | 0.466 |  |
| eu-south-1 | 0.432 |  |
| eu-south-2 | 0.450 |  |
| eu-west-1 | 0.324 |  |
| eu-west-2 | 0.371 |  |
| eu-west-3 | 0.394 |  |
| il-central-1 | 0.570 |  |
| me-central-1 | 0.781 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.510 |  |
| us-east-1 | 0.065 | 4481 |
| us-east-2 | 0.070 | 1495 |
| us-gov-east-1 | 0.075 | 1641 |
| us-gov-west-1 | 0.295 | 192 |
| us-west-1 | 0.246 | 3396 |
| us-west-2 | 0.301 | 155 |

