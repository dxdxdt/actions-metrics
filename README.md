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
Updated: 2026-03-20T04:07:51.912336+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.994 |  |
| ap-east-1 | 0.696 |  |
| ap-east-2 | 0.645 |  |
| ap-northeast-1 | 0.522 |  |
| ap-northeast-2 | 0.643 |  |
| ap-northeast-3 | 0.548 |  |
| ap-south-1 | 0.892 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.774 |  |
| ap-southeast-2 | 0.682 |  |
| ap-southeast-3 | 0.827 |  |
| ap-southeast-4 | 0.722 |  |
| ap-southeast-5 | 0.792 |  |
| ap-southeast-6 | 0.760 |  |
| ap-southeast-7 | 0.873 |  |
| ca-central-1 | 0.225 | 16 |
| ca-west-1 | 0.260 |  |
| eu-central-1 | 0.493 |  |
| eu-central-2 | 0.524 |  |
| eu-north-1 | 0.552 |  |
| eu-south-1 | 0.522 |  |
| eu-south-2 | 0.543 |  |
| eu-west-1 | 0.418 |  |
| eu-west-2 | 0.465 |  |
| eu-west-3 | 0.490 |  |
| il-central-1 | 0.697 |  |
| me-central-1 | 0.871 |  |
| me-south-1 | 0.836 |  |
| mx-central-1 | 0.205 |  |
| sa-east-1 | 0.613 |  |
| us-east-1 | 0.169 | 4311 |
| us-east-2 | 0.200 | 1437 |
| us-gov-east-1 | 0.171 | 1590 |
| us-gov-west-1 | 0.197 | 189 |
| us-west-1 | 0.149 | 3264 |
| us-west-2 | 0.196 | 148 |

