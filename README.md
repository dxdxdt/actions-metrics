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
Updated: 2026-04-02T15:54:03.225626+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.030 |  |
| ap-east-1 | 0.688 |  |
| ap-east-2 | 0.615 |  |
| ap-northeast-1 | 0.503 |  |
| ap-northeast-2 | 0.605 |  |
| ap-northeast-3 | 0.529 |  |
| ap-south-1 | 0.915 |  |
| ap-south-2 | 0.912 |  |
| ap-southeast-1 | 0.753 |  |
| ap-southeast-2 | 0.645 |  |
| ap-southeast-3 | 0.814 |  |
| ap-southeast-4 | 0.689 |  |
| ap-southeast-5 | 0.780 |  |
| ap-southeast-6 | 0.679 |  |
| ap-southeast-7 | 0.853 |  |
| ca-central-1 | 0.237 | 16 |
| ca-west-1 | 0.202 |  |
| eu-central-1 | 0.546 |  |
| eu-central-2 | 0.563 |  |
| eu-north-1 | 0.607 |  |
| eu-south-1 | 0.554 |  |
| eu-south-2 | 0.583 |  |
| eu-west-1 | 0.469 |  |
| eu-west-2 | 0.495 |  |
| eu-west-3 | 0.523 |  |
| il-central-1 | 0.704 |  |
| me-central-1 | 0.913 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.656 |  |
| us-east-1 | 0.191 | 4419 |
| us-east-2 | 0.166 | 1474 |
| us-gov-east-1 | 0.172 | 1621 |
| us-gov-west-1 | 0.167 | 190 |
| us-west-1 | 0.115 | 3337 |
| us-west-2 | 0.166 | 153 |

