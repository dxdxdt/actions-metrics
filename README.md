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
Updated: 2026-04-15T11:51:30.865701+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.062 |  |
| ap-east-1 | 0.642 |  |
| ap-east-2 | 0.575 |  |
| ap-northeast-1 | 0.454 |  |
| ap-northeast-2 | 0.563 |  |
| ap-northeast-3 | 0.481 |  |
| ap-south-1 | 0.932 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.715 |  |
| ap-southeast-2 | 0.616 |  |
| ap-southeast-3 | 0.776 |  |
| ap-southeast-4 | 0.654 |  |
| ap-southeast-5 | 0.734 |  |
| ap-southeast-6 | 0.657 |  |
| ap-southeast-7 | 0.817 |  |
| ca-central-1 | 0.293 | 16 |
| ca-west-1 | 0.204 |  |
| eu-central-1 | 0.564 |  |
| eu-central-2 | 0.580 |  |
| eu-north-1 | 0.618 |  |
| eu-south-1 | 0.615 |  |
| eu-south-2 | 0.599 |  |
| eu-west-1 | 0.499 |  |
| eu-west-2 | 0.534 |  |
| eu-west-3 | 0.542 |  |
| il-central-1 | 0.746 |  |
| me-central-1 | 0.928 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.672 |  |
| us-east-1 | 0.227 | 4506 |
| us-east-2 | 0.222 | 1500 |
| us-gov-east-1 | 0.210 | 1648 |
| us-gov-west-1 | 0.147 | 193 |
| us-west-1 | 0.083 | 3417 |
| us-west-2 | 0.141 | 155 |

