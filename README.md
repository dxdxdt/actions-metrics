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
Updated: 2026-05-31T16:59:25.606533+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.910 |  |
| ap-east-1 | 0.773 |  |
| ap-east-2 | 0.711 |  |
| ap-northeast-1 | 0.596 |  |
| ap-northeast-2 | 0.699 |  |
| ap-northeast-3 | 0.623 |  |
| ap-south-1 | 0.839 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.853 |  |
| ap-southeast-2 | 0.767 |  |
| ap-southeast-3 | 0.901 |  |
| ap-southeast-4 | 0.809 |  |
| ap-southeast-5 | 0.871 |  |
| ap-southeast-6 | 0.811 |  |
| ap-southeast-7 | 0.947 |  |
| ca-central-1 | 0.127 | 16 |
| ca-west-1 | 0.270 |  |
| eu-central-1 | 0.422 |  |
| eu-central-2 | 0.445 |  |
| eu-north-1 | 0.460 |  |
| eu-south-1 | 0.442 |  |
| eu-south-2 | 0.459 |  |
| eu-west-1 | 0.340 |  |
| eu-west-2 | 0.373 |  |
| eu-west-3 | 0.407 |  |
| il-central-1 | 0.573 |  |
| me-central-1 | 0.836 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.533 |  |
| us-east-1 | 0.086 | 4707 |
| us-east-2 | 0.094 | 1617 |
| us-gov-east-1 | 0.099 | 1708 |
| us-gov-west-1 | 0.287 | 195 |
| us-west-1 | 0.220 | 3625 |
| us-west-2 | 0.281 | 161 |

