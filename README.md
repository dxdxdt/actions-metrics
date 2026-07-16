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
Updated: 2026-07-16T17:06:20.409173+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.033 |  |
| ap-east-1 | 0.655 |  |
| ap-east-2 | 0.596 |  |
| ap-northeast-1 | 0.479 |  |
| ap-northeast-2 | 0.580 |  |
| ap-northeast-3 | 0.500 |  |
| ap-south-1 | 0.908 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.728 |  |
| ap-southeast-2 | 0.618 |  |
| ap-southeast-3 | 0.786 |  |
| ap-southeast-4 | 0.659 |  |
| ap-southeast-5 | 0.747 |  |
| ap-southeast-6 | 0.650 |  |
| ap-southeast-7 | 0.828 |  |
| ca-central-1 | 0.276 | 16 |
| ca-west-1 | 0.197 |  |
| eu-central-1 | 0.554 |  |
| eu-central-2 | 0.596 |  |
| eu-north-1 | 0.609 |  |
| eu-south-1 | 0.602 |  |
| eu-south-2 | 0.590 |  |
| eu-west-1 | 0.502 |  |
| eu-west-2 | 0.522 |  |
| eu-west-3 | 0.551 |  |
| il-central-1 | 0.705 |  |
| me-central-1 | 0.968 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.219 |  |
| sa-east-1 | 0.671 |  |
| us-east-1 | 0.232 | 4873 |
| us-east-2 | 0.229 | 1656 |
| us-gov-east-1 | 0.196 | 1757 |
| us-gov-west-1 | 0.141 | 202 |
| us-west-1 | 0.084 | 3789 |
| us-west-2 | 0.141 | 166 |

