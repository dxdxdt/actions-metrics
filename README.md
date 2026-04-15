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
Updated: 2026-04-15T10:10:53.920746+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.070 |  |
| ap-east-1 | 0.645 |  |
| ap-east-2 | 0.585 |  |
| ap-northeast-1 | 0.463 |  |
| ap-northeast-2 | 0.577 |  |
| ap-northeast-3 | 0.488 |  |
| ap-south-1 | 0.918 |  |
| ap-south-2 | 0.886 |  |
| ap-southeast-1 | 0.718 |  |
| ap-southeast-2 | 0.612 |  |
| ap-southeast-3 | 0.780 |  |
| ap-southeast-4 | 0.651 |  |
| ap-southeast-5 | 0.739 |  |
| ap-southeast-6 | 0.666 |  |
| ap-southeast-7 | 0.821 |  |
| ca-central-1 | 0.294 | 16 |
| ca-west-1 | 0.199 |  |
| eu-central-1 | 0.583 |  |
| eu-central-2 | 0.594 |  |
| eu-north-1 | 0.631 |  |
| eu-south-1 | 0.604 |  |
| eu-south-2 | 0.612 |  |
| eu-west-1 | 0.497 |  |
| eu-west-2 | 0.551 |  |
| eu-west-3 | 0.557 |  |
| il-central-1 | 0.764 |  |
| me-central-1 | 0.948 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.675 |  |
| us-east-1 | 0.235 | 4506 |
| us-east-2 | 0.210 | 1500 |
| us-gov-east-1 | 0.209 | 1648 |
| us-gov-west-1 | 0.143 | 193 |
| us-west-1 | 0.081 | 3416 |
| us-west-2 | 0.138 | 155 |

