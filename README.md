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
Updated: 2026-04-21T19:01:18.163902+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.035 |  |
| ap-east-1 | 0.657 |  |
| ap-east-2 | 0.595 |  |
| ap-northeast-1 | 0.480 |  |
| ap-northeast-2 | 0.583 |  |
| ap-northeast-3 | 0.507 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.936 |  |
| ap-southeast-1 | 0.732 |  |
| ap-southeast-2 | 0.641 |  |
| ap-southeast-3 | 0.789 |  |
| ap-southeast-4 | 0.678 |  |
| ap-southeast-5 | 0.750 |  |
| ap-southeast-6 | 0.665 |  |
| ap-southeast-7 | 0.835 |  |
| ca-central-1 | 0.255 | 16 |
| ca-west-1 | 0.209 |  |
| eu-central-1 | 0.545 |  |
| eu-central-2 | 0.562 |  |
| eu-north-1 | 0.592 |  |
| eu-south-1 | 0.574 |  |
| eu-south-2 | 0.575 |  |
| eu-west-1 | 0.463 |  |
| eu-west-2 | 0.509 |  |
| eu-west-3 | 0.526 |  |
| il-central-1 | 0.716 |  |
| me-central-1 | 0.925 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.664 |  |
| us-east-1 | 0.212 | 4536 |
| us-east-2 | 0.160 | 1523 |
| us-gov-east-1 | 0.176 | 1659 |
| us-gov-west-1 | 0.147 | 194 |
| us-west-1 | 0.107 | 3455 |
| us-west-2 | 0.148 | 157 |

