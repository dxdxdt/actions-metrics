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
Updated: 2026-10-11T18:33:25.966665+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.951 |  |
| ap-east-1 | 0.744 |  |
| ap-east-2 | 0.688 |  |
| ap-northeast-1 | 0.568 |  |
| ap-northeast-2 | 0.672 |  |
| ap-northeast-3 | 0.594 |  |
| ap-south-1 | 0.886 |  |
| ap-south-2 | 0.960 |  |
| ap-southeast-1 | 0.824 |  |
| ap-southeast-2 | 0.719 |  |
| ap-southeast-3 | 0.873 |  |
| ap-southeast-4 | 0.758 |  |
| ap-southeast-5 | 0.840 |  |
| ap-southeast-6 | 0.799 |  |
| ap-southeast-7 | 0.922 |  |
| ca-central-1 | 0.125 | 18 |
| ca-west-1 | 0.234 |  |
| eu-central-1 | 0.449 |  |
| eu-central-2 | 0.474 |  |
| eu-north-1 | 0.494 |  |
| eu-south-1 | 0.487 |  |
| eu-south-2 | 0.465 |  |
| eu-west-1 | 0.396 |  |
| eu-west-2 | 0.410 |  |
| eu-west-3 | 0.440 |  |
| il-central-1 | 0.606 |  |
| me-central-1 | 0.799 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.198 |  |
| sa-east-1 | 0.584 |  |
| us-east-1 | 0.105 | 5143 |
| us-east-2 | 0.104 | 1694 |
| us-gov-east-1 | 0.086 | 1939 |
| us-gov-west-1 | 0.240 | 237 |
| us-west-1 | 0.182 | 4166 |
| us-west-2 | 0.238 | 194 |

