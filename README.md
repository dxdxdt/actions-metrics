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
Updated: 2026-03-26T08:50:30.234654+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.062 |  |
| ap-east-1 | 0.657 |  |
| ap-east-2 | 0.594 |  |
| ap-northeast-1 | 0.473 |  |
| ap-northeast-2 | 0.589 |  |
| ap-northeast-3 | 0.504 |  |
| ap-south-1 | 0.925 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.734 |  |
| ap-southeast-2 | 0.613 |  |
| ap-southeast-3 | 0.794 |  |
| ap-southeast-4 | 0.652 |  |
| ap-southeast-5 | 0.758 |  |
| ap-southeast-6 | 0.658 |  |
| ap-southeast-7 | 0.843 |  |
| ca-central-1 | 0.291 | 16 |
| ca-west-1 | 0.265 |  |
| eu-central-1 | 0.581 |  |
| eu-central-2 | 0.585 |  |
| eu-north-1 | 0.633 |  |
| eu-south-1 | 0.599 |  |
| eu-south-2 | 0.596 |  |
| eu-west-1 | 0.486 |  |
| eu-west-2 | 0.525 |  |
| eu-west-3 | 0.559 |  |
| il-central-1 | 0.751 |  |
| me-central-1 | 0.937 |  |
| me-south-1 | 0.895 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.680 |  |
| us-east-1 | 0.229 | 4360 |
| us-east-2 | 0.205 | 1456 |
| us-gov-east-1 | 0.208 | 1604 |
| us-gov-west-1 | 0.140 | 190 |
| us-west-1 | 0.085 | 3301 |
| us-west-2 | 0.141 | 151 |

