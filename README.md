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
Updated: 2026-07-19T21:43:14.911834+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.033 |  |
| ap-east-1 | 0.649 |  |
| ap-east-2 | 0.591 |  |
| ap-northeast-1 | 0.470 |  |
| ap-northeast-2 | 0.571 |  |
| ap-northeast-3 | 0.497 |  |
| ap-south-1 | 0.920 |  |
| ap-south-2 | 0.886 |  |
| ap-southeast-1 | 0.738 |  |
| ap-southeast-2 | 0.619 |  |
| ap-southeast-3 | 0.790 |  |
| ap-southeast-4 | 0.667 |  |
| ap-southeast-5 | 0.758 |  |
| ap-southeast-6 | 0.666 |  |
| ap-southeast-7 | 0.835 |  |
| ca-central-1 | 0.285 | 16 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.545 |  |
| eu-central-2 | 0.574 |  |
| eu-north-1 | 0.585 |  |
| eu-south-1 | 0.575 |  |
| eu-south-2 | 0.580 |  |
| eu-west-1 | 0.471 |  |
| eu-west-2 | 0.507 |  |
| eu-west-3 | 0.521 |  |
| il-central-1 | 0.696 |  |
| me-central-1 | 0.946 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.218 |  |
| sa-east-1 | 0.654 |  |
| us-east-1 | 0.214 | 4886 |
| us-east-2 | 0.231 | 1657 |
| us-gov-east-1 | 0.208 | 1770 |
| us-gov-west-1 | 0.154 | 205 |
| us-west-1 | 0.101 | 3807 |
| us-west-2 | 0.154 | 167 |

