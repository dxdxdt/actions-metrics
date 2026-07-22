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
Updated: 2026-07-22T14:59:12.126936+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.960 |  |
| ap-east-1 | 0.725 |  |
| ap-east-2 | 0.839 |  |
| ap-northeast-1 | 0.548 |  |
| ap-northeast-2 | 0.648 |  |
| ap-northeast-3 | 0.575 |  |
| ap-south-1 | 0.910 |  |
| ap-south-2 | 0.990 |  |
| ap-southeast-1 | 0.804 |  |
| ap-southeast-2 | 0.703 |  |
| ap-southeast-3 | 0.863 |  |
| ap-southeast-4 | 0.746 |  |
| ap-southeast-5 | 0.825 |  |
| ap-southeast-6 | 0.732 |  |
| ap-southeast-7 | 0.907 |  |
| ca-central-1 | 0.178 | 16 |
| ca-west-1 | 0.223 |  |
| eu-central-1 | 0.485 |  |
| eu-central-2 | 0.504 |  |
| eu-north-1 | 0.546 |  |
| eu-south-1 | 0.504 |  |
| eu-south-2 | 0.510 |  |
| eu-west-1 | 0.404 |  |
| eu-west-2 | 0.441 |  |
| eu-west-3 | 0.463 |  |
| il-central-1 | 0.639 |  |
| me-central-1 | 0.894 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.212 |  |
| sa-east-1 | 0.588 |  |
| us-east-1 | 0.135 | 4897 |
| us-east-2 | 0.126 | 1659 |
| us-gov-east-1 | 0.111 | 1775 |
| us-gov-west-1 | 0.228 | 206 |
| us-west-1 | 0.168 | 3818 |
| us-west-2 | 0.229 | 167 |

