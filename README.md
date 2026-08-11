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
Updated: 2026-08-11T18:50:50.358836+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.058 |  |
| ap-east-1 | 0.641 |  |
| ap-east-2 | 0.584 |  |
| ap-northeast-1 | 0.461 |  |
| ap-northeast-2 | 0.572 |  |
| ap-northeast-3 | 0.489 |  |
| ap-south-1 | 0.894 |  |
| ap-south-2 | 0.867 |  |
| ap-southeast-1 | 0.716 |  |
| ap-southeast-2 | 0.615 |  |
| ap-southeast-3 | 0.773 |  |
| ap-southeast-4 | 0.658 |  |
| ap-southeast-5 | 0.736 |  |
| ap-southeast-6 | 0.648 |  |
| ap-southeast-7 | 0.823 |  |
| ca-central-1 | 0.291 | 18 |
| ca-west-1 | 0.294 |  |
| eu-central-1 | 0.566 |  |
| eu-central-2 | 0.593 |  |
| eu-north-1 | 0.631 |  |
| eu-south-1 | 0.605 |  |
| eu-south-2 | 0.597 |  |
| eu-west-1 | 0.491 |  |
| eu-west-2 | 0.526 |  |
| eu-west-3 | 0.547 |  |
| il-central-1 | 0.716 |  |
| me-central-1 | 0.962 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.248 |  |
| sa-east-1 | 0.689 |  |
| us-east-1 | 0.240 | 4975 |
| us-east-2 | 0.274 | 1679 |
| us-gov-east-1 | 0.273 | 1822 |
| us-gov-west-1 | 0.123 | 217 |
| us-west-1 | 0.095 | 3925 |
| us-west-2 | 0.124 | 176 |

