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
Updated: 2026-07-15T01:42:35.355145+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.016 |  |
| ap-east-1 | 0.659 |  |
| ap-east-2 | 0.599 |  |
| ap-northeast-1 | 0.473 |  |
| ap-northeast-2 | 0.589 |  |
| ap-northeast-3 | 0.502 |  |
| ap-south-1 | 0.913 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.738 |  |
| ap-southeast-2 | 0.627 |  |
| ap-southeast-3 | 0.794 |  |
| ap-southeast-4 | 0.670 |  |
| ap-southeast-5 | 0.759 |  |
| ap-southeast-6 | 0.663 |  |
| ap-southeast-7 | 0.837 |  |
| ca-central-1 | 0.277 | 16 |
| ca-west-1 | 0.209 |  |
| eu-central-1 | 0.542 |  |
| eu-central-2 | 0.561 |  |
| eu-north-1 | 0.585 |  |
| eu-south-1 | 0.573 |  |
| eu-south-2 | 0.591 |  |
| eu-west-1 | 0.459 |  |
| eu-west-2 | 0.506 |  |
| eu-west-3 | 0.519 |  |
| il-central-1 | 0.691 |  |
| me-central-1 | 0.901 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.653 |  |
| us-east-1 | 0.214 | 4871 |
| us-east-2 | 0.231 | 1656 |
| us-gov-east-1 | 0.207 | 1750 |
| us-gov-west-1 | 0.160 | 202 |
| us-west-1 | 0.102 | 3778 |
| us-west-2 | 0.159 | 166 |

