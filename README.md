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
Updated: 2026-02-19T23:23:42.801979+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.012 |  |
| ap-east-1 | 0.667 |  |
| ap-east-2 | 0.601 |  |
| ap-northeast-1 | 0.485 |  |
| ap-northeast-2 | 0.596 |  |
| ap-northeast-3 | 0.519 |  |
| ap-south-1 | 0.916 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.747 |  |
| ap-southeast-2 | 0.647 |  |
| ap-southeast-3 | 0.803 |  |
| ap-southeast-4 | 0.688 |  |
| ap-southeast-5 | 0.766 |  |
| ap-southeast-6 | 0.708 |  |
| ap-southeast-7 | 0.854 |  |
| ca-central-1 | 0.248 | 16 |
| ca-west-1 | 0.238 |  |
| eu-central-1 | 0.526 |  |
| eu-central-2 | 0.541 |  |
| eu-north-1 | 0.573 |  |
| eu-south-1 | 0.549 |  |
| eu-south-2 | 0.552 |  |
| eu-west-1 | 0.439 |  |
| eu-west-2 | 0.483 |  |
| eu-west-3 | 0.506 |  |
| il-central-1 | 0.711 |  |
| me-central-1 | 0.898 |  |
| me-south-1 | 0.859 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.627 |  |
| us-east-1 | 0.185 | 4147 |
| us-east-2 | 0.181 | 1356 |
| us-gov-east-1 | 0.188 | 1492 |
| us-gov-west-1 | 0.170 | 157 |
| us-west-1 | 0.130 | 3085 |
| us-west-2 | 0.170 | 128 |

