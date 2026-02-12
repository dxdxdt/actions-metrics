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
Updated: 2026-02-12T17:52:33.403698+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.021 |  |
| ap-east-1 | 0.691 |  |
| ap-northeast-1 | 0.511 |  |
| ap-northeast-2 | 0.617 |  |
| ap-south-1 | 0.886 |  |
| ap-south-2 | 0.871 |  |
| ap-southeast-1 | 0.761 |  |
| ap-southeast-2 | 0.638 |  |
| ap-southeast-3 | 0.822 |  |
| ap-southeast-4 | 0.680 |  |
| ca-central-1 | 0.243 | 16 |
| ca-west-1 | 0.204 |  |
| eu-central-1 | 0.535 |  |
| eu-central-2 | 0.556 |  |
| eu-north-1 | 0.589 |  |
| eu-south-1 | 0.558 |  |
| eu-south-2 | 0.573 |  |
| eu-west-1 | 0.468 |  |
| eu-west-2 | 0.492 |  |
| eu-west-3 | 0.516 |  |
| il-central-1 | 0.713 |  |
| me-central-1 | 0.918 |  |
| me-south-1 | 0.874 |  |
| sa-east-1 | 0.637 |  |
| us-east-1 | 0.202 | 4110 |
| us-east-2 | 0.195 | 1334 |
| us-gov-east-1 | 0.198 | 1453 |
| us-gov-west-1 | 0.169 | 145 |
| us-west-1 | 0.124 | 3049 |
| us-west-2 | 0.180 | 125 |

