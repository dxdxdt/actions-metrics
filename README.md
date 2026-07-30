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
Updated: 2026-07-30T01:44:20.657828+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.908 |  |
| ap-east-1 | 0.771 |  |
| ap-east-2 | 0.712 |  |
| ap-northeast-1 | 0.592 |  |
| ap-northeast-2 | 0.702 |  |
| ap-northeast-3 | 0.618 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.938 |  |
| ap-southeast-1 | 0.847 |  |
| ap-southeast-2 | 0.759 |  |
| ap-southeast-3 | 0.902 |  |
| ap-southeast-4 | 0.799 |  |
| ap-southeast-5 | 0.864 |  |
| ap-southeast-6 | 0.784 |  |
| ap-southeast-7 | 0.949 |  |
| ca-central-1 | 0.139 | 17 |
| ca-west-1 | 0.238 |  |
| eu-central-1 | 0.429 |  |
| eu-central-2 | 0.445 |  |
| eu-north-1 | 0.468 |  |
| eu-south-1 | 0.454 |  |
| eu-south-2 | 0.472 |  |
| eu-west-1 | 0.360 |  |
| eu-west-2 | 0.382 |  |
| eu-west-3 | 0.419 |  |
| il-central-1 | 0.590 |  |
| me-central-1 | 0.834 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.534 |  |
| us-east-1 | 0.091 | 4921 |
| us-east-2 | 0.103 | 1671 |
| us-gov-east-1 | 0.101 | 1786 |
| us-gov-west-1 | 0.268 | 208 |
| us-west-1 | 0.222 | 3854 |
| us-west-2 | 0.270 | 171 |

