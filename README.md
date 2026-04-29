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
Updated: 2026-04-29T15:05:23.126236+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.954 |  |
| ap-east-1 | 0.753 |  |
| ap-east-2 | 0.693 |  |
| ap-northeast-1 | 0.573 |  |
| ap-northeast-2 | 0.677 |  |
| ap-northeast-3 | 0.601 |  |
| ap-south-1 | 0.844 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.831 |  |
| ap-southeast-2 | 0.739 |  |
| ap-southeast-3 | 0.883 |  |
| ap-southeast-4 | 0.786 |  |
| ap-southeast-5 | 0.850 |  |
| ap-southeast-6 | 0.797 |  |
| ap-southeast-7 | 0.947 |  |
| ca-central-1 | 0.112 | 16 |
| ca-west-1 | 0.228 |  |
| eu-central-1 | 0.474 |  |
| eu-central-2 | 0.478 |  |
| eu-north-1 | 0.532 |  |
| eu-south-1 | 0.487 |  |
| eu-south-2 | 0.504 |  |
| eu-west-1 | 0.394 |  |
| eu-west-2 | 0.425 |  |
| eu-west-3 | 0.444 |  |
| il-central-1 | 0.635 |  |
| me-central-1 | 0.833 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.217 |  |
| sa-east-1 | 0.564 |  |
| us-east-1 | 0.104 | 4575 |
| us-east-2 | 0.074 | 1546 |
| us-gov-east-1 | 0.076 | 1667 |
| us-gov-west-1 | 0.251 | 194 |
| us-west-1 | 0.197 | 3499 |
| us-west-2 | 0.249 | 157 |

