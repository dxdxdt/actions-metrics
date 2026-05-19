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
Updated: 2026-05-19T20:26:20.037340+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.027 |  |
| ap-east-1 | 0.674 |  |
| ap-east-2 | 0.608 |  |
| ap-northeast-1 | 0.495 |  |
| ap-northeast-2 | 0.594 |  |
| ap-northeast-3 | 0.518 |  |
| ap-south-1 | 0.927 |  |
| ap-south-2 | 0.918 |  |
| ap-southeast-1 | 0.748 |  |
| ap-southeast-2 | 0.653 |  |
| ap-southeast-3 | 0.808 |  |
| ap-southeast-4 | 0.693 |  |
| ap-southeast-5 | 0.774 |  |
| ap-southeast-6 | 0.707 |  |
| ap-southeast-7 | 0.861 |  |
| ca-central-1 | 0.248 | 16 |
| ca-west-1 | 0.237 |  |
| eu-central-1 | 0.539 |  |
| eu-central-2 | 0.562 |  |
| eu-north-1 | 0.571 |  |
| eu-south-1 | 0.570 |  |
| eu-south-2 | 0.566 |  |
| eu-west-1 | 0.460 |  |
| eu-west-2 | 0.499 |  |
| eu-west-3 | 0.508 |  |
| il-central-1 | 0.682 |  |
| me-central-1 | 0.911 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.210 |  |
| sa-east-1 | 0.639 |  |
| us-east-1 | 0.188 | 4663 |
| us-east-2 | 0.198 | 1603 |
| us-gov-east-1 | 0.175 | 1698 |
| us-gov-west-1 | 0.177 | 195 |
| us-west-1 | 0.118 | 3580 |
| us-west-2 | 0.180 | 158 |

