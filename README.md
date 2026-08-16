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
Updated: 2026-08-16T23:12:55.414111+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.034 |  |
| ap-east-1 | 0.646 |  |
| ap-east-2 | 0.588 |  |
| ap-northeast-1 | 0.470 |  |
| ap-northeast-2 | 0.572 |  |
| ap-northeast-3 | 0.497 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.923 |  |
| ap-southeast-1 | 0.722 |  |
| ap-southeast-2 | 0.614 |  |
| ap-southeast-3 | 0.782 |  |
| ap-southeast-4 | 0.653 |  |
| ap-southeast-5 | 0.742 |  |
| ap-southeast-6 | 0.644 |  |
| ap-southeast-7 | 0.824 |  |
| ca-central-1 | 0.274 | 18 |
| ca-west-1 | 0.242 |  |
| eu-central-1 | 0.550 |  |
| eu-central-2 | 0.571 |  |
| eu-north-1 | 0.602 |  |
| eu-south-1 | 0.581 |  |
| eu-south-2 | 0.590 |  |
| eu-west-1 | 0.474 |  |
| eu-west-2 | 0.510 |  |
| eu-west-3 | 0.527 |  |
| il-central-1 | 0.708 |  |
| me-central-1 | 0.913 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.216 |  |
| sa-east-1 | 0.679 |  |
| us-east-1 | 0.226 | 5009 |
| us-east-2 | 0.222 | 1680 |
| us-gov-east-1 | 0.221 | 1834 |
| us-gov-west-1 | 0.136 | 224 |
| us-west-1 | 0.077 | 3971 |
| us-west-2 | 0.134 | 180 |

