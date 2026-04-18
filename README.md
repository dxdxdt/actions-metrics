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
Updated: 2026-04-18T09:40:56.940643+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.004 |  |
| ap-east-1 | 0.682 |  |
| ap-east-2 | 0.617 |  |
| ap-northeast-1 | 0.508 |  |
| ap-northeast-2 | 0.622 |  |
| ap-northeast-3 | 0.529 |  |
| ap-south-1 | 0.921 |  |
| ap-south-2 | 0.953 |  |
| ap-southeast-1 | 0.754 |  |
| ap-southeast-2 | 0.658 |  |
| ap-southeast-3 | 0.807 |  |
| ap-southeast-4 | 0.694 |  |
| ap-southeast-5 | 0.772 |  |
| ap-southeast-6 | 0.740 |  |
| ap-southeast-7 | 0.857 |  |
| ca-central-1 | 0.241 | 16 |
| ca-west-1 | 0.243 |  |
| eu-central-1 | 0.517 |  |
| eu-central-2 | 0.530 |  |
| eu-north-1 | 0.567 |  |
| eu-south-1 | 0.544 |  |
| eu-south-2 | 0.552 |  |
| eu-west-1 | 0.426 |  |
| eu-west-2 | 0.484 |  |
| eu-west-3 | 0.498 |  |
| il-central-1 | 0.685 |  |
| me-central-1 | 0.889 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.216 |  |
| sa-east-1 | 0.645 |  |
| us-east-1 | 0.181 | 4520 |
| us-east-2 | 0.174 | 1510 |
| us-gov-east-1 | 0.193 | 1655 |
| us-gov-west-1 | 0.170 | 194 |
| us-west-1 | 0.116 | 3430 |
| us-west-2 | 0.172 | 156 |

