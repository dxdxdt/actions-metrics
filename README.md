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
Updated: 2026-06-25T11:33:53.429788+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.016 |  |
| ap-east-1 | 0.668 |  |
| ap-east-2 | 0.604 |  |
| ap-northeast-1 | 0.489 |  |
| ap-northeast-2 | 0.601 |  |
| ap-northeast-3 | 0.515 |  |
| ap-south-1 | 0.894 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.744 |  |
| ap-southeast-2 | 0.630 |  |
| ap-southeast-3 | 0.795 |  |
| ap-southeast-4 | 0.676 |  |
| ap-southeast-5 | 0.761 |  |
| ap-southeast-6 | 0.666 |  |
| ap-southeast-7 | 0.846 |  |
| ca-central-1 | 0.267 | 16 |
| ca-west-1 | 0.197 |  |
| eu-central-1 | 0.536 |  |
| eu-central-2 | 0.565 |  |
| eu-north-1 | 0.579 |  |
| eu-south-1 | 0.582 |  |
| eu-south-2 | 0.567 |  |
| eu-west-1 | 0.460 |  |
| eu-west-2 | 0.492 |  |
| eu-west-3 | 0.515 |  |
| il-central-1 | 0.701 |  |
| me-central-1 | 0.939 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.261 |  |
| sa-east-1 | 0.653 |  |
| us-east-1 | 0.210 | 4787 |
| us-east-2 | 0.198 | 1640 |
| us-gov-east-1 | 0.201 | 1720 |
| us-gov-west-1 | 0.159 | 199 |
| us-west-1 | 0.101 | 3703 |
| us-west-2 | 0.157 | 163 |

