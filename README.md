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
Updated: 2026-05-25T23:58:50.383070+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.078 |  |
| ap-east-1 | 0.630 |  |
| ap-east-2 | 0.570 |  |
| ap-northeast-1 | 0.455 |  |
| ap-northeast-2 | 0.571 |  |
| ap-northeast-3 | 0.479 |  |
| ap-south-1 | 0.909 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.709 |  |
| ap-southeast-2 | 0.590 |  |
| ap-southeast-3 | 0.761 |  |
| ap-southeast-4 | 0.628 |  |
| ap-southeast-5 | 0.728 |  |
| ap-southeast-6 | 0.635 |  |
| ap-southeast-7 | 0.815 |  |
| ca-central-1 | 0.305 | 16 |
| ca-west-1 | 0.187 |  |
| eu-central-1 | 0.582 |  |
| eu-central-2 | 0.605 |  |
| eu-north-1 | 0.620 |  |
| eu-south-1 | 0.618 |  |
| eu-south-2 | 0.620 |  |
| eu-west-1 | 0.516 |  |
| eu-west-2 | 0.553 |  |
| eu-west-3 | 0.566 |  |
| il-central-1 | 0.770 |  |
| me-central-1 | 0.992 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.704 |  |
| us-east-1 | 0.252 | 4688 |
| us-east-2 | 0.213 | 1611 |
| us-gov-east-1 | 0.224 | 1706 |
| us-gov-west-1 | 0.114 | 195 |
| us-west-1 | 0.059 | 3603 |
| us-west-2 | 0.115 | 160 |

