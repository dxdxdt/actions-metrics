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
Updated: 2026-04-30T20:52:47.454976+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.059 |  |
| ap-east-1 | 0.647 |  |
| ap-east-2 | 0.582 |  |
| ap-northeast-1 | 0.467 |  |
| ap-northeast-2 | 0.572 |  |
| ap-northeast-3 | 0.495 |  |
| ap-south-1 | 0.921 |  |
| ap-south-2 | 0.912 |  |
| ap-southeast-1 | 0.724 |  |
| ap-southeast-2 | 0.612 |  |
| ap-southeast-3 | 0.776 |  |
| ap-southeast-4 | 0.648 |  |
| ap-southeast-5 | 0.743 |  |
| ap-southeast-6 | 0.643 |  |
| ap-southeast-7 | 0.832 |  |
| ca-central-1 | 0.279 | 16 |
| ca-west-1 | 0.202 |  |
| eu-central-1 | 0.584 |  |
| eu-central-2 | 0.592 |  |
| eu-north-1 | 0.621 |  |
| eu-south-1 | 0.614 |  |
| eu-south-2 | 0.597 |  |
| eu-west-1 | 0.508 |  |
| eu-west-2 | 0.526 |  |
| eu-west-3 | 0.545 |  |
| il-central-1 | 0.732 |  |
| me-central-1 | 0.942 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.686 |  |
| us-east-1 | 0.224 | 4576 |
| us-east-2 | 0.197 | 1551 |
| us-gov-east-1 | 0.202 | 1668 |
| us-gov-west-1 | 0.140 | 194 |
| us-west-1 | 0.083 | 3507 |
| us-west-2 | 0.137 | 157 |

