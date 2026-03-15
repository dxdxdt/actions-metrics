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
Updated: 2026-03-15T13:42:03.380831+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.978 |  |
| ap-east-1 | 0.694 |  |
| ap-east-2 | 0.642 |  |
| ap-northeast-1 | 0.513 |  |
| ap-northeast-2 | 0.631 |  |
| ap-northeast-3 | 0.545 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.883 |  |
| ap-southeast-1 | 0.780 |  |
| ap-southeast-2 | 0.677 |  |
| ap-southeast-3 | 0.830 |  |
| ap-southeast-4 | 0.724 |  |
| ap-southeast-5 | 0.795 |  |
| ap-southeast-6 | 0.740 |  |
| ap-southeast-7 | 0.885 |  |
| ca-central-1 | 0.223 | 16 |
| ca-west-1 | 0.301 |  |
| eu-central-1 | 0.495 |  |
| eu-central-2 | 0.512 |  |
| eu-north-1 | 0.552 |  |
| eu-south-1 | 0.527 |  |
| eu-south-2 | 0.536 |  |
| eu-west-1 | 0.411 |  |
| eu-west-2 | 0.459 |  |
| eu-west-3 | 0.472 |  |
| il-central-1 | 0.668 |  |
| me-central-1 | 0.873 |  |
| me-south-1 | 0.834 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.599 |  |
| us-east-1 | 0.165 | 4283 |
| us-east-2 | 0.170 | 1424 |
| us-gov-east-1 | 0.181 | 1577 |
| us-gov-west-1 | 0.206 | 185 |
| us-west-1 | 0.148 | 3236 |
| us-west-2 | 0.208 | 147 |

