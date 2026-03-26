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
Updated: 2026-03-26T21:25:21.434351+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.881 |  |
| ap-east-1 | 0.794 |  |
| ap-east-2 | 0.735 |  |
| ap-northeast-1 | 0.617 |  |
| ap-northeast-2 | 0.718 |  |
| ap-northeast-3 | 0.643 |  |
| ap-south-1 | 0.847 |  |
| ap-south-2 | 0.894 |  |
| ap-southeast-1 | 0.877 |  |
| ap-southeast-2 | 0.777 |  |
| ap-southeast-3 | 0.928 |  |
| ap-southeast-4 | 0.825 |  |
| ap-southeast-5 | 0.893 |  |
| ap-southeast-6 | 0.833 |  |
| ap-southeast-7 | 0.984 |  |
| ca-central-1 | 0.113 | 16 |
| ca-west-1 | 0.272 |  |
| eu-central-1 | 0.397 |  |
| eu-central-2 | 0.417 |  |
| eu-north-1 | 0.460 |  |
| eu-south-1 | 0.423 |  |
| eu-south-2 | 0.461 |  |
| eu-west-1 | 0.316 |  |
| eu-west-2 | 0.354 |  |
| eu-west-3 | 0.374 |  |
| il-central-1 | 0.573 |  |
| me-central-1 | 0.756 |  |
| me-south-1 | 0.738 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.511 |  |
| us-east-1 | 0.067 | 4366 |
| us-east-2 | 0.091 | 1457 |
| us-gov-east-1 | 0.092 | 1606 |
| us-gov-west-1 | 0.299 | 190 |
| us-west-1 | 0.249 | 3303 |
| us-west-2 | 0.298 | 151 |

