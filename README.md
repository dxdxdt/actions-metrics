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
Updated: 2026-04-11T07:45:37.305942+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.054 |  |
| ap-east-1 | 0.651 |  |
| ap-east-2 | 0.590 |  |
| ap-northeast-1 | 0.475 |  |
| ap-northeast-2 | 0.577 |  |
| ap-northeast-3 | 0.500 |  |
| ap-south-1 | 0.908 |  |
| ap-south-2 | 0.904 |  |
| ap-southeast-1 | 0.726 |  |
| ap-southeast-2 | 0.618 |  |
| ap-southeast-3 | 0.782 |  |
| ap-southeast-4 | 0.657 |  |
| ap-southeast-5 | 0.744 |  |
| ap-southeast-6 | 0.695 |  |
| ap-southeast-7 | 0.833 |  |
| ca-central-1 | 0.278 | 16 |
| ca-west-1 | 0.200 |  |
| eu-central-1 | 0.583 |  |
| eu-central-2 | 0.595 |  |
| eu-north-1 | 0.621 |  |
| eu-south-1 | 0.600 |  |
| eu-south-2 | 0.605 |  |
| eu-west-1 | 0.497 |  |
| eu-west-2 | 0.522 |  |
| eu-west-3 | 0.548 |  |
| il-central-1 | 0.757 |  |
| me-central-1 | 0.933 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.677 |  |
| us-east-1 | 0.222 | 4475 |
| us-east-2 | 0.183 | 1492 |
| us-gov-east-1 | 0.212 | 1640 |
| us-gov-west-1 | 0.138 | 192 |
| us-west-1 | 0.087 | 3394 |
| us-west-2 | 0.137 | 155 |

