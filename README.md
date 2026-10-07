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
Updated: 2026-10-07T20:22:17.929495+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.991 |  |
| ap-east-1 | 0.684 |  |
| ap-east-2 | 0.627 |  |
| ap-northeast-1 | 0.508 |  |
| ap-northeast-2 | 0.616 |  |
| ap-northeast-3 | 0.536 |  |
| ap-south-1 | 0.936 |  |
| ap-south-2 | 0.984 |  |
| ap-southeast-1 | 0.766 |  |
| ap-southeast-2 | 0.672 |  |
| ap-southeast-3 | 0.821 |  |
| ap-southeast-4 | 0.714 |  |
| ap-southeast-5 | 0.785 |  |
| ap-southeast-6 | 0.732 |  |
| ap-southeast-7 | 0.863 |  |
| ca-central-1 | 0.191 | 18 |
| ca-west-1 | 0.244 |  |
| eu-central-1 | 0.498 |  |
| eu-central-2 | 0.512 |  |
| eu-north-1 | 0.558 |  |
| eu-south-1 | 0.534 |  |
| eu-south-2 | 0.514 |  |
| eu-west-1 | 0.408 |  |
| eu-west-2 | 0.454 |  |
| eu-west-3 | 0.491 |  |
| il-central-1 | 0.655 |  |
| me-central-1 | 0.893 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.205 |  |
| sa-east-1 | 0.632 |  |
| us-east-1 | 0.163 | 5140 |
| us-east-2 | 0.145 | 1691 |
| us-gov-east-1 | 0.148 | 1934 |
| us-gov-west-1 | 0.179 | 237 |
| us-west-1 | 0.136 | 4160 |
| us-west-2 | 0.177 | 194 |

