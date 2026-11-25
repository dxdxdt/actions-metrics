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
Updated: 2026-11-25T02:52:43.462723+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.728 |  |
| ap-east-1 | 0.524 |  |
| ap-east-2 | 0.477 |  |
| ap-northeast-1 | 0.388 |  |
| ap-northeast-2 | 0.469 |  |
| ap-northeast-3 | 0.407 |  |
| ap-south-1 | 0.715 |  |
| ap-south-2 | 0.740 |  |
| ap-southeast-1 | 0.580 |  |
| ap-southeast-2 | 0.507 |  |
| ap-southeast-3 | 0.625 |  |
| ap-southeast-4 | 0.572 |  |
| ap-southeast-5 | 0.592 |  |
| ap-southeast-6 | 0.526 |  |
| ap-southeast-7 | 0.657 |  |
| ca-central-1 | 0.144 | 18 |
| ca-west-1 | 0.182 |  |
| eu-central-1 | 0.388 |  |
| eu-central-2 | 0.389 |  |
| eu-north-1 | 0.404 |  |
| eu-south-1 | 0.396 |  |
| eu-south-2 | 0.397 |  |
| eu-west-1 | 0.325 |  |
| eu-west-2 | 0.347 |  |
| eu-west-3 | 0.367 |  |
| il-central-1 | 0.492 |  |
| me-central-1 | 0.657 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.690 |  |
| mx-central-1 | 0.155 |  |
| sa-east-1 | 0.470 |  |
| us-east-1 | 0.125 | 5195 |
| us-east-2 | 0.098 | 1730 |
| us-gov-east-1 | 0.116 | 1967 |
| us-gov-west-1 | 0.145 | 249 |
| us-west-1 | 0.100 | 4225 |
| us-west-2 | 0.144 | 200 |

