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
Updated: 2025-05-14T03:37:35.221778+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.905 |  |
| ap-east-1 | 0.782 |  |
| ap-northeast-1 | 0.599 |  |
| ap-northeast-2 | 0.696 |  |
| ap-south-1 | 0.871 |  |
| ap-southeast-1 | 0.849 |  |
| ap-southeast-2 | 0.758 |  |
| ca-central-1 | 0.102 | 10 |
| eu-central-1 | 0.439 |  |
| eu-north-1 | 0.476 |  |
| eu-south-1 | 0.453 |  |
| eu-west-1 | 0.348 |  |
| eu-west-2 | 0.395 |  |
| eu-west-3 | 0.411 |  |
| me-south-1 | 0.778 |  |
| sa-east-1 | 0.533 |  |
| us-east-1 | 0.087 | 1869 |
| us-east-2 | 0.083 | 427 |
| us-gov-east-1 | 0.073 | 548 |
| us-gov-west-1 | 0.250 | 1 |
| us-west-1 | 0.243 | 1295 |
| us-west-2 | 0.251 |  |

