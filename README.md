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
Updated: 2026-06-14T21:02:14.948713+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.929 |  |
| ap-east-1 | 0.756 |  |
| ap-east-2 | 0.698 |  |
| ap-northeast-1 | 0.580 |  |
| ap-northeast-2 | 0.685 |  |
| ap-northeast-3 | 0.605 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.904 |  |
| ap-southeast-1 | 0.830 |  |
| ap-southeast-2 | 0.733 |  |
| ap-southeast-3 | 0.882 |  |
| ap-southeast-4 | 0.770 |  |
| ap-southeast-5 | 0.849 |  |
| ap-southeast-6 | 0.761 |  |
| ap-southeast-7 | 0.937 |  |
| ca-central-1 | 0.152 | 16 |
| ca-west-1 | 0.237 |  |
| eu-central-1 | 0.446 |  |
| eu-central-2 | 0.467 |  |
| eu-north-1 | 0.489 |  |
| eu-south-1 | 0.475 |  |
| eu-south-2 | 0.483 |  |
| eu-west-1 | 0.375 |  |
| eu-west-2 | 0.397 |  |
| eu-west-3 | 0.423 |  |
| il-central-1 | 0.594 |  |
| me-central-1 | 0.819 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.216 |  |
| sa-east-1 | 0.555 |  |
| us-east-1 | 0.105 | 4758 |
| us-east-2 | 0.115 | 1634 |
| us-gov-east-1 | 0.118 | 1712 |
| us-gov-west-1 | 0.246 | 198 |
| us-west-1 | 0.194 | 3666 |
| us-west-2 | 0.248 | 163 |

