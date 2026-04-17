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
Updated: 2026-04-17T18:47:32.882851+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.010 |  |
| ap-east-1 | 0.705 |  |
| ap-east-2 | 0.639 |  |
| ap-northeast-1 | 0.526 |  |
| ap-northeast-2 | 0.641 |  |
| ap-northeast-3 | 0.563 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.898 |  |
| ap-southeast-1 | 0.782 |  |
| ap-southeast-2 | 0.717 |  |
| ap-southeast-3 | 0.847 |  |
| ap-southeast-4 | 0.750 |  |
| ap-southeast-5 | 0.802 |  |
| ap-southeast-6 | 0.754 |  |
| ap-southeast-7 | 0.883 |  |
| ca-central-1 | 0.260 | 16 |
| ca-west-1 | 0.231 |  |
| eu-central-1 | 0.555 |  |
| eu-central-2 | 0.557 |  |
| eu-north-1 | 0.592 |  |
| eu-south-1 | 0.572 |  |
| eu-south-2 | 0.556 |  |
| eu-west-1 | 0.451 |  |
| eu-west-2 | 0.476 |  |
| eu-west-3 | 0.509 |  |
| il-central-1 | 0.711 |  |
| me-central-1 | 0.816 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.283 |  |
| sa-east-1 | 0.632 |  |
| us-east-1 | 0.198 | 4518 |
| us-east-2 | 0.177 | 1509 |
| us-gov-east-1 | 0.221 | 1652 |
| us-gov-west-1 | 0.202 | 194 |
| us-west-1 | 0.199 | 3425 |
| us-west-2 | 0.206 | 156 |

