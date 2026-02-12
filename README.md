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
Updated: 2026-02-12T11:35:17.782903+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.023 |  |
| ap-east-1 | 0.662 |  |
| ap-northeast-1 | 0.480 |  |
| ap-northeast-2 | 0.589 |  |
| ap-south-1 | 0.921 |  |
| ap-south-2 | 0.898 |  |
| ap-southeast-1 | 0.737 |  |
| ap-southeast-2 | 0.635 |  |
| ap-southeast-3 | 0.794 |  |
| ap-southeast-4 | 0.675 |  |
| ca-central-1 | 0.254 | 16 |
| ca-west-1 | 0.205 |  |
| eu-central-1 | 0.548 |  |
| eu-central-2 | 0.556 |  |
| eu-north-1 | 0.592 |  |
| eu-south-1 | 0.580 |  |
| eu-south-2 | 0.587 |  |
| eu-west-1 | 0.475 |  |
| eu-west-2 | 0.504 |  |
| eu-west-3 | 0.514 |  |
| il-central-1 | 0.734 |  |
| me-central-1 | 0.955 |  |
| me-south-1 | 0.916 |  |
| sa-east-1 | 0.639 |  |
| us-east-1 | 0.201 | 4108 |
| us-east-2 | 0.193 | 1334 |
| us-gov-east-1 | 0.195 | 1453 |
| us-gov-west-1 | 0.160 | 145 |
| us-west-1 | 0.109 | 3046 |
| us-west-2 | 0.165 | 125 |

