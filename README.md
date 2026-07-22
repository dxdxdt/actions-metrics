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
Updated: 2026-07-22T11:00:34.000895+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.942 |  |
| ap-east-1 | 0.730 |  |
| ap-east-2 | 0.675 |  |
| ap-northeast-1 | 0.554 |  |
| ap-northeast-2 | 0.651 |  |
| ap-northeast-3 | 0.581 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.992 |  |
| ap-southeast-1 | 0.813 |  |
| ap-southeast-2 | 0.702 |  |
| ap-southeast-3 | 0.871 |  |
| ap-southeast-4 | 0.748 |  |
| ap-southeast-5 | 0.827 |  |
| ap-southeast-6 | 0.736 |  |
| ap-southeast-7 | 0.911 |  |
| ca-central-1 | 0.200 | 16 |
| ca-west-1 | 0.242 |  |
| eu-central-1 | 0.476 |  |
| eu-central-2 | 0.492 |  |
| eu-north-1 | 0.532 |  |
| eu-south-1 | 0.490 |  |
| eu-south-2 | 0.496 |  |
| eu-west-1 | 0.393 |  |
| eu-west-2 | 0.432 |  |
| eu-west-3 | 0.447 |  |
| il-central-1 | 0.625 |  |
| me-central-1 | 0.839 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.206 |  |
| sa-east-1 | 0.603 |  |
| us-east-1 | 0.140 | 4897 |
| us-east-2 | 0.135 | 1659 |
| us-gov-east-1 | 0.130 | 1774 |
| us-gov-west-1 | 0.225 | 206 |
| us-west-1 | 0.167 | 3817 |
| us-west-2 | 0.225 | 167 |

