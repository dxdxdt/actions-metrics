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
Updated: 2026-07-11T10:57:19.495716+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.978 |  |
| ap-east-1 | 0.711 |  |
| ap-east-2 | 0.652 |  |
| ap-northeast-1 | 0.537 |  |
| ap-northeast-2 | 0.633 |  |
| ap-northeast-3 | 0.561 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.785 |  |
| ap-southeast-2 | 0.691 |  |
| ap-southeast-3 | 0.851 |  |
| ap-southeast-4 | 0.741 |  |
| ap-southeast-5 | 0.815 |  |
| ap-southeast-6 | 0.729 |  |
| ap-southeast-7 | 0.895 |  |
| ca-central-1 | 0.186 | 16 |
| ca-west-1 | 0.220 |  |
| eu-central-1 | 0.483 |  |
| eu-central-2 | 0.509 |  |
| eu-north-1 | 0.534 |  |
| eu-south-1 | 0.521 |  |
| eu-south-2 | 0.521 |  |
| eu-west-1 | 0.405 |  |
| eu-west-2 | 0.456 |  |
| eu-west-3 | 0.468 |  |
| il-central-1 | 0.650 |  |
| me-central-1 | 0.859 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.217 |  |
| sa-east-1 | 0.602 |  |
| us-east-1 | 0.145 | 4847 |
| us-east-2 | 0.150 | 1656 |
| us-gov-east-1 | 0.131 | 1736 |
| us-gov-west-1 | 0.211 | 202 |
| us-west-1 | 0.166 | 3765 |
| us-west-2 | 0.210 | 165 |

