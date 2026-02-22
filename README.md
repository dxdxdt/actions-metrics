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
Updated: 2026-02-22T08:23:19.742147+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.883 |  |
| ap-east-1 | 0.813 |  |
| ap-east-2 | 0.726 |  |
| ap-northeast-1 | 0.627 |  |
| ap-northeast-2 | 0.732 |  |
| ap-northeast-3 | 0.639 |  |
| ap-south-1 | 0.826 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.881 |  |
| ap-southeast-2 | 0.777 |  |
| ap-southeast-3 | 0.931 |  |
| ap-southeast-4 | 0.808 |  |
| ap-southeast-5 | 0.893 |  |
| ap-southeast-6 | 0.833 |  |
| ap-southeast-7 | 0.974 |  |
| ca-central-1 | 0.111 | 16 |
| ca-west-1 | 0.278 |  |
| eu-central-1 | 0.390 |  |
| eu-central-2 | 0.415 |  |
| eu-north-1 | 0.448 |  |
| eu-south-1 | 0.425 |  |
| eu-south-2 | 0.425 |  |
| eu-west-1 | 0.320 |  |
| eu-west-2 | 0.355 |  |
| eu-west-3 | 0.369 |  |
| il-central-1 | 0.607 |  |
| me-central-1 | 0.796 |  |
| me-south-1 | 0.756 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.506 |  |
| us-east-1 | 0.067 | 4161 |
| us-east-2 | 0.094 | 1369 |
| us-gov-east-1 | 0.091 | 1499 |
| us-gov-west-1 | 0.294 | 160 |
| us-west-1 | 0.255 | 3095 |
| us-west-2 | 0.300 | 129 |

