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
Updated: 2026-05-24T22:50:55.077980+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.995 |  |
| ap-east-1 | 0.690 |  |
| ap-east-2 | 0.627 |  |
| ap-northeast-1 | 0.514 |  |
| ap-northeast-2 | 0.614 |  |
| ap-northeast-3 | 0.535 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.763 |  |
| ap-southeast-2 | 0.663 |  |
| ap-southeast-3 | 0.822 |  |
| ap-southeast-4 | 0.702 |  |
| ap-southeast-5 | 0.784 |  |
| ap-southeast-6 | 0.691 |  |
| ap-southeast-7 | 0.869 |  |
| ca-central-1 | 0.229 | 16 |
| ca-west-1 | 0.248 |  |
| eu-central-1 | 0.504 |  |
| eu-central-2 | 0.530 |  |
| eu-north-1 | 0.554 |  |
| eu-south-1 | 0.534 |  |
| eu-south-2 | 0.571 |  |
| eu-west-1 | 0.427 |  |
| eu-west-2 | 0.474 |  |
| eu-west-3 | 0.493 |  |
| il-central-1 | 0.677 |  |
| me-central-1 | 0.879 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.217 |  |
| sa-east-1 | 0.636 |  |
| us-east-1 | 0.194 | 4687 |
| us-east-2 | 0.154 | 1611 |
| us-gov-east-1 | 0.170 | 1704 |
| us-gov-west-1 | 0.183 | 195 |
| us-west-1 | 0.127 | 3596 |
| us-west-2 | 0.182 | 160 |

