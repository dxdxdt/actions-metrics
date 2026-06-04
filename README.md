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
Updated: 2026-06-04T19:15:16.452450+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.884 |  |
| ap-east-1 | 0.807 |  |
| ap-east-2 | 0.750 |  |
| ap-northeast-1 | 0.635 |  |
| ap-northeast-2 | 0.740 |  |
| ap-northeast-3 | 0.658 |  |
| ap-south-1 | 0.857 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.893 |  |
| ap-southeast-2 | 0.775 |  |
| ap-southeast-3 | 0.949 |  |
| ap-southeast-4 | 0.817 |  |
| ap-southeast-5 | 0.915 |  |
| ap-southeast-6 | 0.826 |  |
| ap-southeast-7 | 0.992 |  |
| ca-central-1 | 0.130 | 16 |
| ca-west-1 | 0.274 |  |
| eu-central-1 | 0.397 |  |
| eu-central-2 | 0.428 |  |
| eu-north-1 | 0.448 |  |
| eu-south-1 | 0.442 |  |
| eu-south-2 | 0.436 |  |
| eu-west-1 | 0.324 |  |
| eu-west-2 | 0.355 |  |
| eu-west-3 | 0.375 |  |
| il-central-1 | 0.561 |  |
| me-central-1 | 0.803 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.502 |  |
| us-east-1 | 0.073 | 4720 |
| us-east-2 | 0.104 | 1623 |
| us-gov-east-1 | 0.115 | 1708 |
| us-gov-west-1 | 0.306 | 196 |
| us-west-1 | 0.251 | 3633 |
| us-west-2 | 0.302 | 162 |

