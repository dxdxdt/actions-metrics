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
Updated: 2026-03-03T08:31:57.702468+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.001 |  |
| ap-east-1 | 0.708 |  |
| ap-east-2 | 0.653 |  |
| ap-northeast-1 | 0.532 |  |
| ap-northeast-2 | 0.635 |  |
| ap-northeast-3 | 0.556 |  |
| ap-south-1 | 0.914 |  |
| ap-south-2 | 0.971 |  |
| ap-southeast-1 | 0.782 |  |
| ap-southeast-2 | 0.686 |  |
| ap-southeast-3 | 0.839 |  |
| ap-southeast-4 | 0.730 |  |
| ap-southeast-5 | 0.809 |  |
| ap-southeast-6 | 0.742 |  |
| ap-southeast-7 | 0.883 |  |
| ca-central-1 | 0.175 | 16 |
| ca-west-1 | 0.203 |  |
| eu-central-1 | 0.506 |  |
| eu-central-2 | 0.520 |  |
| eu-north-1 | 0.560 |  |
| eu-south-1 | 0.528 |  |
| eu-south-2 | 0.539 |  |
| eu-west-1 | 0.433 |  |
| eu-west-2 | 0.465 |  |
| eu-west-3 | 0.482 |  |
| il-central-1 | 0.688 |  |
| me-central-1 | 0.887 |  |
| me-south-1 | 0.848 |  |
| mx-central-1 | 0.202 |  |
| sa-east-1 | 0.606 |  |
| us-east-1 | 0.169 | 4212 |
| us-east-2 | 0.140 | 1393 |
| us-gov-east-1 | 0.131 | 1525 |
| us-gov-west-1 | 0.188 | 169 |
| us-west-1 | 0.180 | 3162 |
| us-west-2 | 0.188 | 136 |

