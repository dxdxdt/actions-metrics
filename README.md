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
Updated: 2026-04-28T02:08:42.301953+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.018 |  |
| ap-east-1 | 0.708 |  |
| ap-east-2 | 0.621 |  |
| ap-northeast-1 | 0.553 |  |
| ap-northeast-2 | 0.606 |  |
| ap-northeast-3 | 0.526 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.767 |  |
| ap-southeast-2 | 0.670 |  |
| ap-southeast-3 | 0.815 |  |
| ap-southeast-4 | 0.709 |  |
| ap-southeast-5 | 0.831 |  |
| ap-southeast-6 | 0.701 |  |
| ap-southeast-7 | 0.889 |  |
| ca-central-1 | 0.226 | 16 |
| ca-west-1 | 0.222 |  |
| eu-central-1 | 0.525 |  |
| eu-central-2 | 0.539 |  |
| eu-north-1 | 0.581 |  |
| eu-south-1 | 0.551 |  |
| eu-south-2 | 0.539 |  |
| eu-west-1 | 0.431 |  |
| eu-west-2 | 0.470 |  |
| eu-west-3 | 0.486 |  |
| il-central-1 | 0.674 |  |
| me-central-1 | 0.873 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.627 |  |
| us-east-1 | 0.170 | 4572 |
| us-east-2 | 0.169 | 1542 |
| us-gov-east-1 | 0.161 | 1666 |
| us-gov-west-1 | 0.190 | 194 |
| us-west-1 | 0.134 | 3492 |
| us-west-2 | 0.186 | 157 |

