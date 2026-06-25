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
Updated: 2026-06-25T23:10:24.539084+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.062 |  |
| ap-east-1 | 0.632 |  |
| ap-east-2 | 0.570 |  |
| ap-northeast-1 | 0.454 |  |
| ap-northeast-2 | 0.561 |  |
| ap-northeast-3 | 0.480 |  |
| ap-south-1 | 0.906 |  |
| ap-south-2 | 0.875 |  |
| ap-southeast-1 | 0.707 |  |
| ap-southeast-2 | 0.590 |  |
| ap-southeast-3 | 0.762 |  |
| ap-southeast-4 | 0.631 |  |
| ap-southeast-5 | 0.727 |  |
| ap-southeast-6 | 0.623 |  |
| ap-southeast-7 | 0.809 |  |
| ca-central-1 | 0.307 | 16 |
| ca-west-1 | 0.180 |  |
| eu-central-1 | 0.582 |  |
| eu-central-2 | 0.617 |  |
| eu-north-1 | 0.645 |  |
| eu-south-1 | 0.621 |  |
| eu-south-2 | 0.611 |  |
| eu-west-1 | 0.504 |  |
| eu-west-2 | 0.541 |  |
| eu-west-3 | 0.557 |  |
| il-central-1 | 0.741 |  |
| me-central-1 | 0.967 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.260 |  |
| sa-east-1 | 0.689 |  |
| us-east-1 | 0.260 | 4788 |
| us-east-2 | 0.224 | 1640 |
| us-gov-east-1 | 0.230 | 1720 |
| us-gov-west-1 | 0.115 | 199 |
| us-west-1 | 0.059 | 3707 |
| us-west-2 | 0.117 | 163 |

