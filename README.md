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
Updated: 2026-03-29T20:23:10.442231+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.914 |  |
| ap-east-1 | 0.776 |  |
| ap-east-2 | 0.716 |  |
| ap-northeast-1 | 0.599 |  |
| ap-northeast-2 | 0.705 |  |
| ap-northeast-3 | 0.621 |  |
| ap-south-1 | 0.860 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.851 |  |
| ap-southeast-2 | 0.776 |  |
| ap-southeast-3 | 0.908 |  |
| ap-southeast-4 | 0.810 |  |
| ap-southeast-5 | 0.877 |  |
| ap-southeast-6 | 0.817 |  |
| ap-southeast-7 | 0.962 |  |
| ca-central-1 | 0.104 | 16 |
| ca-west-1 | 0.307 |  |
| eu-central-1 | 0.419 |  |
| eu-central-2 | 0.436 |  |
| eu-north-1 | 0.474 |  |
| eu-south-1 | 0.442 |  |
| eu-south-2 | 0.479 |  |
| eu-west-1 | 0.338 |  |
| eu-west-2 | 0.371 |  |
| eu-west-3 | 0.402 |  |
| il-central-1 | 0.601 |  |
| me-central-1 | 0.792 |  |
| me-south-1 | 0.771 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.522 |  |
| us-east-1 | 0.069 | 4394 |
| us-east-2 | 0.072 | 1466 |
| us-gov-east-1 | 0.074 | 1613 |
| us-gov-west-1 | 0.287 | 190 |
| us-west-1 | 0.223 | 3317 |
| us-west-2 | 0.279 | 152 |

