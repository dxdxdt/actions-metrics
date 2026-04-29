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
Updated: 2026-04-29T22:51:17.731580+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.023 |  |
| ap-east-1 | 0.674 |  |
| ap-east-2 | 0.609 |  |
| ap-northeast-1 | 0.496 |  |
| ap-northeast-2 | 0.590 |  |
| ap-northeast-3 | 0.516 |  |
| ap-south-1 | 0.898 |  |
| ap-south-2 | 0.910 |  |
| ap-southeast-1 | 0.752 |  |
| ap-southeast-2 | 0.662 |  |
| ap-southeast-3 | 0.808 |  |
| ap-southeast-4 | 0.698 |  |
| ap-southeast-5 | 0.770 |  |
| ap-southeast-6 | 0.691 |  |
| ap-southeast-7 | 0.854 |  |
| ca-central-1 | 0.241 | 16 |
| ca-west-1 | 0.225 |  |
| eu-central-1 | 0.526 |  |
| eu-central-2 | 0.537 |  |
| eu-north-1 | 0.604 |  |
| eu-south-1 | 0.545 |  |
| eu-south-2 | 0.548 |  |
| eu-west-1 | 0.450 |  |
| eu-west-2 | 0.490 |  |
| eu-west-3 | 0.500 |  |
| il-central-1 | 0.700 |  |
| me-central-1 | 0.892 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.633 |  |
| us-east-1 | 0.180 | 4576 |
| us-east-2 | 0.182 | 1547 |
| us-gov-east-1 | 0.171 | 1667 |
| us-gov-west-1 | 0.182 | 194 |
| us-west-1 | 0.122 | 3502 |
| us-west-2 | 0.181 | 157 |

