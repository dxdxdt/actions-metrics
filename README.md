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
Updated: 2026-04-12T07:59:33.819545+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.939 |  |
| ap-east-1 | 0.746 |  |
| ap-east-2 | 0.686 |  |
| ap-northeast-1 | 0.575 |  |
| ap-northeast-2 | 0.675 |  |
| ap-northeast-3 | 0.597 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.919 |  |
| ap-southeast-1 | 0.825 |  |
| ap-southeast-2 | 0.744 |  |
| ap-southeast-3 | 0.884 |  |
| ap-southeast-4 | 0.778 |  |
| ap-southeast-5 | 0.849 |  |
| ap-southeast-6 | 0.847 |  |
| ap-southeast-7 | 0.932 |  |
| ca-central-1 | 0.137 | 16 |
| ca-west-1 | 0.244 |  |
| eu-central-1 | 0.445 |  |
| eu-central-2 | 0.466 |  |
| eu-north-1 | 0.499 |  |
| eu-south-1 | 0.472 |  |
| eu-south-2 | 0.481 |  |
| eu-west-1 | 0.374 |  |
| eu-west-2 | 0.412 |  |
| eu-west-3 | 0.426 |  |
| il-central-1 | 0.613 |  |
| me-central-1 | 0.817 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.550 |  |
| us-east-1 | 0.100 | 4485 |
| us-east-2 | 0.106 | 1495 |
| us-gov-east-1 | 0.100 | 1643 |
| us-gov-west-1 | 0.262 | 192 |
| us-west-1 | 0.200 | 3398 |
| us-west-2 | 0.261 | 155 |

