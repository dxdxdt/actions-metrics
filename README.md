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
Updated: 2026-02-23T21:37:44.947031+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.939 |  |
| ap-east-1 | 0.739 |  |
| ap-east-2 | 0.671 |  |
| ap-northeast-1 | 0.553 |  |
| ap-northeast-2 | 0.666 |  |
| ap-northeast-3 | 0.580 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.817 |  |
| ap-southeast-2 | 0.726 |  |
| ap-southeast-3 | 0.877 |  |
| ap-southeast-4 | 0.753 |  |
| ap-southeast-5 | 0.836 |  |
| ap-southeast-6 | 0.789 |  |
| ap-southeast-7 | 0.919 |  |
| ca-central-1 | 0.181 | 16 |
| ca-west-1 | 0.249 |  |
| eu-central-1 | 0.453 |  |
| eu-central-2 | 0.468 |  |
| eu-north-1 | 0.508 |  |
| eu-south-1 | 0.490 |  |
| eu-south-2 | 0.489 |  |
| eu-west-1 | 0.387 |  |
| eu-west-2 | 0.415 |  |
| eu-west-3 | 0.430 |  |
| il-central-1 | 0.640 |  |
| me-central-1 | 0.849 |  |
| me-south-1 | 0.814 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.562 |  |
| us-east-1 | 0.124 | 4173 |
| us-east-2 | 0.143 | 1372 |
| us-gov-east-1 | 0.145 | 1502 |
| us-gov-west-1 | 0.239 | 160 |
| us-west-1 | 0.201 | 3108 |
| us-west-2 | 0.242 | 130 |

