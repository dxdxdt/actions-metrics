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
Updated: 2026-11-14T01:08:57.282989+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.797 |  |
| ap-east-1 | 0.480 |  |
| ap-east-2 | 0.429 |  |
| ap-northeast-1 | 0.345 |  |
| ap-northeast-2 | 0.422 |  |
| ap-northeast-3 | 0.368 |  |
| ap-south-1 | 0.653 |  |
| ap-south-2 | 0.635 |  |
| ap-southeast-1 | 0.534 |  |
| ap-southeast-2 | 0.497 |  |
| ap-southeast-3 | 0.576 |  |
| ap-southeast-4 | 0.543 |  |
| ap-southeast-5 | 0.549 |  |
| ap-southeast-6 | 0.512 |  |
| ap-southeast-7 | 0.609 |  |
| ca-central-1 | 0.187 | 18 |
| ca-west-1 | 0.140 |  |
| eu-central-1 | 0.421 |  |
| eu-central-2 | 0.430 |  |
| eu-north-1 | 0.456 |  |
| eu-south-1 | 0.441 |  |
| eu-south-2 | 0.431 |  |
| eu-west-1 | 0.361 |  |
| eu-west-2 | 0.385 |  |
| eu-west-3 | 0.402 |  |
| il-central-1 | 0.555 |  |
| me-central-1 | 0.687 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.711 |  |
| mx-central-1 | 0.199 |  |
| sa-east-1 | 0.510 |  |
| us-east-1 | 0.164 | 5183 |
| us-east-2 | 0.165 | 1727 |
| us-gov-east-1 | 0.168 | 1960 |
| us-gov-west-1 | 0.086 | 247 |
| us-west-1 | 0.112 | 4216 |
| us-west-2 | 0.088 | 197 |

