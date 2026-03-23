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
Updated: 2026-03-23T23:25:53.787485+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.923 |  |
| ap-east-1 | 0.761 |  |
| ap-east-2 | 0.705 |  |
| ap-northeast-1 | 0.582 |  |
| ap-northeast-2 | 0.689 |  |
| ap-northeast-3 | 0.609 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.947 |  |
| ap-southeast-1 | 0.837 |  |
| ap-southeast-2 | 0.760 |  |
| ap-southeast-3 | 0.895 |  |
| ap-southeast-4 | 0.805 |  |
| ap-southeast-5 | 0.859 |  |
| ap-southeast-6 | 0.801 |  |
| ap-southeast-7 | 0.943 |  |
| ca-central-1 | 0.129 | 16 |
| ca-west-1 | 0.243 |  |
| eu-central-1 | 0.441 |  |
| eu-central-2 | 0.462 |  |
| eu-north-1 | 0.495 |  |
| eu-south-1 | 0.477 |  |
| eu-south-2 | 0.470 |  |
| eu-west-1 | 0.372 |  |
| eu-west-2 | 0.402 |  |
| eu-west-3 | 0.422 |  |
| il-central-1 | 0.627 |  |
| me-central-1 | 0.830 |  |
| me-south-1 | 0.790 |  |
| mx-central-1 | 0.208 |  |
| sa-east-1 | 0.539 |  |
| us-east-1 | 0.088 | 4343 |
| us-east-2 | 0.117 | 1449 |
| us-gov-east-1 | 0.093 | 1598 |
| us-gov-west-1 | 0.275 | 190 |
| us-west-1 | 0.227 | 3288 |
| us-west-2 | 0.267 | 151 |

