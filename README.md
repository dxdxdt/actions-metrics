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
Updated: 2026-11-06T17:46:22.168563+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.717 |  |
| ap-east-1 | 0.541 |  |
| ap-east-2 | 0.497 |  |
| ap-northeast-1 | 0.407 |  |
| ap-northeast-2 | 0.487 |  |
| ap-northeast-3 | 0.427 |  |
| ap-south-1 | 0.635 |  |
| ap-south-2 | 0.661 |  |
| ap-southeast-1 | 0.601 |  |
| ap-southeast-2 | 0.553 |  |
| ap-southeast-3 | 0.642 |  |
| ap-southeast-4 | 0.596 |  |
| ap-southeast-5 | 0.614 |  |
| ap-southeast-6 | 0.570 |  |
| ap-southeast-7 | 0.676 |  |
| ca-central-1 | 0.133 | 18 |
| ca-west-1 | 0.173 |  |
| eu-central-1 | 0.354 |  |
| eu-central-2 | 0.362 |  |
| eu-north-1 | 0.382 |  |
| eu-south-1 | 0.362 |  |
| eu-south-2 | 0.366 |  |
| eu-west-1 | 0.294 |  |
| eu-west-2 | 0.322 |  |
| eu-west-3 | 0.348 |  |
| il-central-1 | 0.466 |  |
| me-central-1 | 0.618 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.194 |  |
| sa-east-1 | 0.437 |  |
| us-east-1 | 0.101 | 5174 |
| us-east-2 | 0.115 | 1721 |
| us-gov-east-1 | 0.126 | 1959 |
| us-gov-west-1 | 0.163 | 245 |
| us-west-1 | 0.154 | 4207 |
| us-west-2 | 0.164 | 196 |

