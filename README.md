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
Updated: 2026-04-14T20:00:36.496860+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.916 |  |
| ap-east-1 | 0.777 |  |
| ap-east-2 | 0.713 |  |
| ap-northeast-1 | 0.599 |  |
| ap-northeast-2 | 0.719 |  |
| ap-northeast-3 | 0.640 |  |
| ap-south-1 | 0.859 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.857 |  |
| ap-southeast-2 | 0.777 |  |
| ap-southeast-3 | 0.908 |  |
| ap-southeast-4 | 0.825 |  |
| ap-southeast-5 | 0.871 |  |
| ap-southeast-6 | 0.832 |  |
| ap-southeast-7 | 0.961 |  |
| ca-central-1 | 0.124 | 16 |
| ca-west-1 | 0.263 |  |
| eu-central-1 | 0.432 |  |
| eu-central-2 | 0.448 |  |
| eu-north-1 | 0.488 |  |
| eu-south-1 | 0.449 |  |
| eu-south-2 | 0.462 |  |
| eu-west-1 | 0.345 |  |
| eu-west-2 | 0.383 |  |
| eu-west-3 | 0.408 |  |
| il-central-1 | 0.591 |  |
| me-central-1 | 0.802 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.523 |  |
| us-east-1 | 0.080 | 4503 |
| us-east-2 | 0.097 | 1500 |
| us-gov-east-1 | 0.102 | 1647 |
| us-gov-west-1 | 0.291 | 193 |
| us-west-1 | 0.242 | 3411 |
| us-west-2 | 0.286 | 155 |

