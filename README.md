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
Updated: 2026-04-21T17:55:02.326647+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.051 |  |
| ap-east-1 | 0.647 |  |
| ap-east-2 | 0.586 |  |
| ap-northeast-1 | 0.473 |  |
| ap-northeast-2 | 0.578 |  |
| ap-northeast-3 | 0.497 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.724 |  |
| ap-southeast-2 | 0.630 |  |
| ap-southeast-3 | 0.778 |  |
| ap-southeast-4 | 0.668 |  |
| ap-southeast-5 | 0.738 |  |
| ap-southeast-6 | 0.660 |  |
| ap-southeast-7 | 0.826 |  |
| ca-central-1 | 0.277 | 16 |
| ca-west-1 | 0.181 |  |
| eu-central-1 | 0.571 |  |
| eu-central-2 | 0.588 |  |
| eu-north-1 | 0.611 |  |
| eu-south-1 | 0.596 |  |
| eu-south-2 | 0.590 |  |
| eu-west-1 | 0.492 |  |
| eu-west-2 | 0.523 |  |
| eu-west-3 | 0.550 |  |
| il-central-1 | 0.740 |  |
| me-central-1 | 0.932 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.256 |  |
| sa-east-1 | 0.677 |  |
| us-east-1 | 0.224 | 4536 |
| us-east-2 | 0.187 | 1523 |
| us-gov-east-1 | 0.199 | 1659 |
| us-gov-west-1 | 0.134 | 194 |
| us-west-1 | 0.107 | 3454 |
| us-west-2 | 0.133 | 157 |

