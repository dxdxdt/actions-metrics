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
Updated: 2026-03-03T13:54:54.031643+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.021 |  |
| ap-east-1 | 0.675 |  |
| ap-east-2 | 0.619 |  |
| ap-northeast-1 | 0.499 |  |
| ap-northeast-2 | 0.605 |  |
| ap-northeast-3 | 0.524 |  |
| ap-south-1 | 0.957 |  |
| ap-south-2 | 0.968 |  |
| ap-southeast-1 | 0.751 |  |
| ap-southeast-2 | 0.657 |  |
| ap-southeast-3 | 0.808 |  |
| ap-southeast-4 | 0.698 |  |
| ap-southeast-5 | 0.768 |  |
| ap-southeast-6 | 0.727 |  |
| ap-southeast-7 | 0.853 |  |
| ca-central-1 | 0.211 | 16 |
| ca-west-1 | 0.214 |  |
| eu-central-1 | 0.536 |  |
| eu-central-2 | 0.541 |  |
| eu-north-1 | 0.589 |  |
| eu-south-1 | 0.554 |  |
| eu-south-2 | 0.569 |  |
| eu-west-1 | 0.462 |  |
| eu-west-2 | 0.498 |  |
| eu-west-3 | 0.513 |  |
| il-central-1 | 0.700 |  |
| me-central-1 | 0.895 |  |
| me-south-1 | 0.862 |  |
| mx-central-1 | 0.194 |  |
| sa-east-1 | 0.636 |  |
| us-east-1 | 0.202 | 4212 |
| us-east-2 | 0.150 | 1393 |
| us-gov-east-1 | 0.148 | 1527 |
| us-gov-west-1 | 0.155 | 169 |
| us-west-1 | 0.154 | 3164 |
| us-west-2 | 0.155 | 137 |

