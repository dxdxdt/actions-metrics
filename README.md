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
Updated: 2026-04-03T08:51:01.159919+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.059 |  |
| ap-east-1 | 0.662 |  |
| ap-east-2 | 0.593 |  |
| ap-northeast-1 | 0.478 |  |
| ap-northeast-2 | 0.597 |  |
| ap-northeast-3 | 0.501 |  |
| ap-south-1 | 0.920 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.739 |  |
| ap-southeast-2 | 0.598 |  |
| ap-southeast-3 | 0.798 |  |
| ap-southeast-4 | 0.637 |  |
| ap-southeast-5 | 0.760 |  |
| ap-southeast-6 | 0.639 |  |
| ap-southeast-7 | 0.838 |  |
| ca-central-1 | 0.288 | 16 |
| ca-west-1 | 0.195 |  |
| eu-central-1 | 0.571 |  |
| eu-central-2 | 0.592 |  |
| eu-north-1 | 0.631 |  |
| eu-south-1 | 0.608 |  |
| eu-south-2 | 0.610 |  |
| eu-west-1 | 0.486 |  |
| eu-west-2 | 0.546 |  |
| eu-west-3 | 0.554 |  |
| il-central-1 | 0.756 |  |
| me-central-1 | 0.941 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.686 |  |
| us-east-1 | 0.242 | 4423 |
| us-east-2 | 0.221 | 1475 |
| us-gov-east-1 | 0.222 | 1622 |
| us-gov-west-1 | 0.127 | 191 |
| us-west-1 | 0.071 | 3343 |
| us-west-2 | 0.127 | 153 |

