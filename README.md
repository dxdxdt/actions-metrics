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
Updated: 2026-07-29T01:51:37.079891+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.052 |  |
| ap-east-1 | 0.641 |  |
| ap-east-2 | 0.581 |  |
| ap-northeast-1 | 0.463 |  |
| ap-northeast-2 | 0.572 |  |
| ap-northeast-3 | 0.489 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.869 |  |
| ap-southeast-1 | 0.714 |  |
| ap-southeast-2 | 0.593 |  |
| ap-southeast-3 | 0.771 |  |
| ap-southeast-4 | 0.636 |  |
| ap-southeast-5 | 0.738 |  |
| ap-southeast-6 | 0.650 |  |
| ap-southeast-7 | 0.818 |  |
| ca-central-1 | 0.297 | 17 |
| ca-west-1 | 0.215 |  |
| eu-central-1 | 0.570 |  |
| eu-central-2 | 0.595 |  |
| eu-north-1 | 0.625 |  |
| eu-south-1 | 0.609 |  |
| eu-south-2 | 0.611 |  |
| eu-west-1 | 0.495 |  |
| eu-west-2 | 0.536 |  |
| eu-west-3 | 0.548 |  |
| il-central-1 | 0.730 |  |
| me-central-1 | 0.939 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.249 |  |
| sa-east-1 | 0.687 |  |
| us-east-1 | 0.245 | 4917 |
| us-east-2 | 0.221 | 1670 |
| us-gov-east-1 | 0.227 | 1782 |
| us-gov-west-1 | 0.123 | 207 |
| us-west-1 | 0.067 | 3852 |
| us-west-2 | 0.126 | 171 |

