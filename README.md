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
Updated: 2026-08-19T20:18:01.113909+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.991 |  |
| ap-east-1 | 0.683 |  |
| ap-east-2 | 0.625 |  |
| ap-northeast-1 | 0.508 |  |
| ap-northeast-2 | 0.613 |  |
| ap-northeast-3 | 0.533 |  |
| ap-south-1 | 0.862 |  |
| ap-south-2 | 0.878 |  |
| ap-southeast-1 | 0.759 |  |
| ap-southeast-2 | 0.685 |  |
| ap-southeast-3 | 0.814 |  |
| ap-southeast-4 | 0.734 |  |
| ap-southeast-5 | 0.778 |  |
| ap-southeast-6 | 0.714 |  |
| ap-southeast-7 | 0.866 |  |
| ca-central-1 | 0.213 | 18 |
| ca-west-1 | 0.196 |  |
| eu-central-1 | 0.502 |  |
| eu-central-2 | 0.524 |  |
| eu-north-1 | 0.552 |  |
| eu-south-1 | 0.527 |  |
| eu-south-2 | 0.544 |  |
| eu-west-1 | 0.425 |  |
| eu-west-2 | 0.461 |  |
| eu-west-3 | 0.497 |  |
| il-central-1 | 0.660 |  |
| me-central-1 | 0.899 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.618 |  |
| us-east-1 | 0.180 | 5024 |
| us-east-2 | 0.182 | 1680 |
| us-gov-east-1 | 0.179 | 1856 |
| us-gov-west-1 | 0.180 | 224 |
| us-west-1 | 0.169 | 3997 |
| us-west-2 | 0.179 | 183 |

