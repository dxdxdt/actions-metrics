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
Updated: 2026-11-09T18:02:34.072969+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.713 |  |
| ap-east-1 | 0.544 |  |
| ap-east-2 | 0.502 |  |
| ap-northeast-1 | 0.411 |  |
| ap-northeast-2 | 0.489 |  |
| ap-northeast-3 | 0.432 |  |
| ap-south-1 | 0.692 |  |
| ap-south-2 | 0.753 |  |
| ap-southeast-1 | 0.599 |  |
| ap-southeast-2 | 0.526 |  |
| ap-southeast-3 | 0.647 |  |
| ap-southeast-4 | 0.589 |  |
| ap-southeast-5 | 0.618 |  |
| ap-southeast-6 | 0.549 |  |
| ap-southeast-7 | 0.679 |  |
| ca-central-1 | 0.111 | 18 |
| ca-west-1 | 0.138 |  |
| eu-central-1 | 0.357 |  |
| eu-central-2 | 0.379 |  |
| eu-north-1 | 0.389 |  |
| eu-south-1 | 0.368 |  |
| eu-south-2 | 0.356 |  |
| eu-west-1 | 0.296 |  |
| eu-west-2 | 0.339 |  |
| eu-west-3 | 0.341 |  |
| il-central-1 | 0.473 |  |
| me-central-1 | 0.730 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.144 |  |
| sa-east-1 | 0.445 |  |
| us-east-1 | 0.107 | 5178 |
| us-east-2 | 0.077 | 1725 |
| us-gov-east-1 | 0.095 | 1959 |
| us-gov-west-1 | 0.170 | 245 |
| us-west-1 | 0.121 | 4212 |
| us-west-2 | 0.168 | 196 |

