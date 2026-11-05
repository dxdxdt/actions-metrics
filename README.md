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
Updated: 2026-11-05T08:48:02.223998+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.691 |  |
| ap-east-1 | 0.572 |  |
| ap-east-2 | 0.528 |  |
| ap-northeast-1 | 0.427 |  |
| ap-northeast-2 | 0.508 |  |
| ap-northeast-3 | 0.450 |  |
| ap-south-1 | 0.611 |  |
| ap-south-2 | 0.660 |  |
| ap-southeast-1 | 0.640 |  |
| ap-southeast-2 | 0.570 |  |
| ap-southeast-3 | 0.673 |  |
| ap-southeast-4 | 0.618 |  |
| ap-southeast-5 | 0.644 |  |
| ap-southeast-6 | 0.603 |  |
| ap-southeast-7 | 0.716 |  |
| ca-central-1 | 0.095 | 18 |
| ca-west-1 | 0.193 |  |
| eu-central-1 | 0.311 |  |
| eu-central-2 | 0.320 |  |
| eu-north-1 | 0.362 |  |
| eu-south-1 | 0.339 |  |
| eu-south-2 | 0.325 |  |
| eu-west-1 | 0.252 |  |
| eu-west-2 | 0.279 |  |
| eu-west-3 | 0.293 |  |
| il-central-1 | 0.436 |  |
| me-central-1 | 0.600 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.179 |  |
| sa-east-1 | 0.384 |  |
| us-east-1 | 0.054 | 5172 |
| us-east-2 | 0.081 | 1721 |
| us-gov-east-1 | 0.083 | 1959 |
| us-gov-west-1 | 0.191 | 244 |
| us-west-1 | 0.162 | 4206 |
| us-west-2 | 0.186 | 195 |

