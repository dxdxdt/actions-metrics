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
Updated: 2026-05-17T02:15:35.370772+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.944 |  |
| ap-east-1 | 0.742 |  |
| ap-east-2 | 0.681 |  |
| ap-northeast-1 | 0.563 |  |
| ap-northeast-2 | 0.668 |  |
| ap-northeast-3 | 0.584 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.814 |  |
| ap-southeast-2 | 0.719 |  |
| ap-southeast-3 | 0.871 |  |
| ap-southeast-4 | 0.761 |  |
| ap-southeast-5 | 0.834 |  |
| ap-southeast-6 | 0.760 |  |
| ap-southeast-7 | 0.914 |  |
| ca-central-1 | 0.170 | 16 |
| ca-west-1 | 0.255 |  |
| eu-central-1 | 0.451 |  |
| eu-central-2 | 0.467 |  |
| eu-north-1 | 0.491 |  |
| eu-south-1 | 0.477 |  |
| eu-south-2 | 0.487 |  |
| eu-west-1 | 0.369 |  |
| eu-west-2 | 0.416 |  |
| eu-west-3 | 0.436 |  |
| il-central-1 | 0.614 |  |
| me-central-1 | 0.835 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.212 |  |
| sa-east-1 | 0.571 |  |
| us-east-1 | 0.120 | 4651 |
| us-east-2 | 0.111 | 1597 |
| us-gov-east-1 | 0.121 | 1696 |
| us-gov-west-1 | 0.235 | 195 |
| us-west-1 | 0.182 | 3570 |
| us-west-2 | 0.235 | 158 |

