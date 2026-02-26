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
Updated: 2026-02-26T12:45:08.265246+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.935 |  |
| ap-east-1 | 0.758 |  |
| ap-east-2 | 0.694 |  |
| ap-northeast-1 | 0.582 |  |
| ap-northeast-2 | 0.700 |  |
| ap-northeast-3 | 0.611 |  |
| ap-south-1 | 0.859 |  |
| ap-south-2 | 0.915 |  |
| ap-southeast-1 | 0.834 |  |
| ap-southeast-2 | 0.743 |  |
| ap-southeast-3 | 0.895 |  |
| ap-southeast-4 | 0.779 |  |
| ap-southeast-5 | 0.858 |  |
| ap-southeast-6 | 0.802 |  |
| ap-southeast-7 | 0.941 |  |
| ca-central-1 | 0.165 | 16 |
| ca-west-1 | 0.256 |  |
| eu-central-1 | 0.453 |  |
| eu-central-2 | 0.474 |  |
| eu-north-1 | 0.483 |  |
| eu-south-1 | 0.464 |  |
| eu-south-2 | 0.480 |  |
| eu-west-1 | 0.366 |  |
| eu-west-2 | 0.397 |  |
| eu-west-3 | 0.432 |  |
| il-central-1 | 0.614 |  |
| me-central-1 | 0.830 |  |
| me-south-1 | 0.788 |  |
| mx-central-1 | 0.251 |  |
| sa-east-1 | 0.546 |  |
| us-east-1 | 0.114 | 4187 |
| us-east-2 | 0.134 | 1380 |
| us-gov-east-1 | 0.127 | 1512 |
| us-gov-west-1 | 0.266 | 162 |
| us-west-1 | 0.212 | 3123 |
| us-west-2 | 0.264 | 132 |

