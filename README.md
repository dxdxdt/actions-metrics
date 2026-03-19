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
Updated: 2026-03-19T16:50:18.666542+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.967 |  |
| ap-east-1 | 0.740 |  |
| ap-east-2 | 0.678 |  |
| ap-northeast-1 | 0.561 |  |
| ap-northeast-2 | 0.662 |  |
| ap-northeast-3 | 0.583 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.931 |  |
| ap-southeast-1 | 0.818 |  |
| ap-southeast-2 | 0.738 |  |
| ap-southeast-3 | 0.867 |  |
| ap-southeast-4 | 0.784 |  |
| ap-southeast-5 | 0.835 |  |
| ap-southeast-6 | 0.818 |  |
| ap-southeast-7 | 0.919 |  |
| ca-central-1 | 0.128 | 16 |
| ca-west-1 | 0.209 |  |
| eu-central-1 | 0.476 |  |
| eu-central-2 | 0.486 |  |
| eu-north-1 | 0.520 |  |
| eu-south-1 | 0.495 |  |
| eu-south-2 | 0.516 |  |
| eu-west-1 | 0.404 |  |
| eu-west-2 | 0.432 |  |
| eu-west-3 | 0.455 |  |
| il-central-1 | 0.653 |  |
| me-central-1 | 0.841 |  |
| me-south-1 | 0.817 |  |
| mx-central-1 | 0.283 |  |
| sa-east-1 | 0.569 |  |
| us-east-1 | 0.108 | 4309 |
| us-east-2 | 0.096 | 1437 |
| us-gov-east-1 | 0.092 | 1589 |
| us-gov-west-1 | 0.228 | 189 |
| us-west-1 | 0.193 | 3258 |
| us-west-2 | 0.243 | 148 |

