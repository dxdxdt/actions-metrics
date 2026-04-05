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
Updated: 2026-04-05T12:39:35.827776+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.948 |  |
| ap-east-1 | 0.739 |  |
| ap-east-2 | 0.677 |  |
| ap-northeast-1 | 0.562 |  |
| ap-northeast-2 | 0.666 |  |
| ap-northeast-3 | 0.588 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.815 |  |
| ap-southeast-2 | 0.726 |  |
| ap-southeast-3 | 0.867 |  |
| ap-southeast-4 | 0.763 |  |
| ap-southeast-5 | 0.836 |  |
| ap-southeast-6 | 0.769 |  |
| ap-southeast-7 | 0.926 |  |
| ca-central-1 | 0.179 | 16 |
| ca-west-1 | 0.252 |  |
| eu-central-1 | 0.460 |  |
| eu-central-2 | 0.480 |  |
| eu-north-1 | 0.507 |  |
| eu-south-1 | 0.489 |  |
| eu-south-2 | 0.497 |  |
| eu-west-1 | 0.380 |  |
| eu-west-2 | 0.424 |  |
| eu-west-3 | 0.439 |  |
| il-central-1 | 0.631 |  |
| me-central-1 | 0.847 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.561 |  |
| us-east-1 | 0.126 | 4439 |
| us-east-2 | 0.140 | 1483 |
| us-gov-east-1 | 0.141 | 1628 |
| us-gov-west-1 | 0.244 | 191 |
| us-west-1 | 0.193 | 3358 |
| us-west-2 | 0.231 | 153 |

