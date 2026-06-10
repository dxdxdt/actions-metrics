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
Updated: 2026-06-10T02:40:14.008561+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.873 |  |
| ap-east-1 | 0.801 |  |
| ap-east-2 | 0.739 |  |
| ap-northeast-1 | 0.624 |  |
| ap-northeast-2 | 0.745 |  |
| ap-northeast-3 | 0.653 |  |
| ap-south-1 | 0.843 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.879 |  |
| ap-southeast-2 | 0.773 |  |
| ap-southeast-3 | 0.938 |  |
| ap-southeast-4 | 0.821 |  |
| ap-southeast-5 | 0.901 |  |
| ap-southeast-6 | 0.818 |  |
| ap-southeast-7 | 0.992 |  |
| ca-central-1 | 0.103 | 16 |
| ca-west-1 | 0.304 |  |
| eu-central-1 | 0.386 |  |
| eu-central-2 | 0.419 |  |
| eu-north-1 | 0.439 |  |
| eu-south-1 | 0.428 |  |
| eu-south-2 | 0.418 |  |
| eu-west-1 | 0.313 |  |
| eu-west-2 | 0.349 |  |
| eu-west-3 | 0.368 |  |
| il-central-1 | 0.554 |  |
| me-central-1 | 0.862 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.494 |  |
| us-east-1 | 0.063 | 4738 |
| us-east-2 | 0.093 | 1630 |
| us-gov-east-1 | 0.101 | 1710 |
| us-gov-west-1 | 0.311 | 198 |
| us-west-1 | 0.261 | 3653 |
| us-west-2 | 0.307 | 162 |

