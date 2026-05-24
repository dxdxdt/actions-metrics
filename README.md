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
Updated: 2026-05-24T23:54:04.236329+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.050 |  |
| ap-east-1 | 0.653 |  |
| ap-east-2 | 0.592 |  |
| ap-northeast-1 | 0.477 |  |
| ap-northeast-2 | 0.582 |  |
| ap-northeast-3 | 0.501 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.882 |  |
| ap-southeast-1 | 0.728 |  |
| ap-southeast-2 | 0.613 |  |
| ap-southeast-3 | 0.782 |  |
| ap-southeast-4 | 0.654 |  |
| ap-southeast-5 | 0.750 |  |
| ap-southeast-6 | 0.645 |  |
| ap-southeast-7 | 0.834 |  |
| ca-central-1 | 0.276 | 16 |
| ca-west-1 | 0.209 |  |
| eu-central-1 | 0.557 |  |
| eu-central-2 | 0.581 |  |
| eu-north-1 | 0.606 |  |
| eu-south-1 | 0.599 |  |
| eu-south-2 | 0.617 |  |
| eu-west-1 | 0.487 |  |
| eu-west-2 | 0.526 |  |
| eu-west-3 | 0.537 |  |
| il-central-1 | 0.727 |  |
| me-central-1 | 0.925 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.680 |  |
| us-east-1 | 0.236 | 4687 |
| us-east-2 | 0.200 | 1611 |
| us-gov-east-1 | 0.210 | 1704 |
| us-gov-west-1 | 0.138 | 195 |
| us-west-1 | 0.082 | 3597 |
| us-west-2 | 0.137 | 160 |

