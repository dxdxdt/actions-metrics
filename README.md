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
Updated: 2026-07-04T22:50:54.259917+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.075 |  |
| ap-east-1 | 0.651 |  |
| ap-east-2 | 0.591 |  |
| ap-northeast-1 | 0.474 |  |
| ap-northeast-2 | 0.577 |  |
| ap-northeast-3 | 0.500 |  |
| ap-south-1 | 0.886 |  |
| ap-south-2 | 0.867 |  |
| ap-southeast-1 | 0.725 |  |
| ap-southeast-2 | 0.607 |  |
| ap-southeast-3 | 0.781 |  |
| ap-southeast-4 | 0.651 |  |
| ap-southeast-5 | 0.747 |  |
| ap-southeast-6 | 0.642 |  |
| ap-southeast-7 | 0.830 |  |
| ca-central-1 | 0.284 | 16 |
| ca-west-1 | 0.207 |  |
| eu-central-1 | 0.590 |  |
| eu-central-2 | 0.621 |  |
| eu-north-1 | 0.644 |  |
| eu-south-1 | 0.629 |  |
| eu-south-2 | 0.629 |  |
| eu-west-1 | 0.513 |  |
| eu-west-2 | 0.555 |  |
| eu-west-3 | 0.570 |  |
| il-central-1 | 0.748 |  |
| me-central-1 | 0.961 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.675 |  |
| us-east-1 | 0.234 | 4820 |
| us-east-2 | 0.210 | 1652 |
| us-gov-east-1 | 0.216 | 1729 |
| us-gov-west-1 | 0.132 | 200 |
| us-west-1 | 0.077 | 3742 |
| us-west-2 | 0.132 | 164 |

