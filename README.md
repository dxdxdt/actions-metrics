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
Updated: 2026-02-19T19:35:14.374555+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.925 |  |
| ap-east-1 | 0.744 |  |
| ap-east-2 | 0.691 |  |
| ap-northeast-1 | 0.568 |  |
| ap-northeast-2 | 0.682 |  |
| ap-northeast-3 | 0.610 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.825 |  |
| ap-southeast-2 | 0.730 |  |
| ap-southeast-3 | 0.884 |  |
| ap-southeast-4 | 0.773 |  |
| ap-southeast-5 | 0.845 |  |
| ap-southeast-6 | 0.795 |  |
| ap-southeast-7 | 0.933 |  |
| ca-central-1 | 0.174 | 16 |
| ca-west-1 | 0.302 |  |
| eu-central-1 | 0.438 |  |
| eu-central-2 | 0.459 |  |
| eu-north-1 | 0.493 |  |
| eu-south-1 | 0.472 |  |
| eu-south-2 | 0.469 |  |
| eu-west-1 | 0.363 |  |
| eu-west-2 | 0.399 |  |
| eu-west-3 | 0.416 |  |
| il-central-1 | 0.614 |  |
| me-central-1 | 0.834 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.539 |  |
| us-east-1 | 0.118 | 4146 |
| us-east-2 | 0.140 | 1356 |
| us-gov-east-1 | 0.139 | 1492 |
| us-gov-west-1 | 0.255 | 156 |
| us-west-1 | 0.201 | 3083 |
| us-west-2 | 0.255 | 128 |

