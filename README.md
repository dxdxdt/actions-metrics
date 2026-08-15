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
Updated: 2026-08-15T14:14:57.459498+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.989 |  |
| ap-east-1 | 0.688 |  |
| ap-east-2 | 0.627 |  |
| ap-northeast-1 | 0.508 |  |
| ap-northeast-2 | 0.618 |  |
| ap-northeast-3 | 0.536 |  |
| ap-south-1 | 0.900 |  |
| ap-south-2 | 0.916 |  |
| ap-southeast-1 | 0.773 |  |
| ap-southeast-2 | 0.662 |  |
| ap-southeast-3 | 0.822 |  |
| ap-southeast-4 | 0.709 |  |
| ap-southeast-5 | 0.788 |  |
| ap-southeast-6 | 0.730 |  |
| ap-southeast-7 | 0.872 |  |
| ca-central-1 | 0.234 | 18 |
| ca-west-1 | 0.254 |  |
| eu-central-1 | 0.500 |  |
| eu-central-2 | 0.532 |  |
| eu-north-1 | 0.557 |  |
| eu-south-1 | 0.537 |  |
| eu-south-2 | 0.539 |  |
| eu-west-1 | 0.417 |  |
| eu-west-2 | 0.460 |  |
| eu-west-3 | 0.480 |  |
| il-central-1 | 0.648 |  |
| me-central-1 | 0.887 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.193 |  |
| sa-east-1 | 0.610 |  |
| us-east-1 | 0.173 | 5000 |
| us-east-2 | 0.186 | 1679 |
| us-gov-east-1 | 0.168 | 1830 |
| us-gov-west-1 | 0.198 | 222 |
| us-west-1 | 0.138 | 3957 |
| us-west-2 | 0.197 | 178 |

