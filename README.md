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
Updated: 2026-03-21T13:37:56.341660+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.016 |  |
| ap-east-1 | 0.674 |  |
| ap-east-2 | 0.619 |  |
| ap-northeast-1 | 0.497 |  |
| ap-northeast-2 | 0.610 |  |
| ap-northeast-3 | 0.523 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.748 |  |
| ap-southeast-2 | 0.645 |  |
| ap-southeast-3 | 0.803 |  |
| ap-southeast-4 | 0.684 |  |
| ap-southeast-5 | 0.767 |  |
| ap-southeast-6 | 0.733 |  |
| ap-southeast-7 | 0.854 |  |
| ca-central-1 | 0.249 | 16 |
| ca-west-1 | 0.220 |  |
| eu-central-1 | 0.526 |  |
| eu-central-2 | 0.556 |  |
| eu-north-1 | 0.577 |  |
| eu-south-1 | 0.558 |  |
| eu-south-2 | 0.557 |  |
| eu-west-1 | 0.444 |  |
| eu-west-2 | 0.496 |  |
| eu-west-3 | 0.513 |  |
| il-central-1 | 0.712 |  |
| me-central-1 | 0.902 |  |
| me-south-1 | 0.858 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.643 |  |
| us-east-1 | 0.210 | 4322 |
| us-east-2 | 0.196 | 1445 |
| us-gov-east-1 | 0.182 | 1591 |
| us-gov-west-1 | 0.160 | 189 |
| us-west-1 | 0.126 | 3272 |
| us-west-2 | 0.164 | 150 |

