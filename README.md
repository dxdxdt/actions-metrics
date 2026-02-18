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
Updated: 2026-02-18T10:37:05.479667+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.923 |  |
| ap-east-1 | 0.754 |  |
| ap-east-2 | 0.691 |  |
| ap-northeast-1 | 0.573 |  |
| ap-northeast-2 | 0.686 |  |
| ap-northeast-3 | 0.602 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.833 |  |
| ap-southeast-2 | 0.731 |  |
| ap-southeast-3 | 0.887 |  |
| ap-southeast-4 | 0.773 |  |
| ap-southeast-5 | 0.854 |  |
| ap-southeast-6 | 0.767 |  |
| ap-southeast-7 | 0.939 |  |
| ca-central-1 | 0.150 | 16 |
| ca-west-1 | 0.263 |  |
| eu-central-1 | 0.440 |  |
| eu-central-2 | 0.466 |  |
| eu-north-1 | 0.490 |  |
| eu-south-1 | 0.474 |  |
| eu-south-2 | 0.477 |  |
| eu-west-1 | 0.365 |  |
| eu-west-2 | 0.400 |  |
| eu-west-3 | 0.422 |  |
| il-central-1 | 0.612 |  |
| me-central-1 | 0.841 |  |
| me-south-1 | 0.801 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.547 |  |
| us-east-1 | 0.097 | 4139 |
| us-east-2 | 0.112 | 1354 |
| us-gov-east-1 | 0.114 | 1487 |
| us-gov-west-1 | 0.250 | 154 |
| us-west-1 | 0.358 | 3073 |
| us-west-2 | 0.251 | 126 |

