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
Updated: 2026-07-22T08:11:46.714991+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.938 |  |
| ap-east-1 | 0.737 |  |
| ap-east-2 | 0.686 |  |
| ap-northeast-1 | 0.563 |  |
| ap-northeast-2 | 0.656 |  |
| ap-northeast-3 | 0.589 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.967 |  |
| ap-southeast-1 | 0.830 |  |
| ap-southeast-2 | 0.701 |  |
| ap-southeast-3 | 0.883 |  |
| ap-southeast-4 | 0.753 |  |
| ap-southeast-5 | 0.839 |  |
| ap-southeast-6 | 0.747 |  |
| ap-southeast-7 | 0.924 |  |
| ca-central-1 | 0.187 | 16 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.468 |  |
| eu-central-2 | 0.485 |  |
| eu-north-1 | 0.515 |  |
| eu-south-1 | 0.497 |  |
| eu-south-2 | 0.490 |  |
| eu-west-1 | 0.384 |  |
| eu-west-2 | 0.426 |  |
| eu-west-3 | 0.435 |  |
| il-central-1 | 0.621 |  |
| me-central-1 | 0.853 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.568 |  |
| us-east-1 | 0.126 | 4897 |
| us-east-2 | 0.169 | 1659 |
| us-gov-east-1 | 0.174 | 1773 |
| us-gov-west-1 | 0.236 | 206 |
| us-west-1 | 0.174 | 3817 |
| us-west-2 | 0.237 | 167 |

