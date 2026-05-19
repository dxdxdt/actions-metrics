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
Updated: 2026-05-19T10:55:34.826363+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.885 |  |
| ap-east-1 | 0.819 |  |
| ap-east-2 | 0.754 |  |
| ap-northeast-1 | 0.635 |  |
| ap-northeast-2 | 0.744 |  |
| ap-northeast-3 | 0.659 |  |
| ap-south-1 | 0.847 |  |
| ap-south-2 | 0.888 |  |
| ap-southeast-1 | 0.884 |  |
| ap-southeast-2 | 0.800 |  |
| ap-southeast-3 | 0.931 |  |
| ap-southeast-4 | 0.836 |  |
| ap-southeast-5 | 0.898 |  |
| ap-southeast-6 | 0.834 |  |
| ap-southeast-7 | 0.981 |  |
| ca-central-1 | 0.113 | 16 |
| ca-west-1 | 0.302 |  |
| eu-central-1 | 0.386 |  |
| eu-central-2 | 0.402 |  |
| eu-north-1 | 0.434 |  |
| eu-south-1 | 0.407 |  |
| eu-south-2 | 0.413 |  |
| eu-west-1 | 0.300 |  |
| eu-west-2 | 0.342 |  |
| eu-west-3 | 0.364 |  |
| il-central-1 | 0.542 |  |
| me-central-1 | 0.784 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.490 |  |
| us-east-1 | 0.057 | 4663 |
| us-east-2 | 0.086 | 1602 |
| us-gov-east-1 | 0.092 | 1697 |
| us-gov-west-1 | 0.327 | 195 |
| us-west-1 | 0.276 | 3578 |
| us-west-2 | 0.324 | 158 |

