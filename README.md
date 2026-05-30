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
Updated: 2026-05-30T06:17:43.840690+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.030 |  |
| ap-east-1 | 0.652 |  |
| ap-east-2 | 0.589 |  |
| ap-northeast-1 | 0.472 |  |
| ap-northeast-2 | 0.578 |  |
| ap-northeast-3 | 0.498 |  |
| ap-south-1 | 0.921 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.732 |  |
| ap-southeast-2 | 0.625 |  |
| ap-southeast-3 | 0.788 |  |
| ap-southeast-4 | 0.667 |  |
| ap-southeast-5 | 0.752 |  |
| ap-southeast-6 | 0.667 |  |
| ap-southeast-7 | 0.834 |  |
| ca-central-1 | 0.272 | 16 |
| ca-west-1 | 0.303 |  |
| eu-central-1 | 0.554 |  |
| eu-central-2 | 0.579 |  |
| eu-north-1 | 0.591 |  |
| eu-south-1 | 0.585 |  |
| eu-south-2 | 0.572 |  |
| eu-west-1 | 0.469 |  |
| eu-west-2 | 0.511 |  |
| eu-west-3 | 0.530 |  |
| il-central-1 | 0.695 |  |
| me-central-1 | 0.993 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.661 |  |
| us-east-1 | 0.217 | 4699 |
| us-east-2 | 0.210 | 1614 |
| us-gov-east-1 | 0.200 | 1708 |
| us-gov-west-1 | 0.153 | 195 |
| us-west-1 | 0.094 | 3618 |
| us-west-2 | 0.156 | 161 |

