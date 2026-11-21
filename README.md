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
Updated: 2026-11-21T18:30:47.572934+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.746 |  |
| ap-east-1 | 0.503 |  |
| ap-east-2 | 0.458 |  |
| ap-northeast-1 | 0.370 |  |
| ap-northeast-2 | 0.430 |  |
| ap-northeast-3 | 0.379 |  |
| ap-south-1 | 0.674 |  |
| ap-south-2 | 0.668 |  |
| ap-southeast-1 | 0.580 |  |
| ap-southeast-2 | 0.490 |  |
| ap-southeast-3 | 0.625 |  |
| ap-southeast-4 | 0.537 |  |
| ap-southeast-5 | 0.591 |  |
| ap-southeast-6 | 0.535 |  |
| ap-southeast-7 | 0.655 |  |
| ca-central-1 | 0.148 | 18 |
| ca-west-1 | 0.142 |  |
| eu-central-1 | 0.383 |  |
| eu-central-2 | 0.392 |  |
| eu-north-1 | 0.416 |  |
| eu-south-1 | 0.404 |  |
| eu-south-2 | 0.395 |  |
| eu-west-1 | 0.316 |  |
| eu-west-2 | 0.344 |  |
| eu-west-3 | 0.364 |  |
| il-central-1 | 0.505 |  |
| me-central-1 | 0.692 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.686 |  |
| mx-central-1 | 0.193 |  |
| sa-east-1 | 0.466 |  |
| us-east-1 | 0.129 | 5193 |
| us-east-2 | 0.128 | 1730 |
| us-gov-east-1 | 0.126 | 1964 |
| us-gov-west-1 | 0.105 | 248 |
| us-west-1 | 0.111 | 4221 |
| us-west-2 | 0.106 | 200 |

