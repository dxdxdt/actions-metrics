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
Updated: 2026-04-04T16:27:30.467199+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.944 |  |
| ap-east-1 | 0.744 |  |
| ap-east-2 | 0.691 |  |
| ap-northeast-1 | 0.568 |  |
| ap-northeast-2 | 0.674 |  |
| ap-northeast-3 | 0.597 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.929 |  |
| ap-southeast-1 | 0.822 |  |
| ap-southeast-2 | 0.732 |  |
| ap-southeast-3 | 0.883 |  |
| ap-southeast-4 | 0.776 |  |
| ap-southeast-5 | 0.843 |  |
| ap-southeast-6 | 0.771 |  |
| ap-southeast-7 | 0.923 |  |
| ca-central-1 | 0.119 | 16 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.461 |  |
| eu-central-2 | 0.471 |  |
| eu-north-1 | 0.506 |  |
| eu-south-1 | 0.479 |  |
| eu-south-2 | 0.496 |  |
| eu-west-1 | 0.385 |  |
| eu-west-2 | 0.418 |  |
| eu-west-3 | 0.441 |  |
| il-central-1 | 0.637 |  |
| me-central-1 | 0.830 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.218 |  |
| sa-east-1 | 0.557 |  |
| us-east-1 | 0.099 | 4434 |
| us-east-2 | 0.084 | 1478 |
| us-gov-east-1 | 0.081 | 1627 |
| us-gov-west-1 | 0.246 | 191 |
| us-west-1 | 0.198 | 3353 |
| us-west-2 | 0.249 | 153 |

