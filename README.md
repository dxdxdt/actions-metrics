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
Updated: 2026-06-05T20:47:06.726623+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.993 |  |
| ap-east-1 | 0.714 |  |
| ap-east-2 | 0.643 |  |
| ap-northeast-1 | 0.534 |  |
| ap-northeast-2 | 0.641 |  |
| ap-northeast-3 | 0.559 |  |
| ap-south-1 | 0.862 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.785 |  |
| ap-southeast-2 | 0.671 |  |
| ap-southeast-3 | 0.845 |  |
| ap-southeast-4 | 0.717 |  |
| ap-southeast-5 | 0.807 |  |
| ap-southeast-6 | 0.704 |  |
| ap-southeast-7 | 0.882 |  |
| ca-central-1 | 0.223 | 16 |
| ca-west-1 | 0.216 |  |
| eu-central-1 | 0.506 |  |
| eu-central-2 | 0.539 |  |
| eu-north-1 | 0.540 |  |
| eu-south-1 | 0.548 |  |
| eu-south-2 | 0.539 |  |
| eu-west-1 | 0.418 |  |
| eu-west-2 | 0.457 |  |
| eu-west-3 | 0.474 |  |
| il-central-1 | 0.663 |  |
| me-central-1 | 0.933 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.611 |  |
| us-east-1 | 0.173 | 4724 |
| us-east-2 | 0.176 | 1625 |
| us-gov-east-1 | 0.195 | 1708 |
| us-gov-west-1 | 0.197 | 196 |
| us-west-1 | 0.141 | 3636 |
| us-west-2 | 0.199 | 162 |

