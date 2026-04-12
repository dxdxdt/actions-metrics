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
Updated: 2026-04-12T20:27:59.510093+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.936 |  |
| ap-east-1 | 0.759 |  |
| ap-east-2 | 0.700 |  |
| ap-northeast-1 | 0.581 |  |
| ap-northeast-2 | 0.691 |  |
| ap-northeast-3 | 0.610 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.898 |  |
| ap-southeast-1 | 0.836 |  |
| ap-southeast-2 | 0.749 |  |
| ap-southeast-3 | 0.897 |  |
| ap-southeast-4 | 0.785 |  |
| ap-southeast-5 | 0.853 |  |
| ap-southeast-6 | 0.850 |  |
| ap-southeast-7 | 0.935 |  |
| ca-central-1 | 0.129 | 16 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.434 |  |
| eu-central-2 | 0.448 |  |
| eu-north-1 | 0.490 |  |
| eu-south-1 | 0.454 |  |
| eu-south-2 | 0.482 |  |
| eu-west-1 | 0.360 |  |
| eu-west-2 | 0.395 |  |
| eu-west-3 | 0.413 |  |
| il-central-1 | 0.606 |  |
| me-central-1 | 0.805 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.540 |  |
| us-east-1 | 0.087 | 4489 |
| us-east-2 | 0.100 | 1497 |
| us-gov-east-1 | 0.104 | 1646 |
| us-gov-west-1 | 0.260 | 192 |
| us-west-1 | 0.211 | 3402 |
| us-west-2 | 0.261 | 155 |

