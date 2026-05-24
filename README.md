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
Updated: 2026-05-24T14:56:59.711790+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.945 |  |
| ap-east-1 | 0.736 |  |
| ap-east-2 | 0.680 |  |
| ap-northeast-1 | 0.555 |  |
| ap-northeast-2 | 0.674 |  |
| ap-northeast-3 | 0.582 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.919 |  |
| ap-southeast-1 | 0.817 |  |
| ap-southeast-2 | 0.723 |  |
| ap-southeast-3 | 0.864 |  |
| ap-southeast-4 | 0.757 |  |
| ap-southeast-5 | 0.828 |  |
| ap-southeast-6 | 0.762 |  |
| ap-southeast-7 | 0.918 |  |
| ca-central-1 | 0.172 | 16 |
| ca-west-1 | 0.274 |  |
| eu-central-1 | 0.455 |  |
| eu-central-2 | 0.481 |  |
| eu-north-1 | 0.498 |  |
| eu-south-1 | 0.482 |  |
| eu-south-2 | 0.503 |  |
| eu-west-1 | 0.377 |  |
| eu-west-2 | 0.407 |  |
| eu-west-3 | 0.445 |  |
| il-central-1 | 0.602 |  |
| me-central-1 | 0.836 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.575 |  |
| us-east-1 | 0.133 | 4684 |
| us-east-2 | 0.141 | 1610 |
| us-gov-east-1 | 0.121 | 1704 |
| us-gov-west-1 | 0.239 | 195 |
| us-west-1 | 0.178 | 3594 |
| us-west-2 | 0.237 | 159 |

