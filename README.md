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
Updated: 2026-10-03T10:54:55.525564+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.934 |  |
| ap-east-1 | 0.744 |  |
| ap-east-2 | 0.683 |  |
| ap-northeast-1 | 0.564 |  |
| ap-northeast-2 | 0.655 |  |
| ap-northeast-3 | 0.590 |  |
| ap-south-1 | 0.862 |  |
| ap-south-2 | 0.982 |  |
| ap-southeast-1 | 0.843 |  |
| ap-southeast-2 | 0.718 |  |
| ap-southeast-3 | 0.879 |  |
| ap-southeast-4 | 0.760 |  |
| ap-southeast-5 | 0.840 |  |
| ap-southeast-6 | 0.774 |  |
| ap-southeast-7 | 0.929 |  |
| ca-central-1 | 0.148 | 18 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.446 |  |
| eu-central-2 | 0.461 |  |
| eu-north-1 | 0.491 |  |
| eu-south-1 | 0.465 |  |
| eu-south-2 | 0.465 |  |
| eu-west-1 | 0.369 |  |
| eu-west-2 | 0.400 |  |
| eu-west-3 | 0.428 |  |
| il-central-1 | 0.617 |  |
| me-central-1 | 0.841 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.557 |  |
| us-east-1 | 0.109 | 5134 |
| us-east-2 | 0.115 | 1690 |
| us-gov-east-1 | 0.129 | 1932 |
| us-gov-west-1 | 0.246 | 236 |
| us-west-1 | 0.184 | 4153 |
| us-west-2 | 0.245 | 192 |

