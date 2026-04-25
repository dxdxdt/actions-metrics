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
Updated: 2026-04-25T17:32:55.029925+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.927 |  |
| ap-east-1 | 0.772 |  |
| ap-east-2 | 0.702 |  |
| ap-northeast-1 | 0.585 |  |
| ap-northeast-2 | 0.699 |  |
| ap-northeast-3 | 0.611 |  |
| ap-south-1 | 0.875 |  |
| ap-south-2 | 0.934 |  |
| ap-southeast-1 | 0.848 |  |
| ap-southeast-2 | 0.775 |  |
| ap-southeast-3 | 0.897 |  |
| ap-southeast-4 | 0.799 |  |
| ap-southeast-5 | 0.858 |  |
| ap-southeast-6 | 0.815 |  |
| ap-southeast-7 | 0.950 |  |
| ca-central-1 | 0.106 | 16 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.438 |  |
| eu-central-2 | 0.452 |  |
| eu-north-1 | 0.493 |  |
| eu-south-1 | 0.462 |  |
| eu-south-2 | 0.469 |  |
| eu-west-1 | 0.356 |  |
| eu-west-2 | 0.389 |  |
| eu-west-3 | 0.419 |  |
| il-central-1 | 0.589 |  |
| me-central-1 | 0.822 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.540 |  |
| us-east-1 | 0.079 | 4564 |
| us-east-2 | 0.068 | 1530 |
| us-gov-east-1 | 0.068 | 1664 |
| us-gov-west-1 | 0.273 | 194 |
| us-west-1 | 0.218 | 3477 |
| us-west-2 | 0.269 | 157 |

