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
Updated: 2026-03-20T08:33:10.306901+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.968 |  |
| ap-east-1 | 0.742 |  |
| ap-east-2 | 0.685 |  |
| ap-northeast-1 | 0.560 |  |
| ap-northeast-2 | 0.672 |  |
| ap-northeast-3 | 0.589 |  |
| ap-south-1 | 0.920 |  |
| ap-south-2 | 0.973 |  |
| ap-southeast-1 | 0.818 |  |
| ap-southeast-2 | 0.732 |  |
| ap-southeast-3 | 0.870 |  |
| ap-southeast-4 | 0.780 |  |
| ap-southeast-5 | 0.842 |  |
| ap-southeast-6 | 0.769 |  |
| ap-southeast-7 | 0.924 |  |
| ca-central-1 | 0.176 | 16 |
| ca-west-1 | 0.275 |  |
| eu-central-1 | 0.462 |  |
| eu-central-2 | 0.483 |  |
| eu-north-1 | 0.518 |  |
| eu-south-1 | 0.496 |  |
| eu-south-2 | 0.498 |  |
| eu-west-1 | 0.403 |  |
| eu-west-2 | 0.432 |  |
| eu-west-3 | 0.447 |  |
| il-central-1 | 0.642 |  |
| me-central-1 | 0.835 |  |
| me-south-1 | 0.804 |  |
| mx-central-1 | 0.194 |  |
| sa-east-1 | 0.564 |  |
| us-east-1 | 0.123 | 4312 |
| us-east-2 | 0.109 | 1439 |
| us-gov-east-1 | 0.128 | 1590 |
| us-gov-west-1 | 0.255 | 189 |
| us-west-1 | 0.208 | 3265 |
| us-west-2 | 0.229 | 148 |

