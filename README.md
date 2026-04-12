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
Updated: 2026-04-12T08:51:42.674354+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.020 |  |
| ap-east-1 | 0.679 |  |
| ap-east-2 | 0.618 |  |
| ap-northeast-1 | 0.505 |  |
| ap-northeast-2 | 0.608 |  |
| ap-northeast-3 | 0.528 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.756 |  |
| ap-southeast-2 | 0.654 |  |
| ap-southeast-3 | 0.815 |  |
| ap-southeast-4 | 0.690 |  |
| ap-southeast-5 | 0.777 |  |
| ap-southeast-6 | 0.736 |  |
| ap-southeast-7 | 0.862 |  |
| ca-central-1 | 0.230 | 16 |
| ca-west-1 | 0.208 |  |
| eu-central-1 | 0.529 |  |
| eu-central-2 | 0.552 |  |
| eu-north-1 | 0.591 |  |
| eu-south-1 | 0.550 |  |
| eu-south-2 | 0.566 |  |
| eu-west-1 | 0.466 |  |
| eu-west-2 | 0.493 |  |
| eu-west-3 | 0.498 |  |
| il-central-1 | 0.704 |  |
| me-central-1 | 0.895 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.636 |  |
| us-east-1 | 0.188 | 4485 |
| us-east-2 | 0.168 | 1495 |
| us-gov-east-1 | 0.171 | 1643 |
| us-gov-west-1 | 0.177 | 192 |
| us-west-1 | 0.119 | 3399 |
| us-west-2 | 0.175 | 155 |

