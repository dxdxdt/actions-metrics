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
Updated: 2026-03-08T23:17:19.777256+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.993 |  |
| ap-east-1 | 0.698 |  |
| ap-east-2 | 0.656 |  |
| ap-northeast-1 | 0.517 |  |
| ap-northeast-2 | 0.631 |  |
| ap-northeast-3 | 0.543 |  |
| ap-south-1 | 0.872 |  |
| ap-south-2 | 0.864 |  |
| ap-southeast-1 | 0.776 |  |
| ap-southeast-2 | 0.661 |  |
| ap-southeast-3 | 0.834 |  |
| ap-southeast-4 | 0.704 |  |
| ap-southeast-5 | 0.793 |  |
| ap-southeast-6 | 0.732 |  |
| ap-southeast-7 | 0.877 |  |
| ca-central-1 | 0.217 | 16 |
| ca-west-1 | 0.219 |  |
| eu-central-1 | 0.495 |  |
| eu-central-2 | 0.517 |  |
| eu-north-1 | 0.553 |  |
| eu-south-1 | 0.527 |  |
| eu-south-2 | 0.537 |  |
| eu-west-1 | 0.432 |  |
| eu-west-2 | 0.476 |  |
| eu-west-3 | 0.475 |  |
| il-central-1 | 0.673 |  |
| me-central-1 | 0.877 |  |
| me-south-1 | 0.836 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.609 |  |
| us-east-1 | 0.171 | 4245 |
| us-east-2 | 0.171 | 1409 |
| us-gov-east-1 | 0.178 | 1546 |
| us-gov-west-1 | 0.193 | 175 |
| us-west-1 | 0.135 | 3197 |
| us-west-2 | 0.196 | 144 |

