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
Updated: 2026-03-31T10:51:06.470529+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.895 |  |
| ap-east-1 | 0.796 |  |
| ap-east-2 | 0.740 |  |
| ap-northeast-1 | 0.619 |  |
| ap-northeast-2 | 0.730 |  |
| ap-northeast-3 | 0.645 |  |
| ap-south-1 | 0.844 |  |
| ap-south-2 | 0.925 |  |
| ap-southeast-1 | 0.869 |  |
| ap-southeast-2 | 0.781 |  |
| ap-southeast-3 | 0.919 |  |
| ap-southeast-4 | 0.823 |  |
| ap-southeast-5 | 0.889 |  |
| ap-southeast-6 | 0.828 |  |
| ap-southeast-7 | 0.986 |  |
| ca-central-1 | 0.104 | 16 |
| ca-west-1 | 0.256 |  |
| eu-central-1 | 0.407 |  |
| eu-central-2 | 0.423 |  |
| eu-north-1 | 0.461 |  |
| eu-south-1 | 0.422 |  |
| eu-south-2 | 0.434 |  |
| eu-west-1 | 0.320 |  |
| eu-west-2 | 0.358 |  |
| eu-west-3 | 0.383 |  |
| il-central-1 | 0.581 |  |
| me-central-1 | 0.773 |  |
| me-south-1 | 0.744 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.504 |  |
| us-east-1 | 0.059 | 4406 |
| us-east-2 | 0.067 | 1469 |
| us-gov-east-1 | 0.079 | 1616 |
| us-gov-west-1 | 0.307 | 190 |
| us-west-1 | 0.252 | 3324 |
| us-west-2 | 0.297 | 152 |

