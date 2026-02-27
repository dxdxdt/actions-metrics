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
Updated: 2026-02-27T19:28:50.627078+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.018 |  |
| ap-east-1 | 0.661 |  |
| ap-east-2 | 0.592 |  |
| ap-northeast-1 | 0.478 |  |
| ap-northeast-2 | 0.583 |  |
| ap-northeast-3 | 0.503 |  |
| ap-south-1 | 0.934 |  |
| ap-south-2 | 0.910 |  |
| ap-southeast-1 | 0.738 |  |
| ap-southeast-2 | 0.637 |  |
| ap-southeast-3 | 0.792 |  |
| ap-southeast-4 | 0.679 |  |
| ap-southeast-5 | 0.758 |  |
| ap-southeast-6 | 0.701 |  |
| ap-southeast-7 | 0.841 |  |
| ca-central-1 | 0.256 | 16 |
| ca-west-1 | 0.210 |  |
| eu-central-1 | 0.544 |  |
| eu-central-2 | 0.554 |  |
| eu-north-1 | 0.589 |  |
| eu-south-1 | 0.571 |  |
| eu-south-2 | 0.567 |  |
| eu-west-1 | 0.479 |  |
| eu-west-2 | 0.510 |  |
| eu-west-3 | 0.512 |  |
| il-central-1 | 0.712 |  |
| me-central-1 | 0.908 |  |
| me-south-1 | 0.873 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.653 |  |
| us-east-1 | 0.193 | 4194 |
| us-east-2 | 0.192 | 1382 |
| us-gov-east-1 | 0.180 | 1516 |
| us-gov-west-1 | 0.162 | 162 |
| us-west-1 | 0.121 | 3136 |
| us-west-2 | 0.166 | 133 |

