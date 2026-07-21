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
Updated: 2026-07-21T12:24:13.377621+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.921 |  |
| ap-east-1 | 0.748 |  |
| ap-east-2 | 0.689 |  |
| ap-northeast-1 | 0.576 |  |
| ap-northeast-2 | 0.675 |  |
| ap-northeast-3 | 0.594 |  |
| ap-south-1 | 0.858 |  |
| ap-south-2 | 0.918 |  |
| ap-southeast-1 | 0.830 |  |
| ap-southeast-2 | 0.760 |  |
| ap-southeast-3 | 0.875 |  |
| ap-southeast-4 | 0.797 |  |
| ap-southeast-5 | 0.845 |  |
| ap-southeast-6 | 0.785 |  |
| ap-southeast-7 | 0.928 |  |
| ca-central-1 | 0.165 | 16 |
| ca-west-1 | 0.267 |  |
| eu-central-1 | 0.451 |  |
| eu-central-2 | 0.459 |  |
| eu-north-1 | 0.499 |  |
| eu-south-1 | 0.463 |  |
| eu-south-2 | 0.482 |  |
| eu-west-1 | 0.367 |  |
| eu-west-2 | 0.398 |  |
| eu-west-3 | 0.434 |  |
| il-central-1 | 0.621 |  |
| me-central-1 | 0.852 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.539 |  |
| us-east-1 | 0.105 | 4893 |
| us-east-2 | 0.132 | 1658 |
| us-gov-east-1 | 0.139 | 1771 |
| us-gov-west-1 | 0.259 | 206 |
| us-west-1 | 0.225 | 3814 |
| us-west-2 | 0.265 | 167 |

