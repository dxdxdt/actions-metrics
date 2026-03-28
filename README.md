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
Updated: 2026-03-28T15:25:01.329547+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.969 |  |
| ap-east-1 | 0.733 |  |
| ap-east-2 | 0.671 |  |
| ap-northeast-1 | 0.555 |  |
| ap-northeast-2 | 0.665 |  |
| ap-northeast-3 | 0.581 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.915 |  |
| ap-southeast-1 | 0.806 |  |
| ap-southeast-2 | 0.713 |  |
| ap-southeast-3 | 0.863 |  |
| ap-southeast-4 | 0.760 |  |
| ap-southeast-5 | 0.828 |  |
| ap-southeast-6 | 0.744 |  |
| ap-southeast-7 | 0.922 |  |
| ca-central-1 | 0.161 | 16 |
| ca-west-1 | 0.228 |  |
| eu-central-1 | 0.473 |  |
| eu-central-2 | 0.486 |  |
| eu-north-1 | 0.526 |  |
| eu-south-1 | 0.491 |  |
| eu-south-2 | 0.530 |  |
| eu-west-1 | 0.403 |  |
| eu-west-2 | 0.426 |  |
| eu-west-3 | 0.451 |  |
| il-central-1 | 0.650 |  |
| me-central-1 | 0.845 |  |
| me-south-1 | 0.809 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.573 |  |
| us-east-1 | 0.129 | 4380 |
| us-east-2 | 0.112 | 1459 |
| us-gov-east-1 | 0.113 | 1611 |
| us-gov-west-1 | 0.232 | 190 |
| us-west-1 | 0.177 | 3315 |
| us-west-2 | 0.226 | 152 |

