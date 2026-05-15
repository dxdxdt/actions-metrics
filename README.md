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
Updated: 2026-05-15T15:58:53.918928+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.996 |  |
| ap-east-1 | 0.712 |  |
| ap-east-2 | 0.639 |  |
| ap-northeast-1 | 0.529 |  |
| ap-northeast-2 | 0.629 |  |
| ap-northeast-3 | 0.553 |  |
| ap-south-1 | 0.877 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.784 |  |
| ap-southeast-2 | 0.681 |  |
| ap-southeast-3 | 0.842 |  |
| ap-southeast-4 | 0.710 |  |
| ap-southeast-5 | 0.796 |  |
| ap-southeast-6 | 0.723 |  |
| ap-southeast-7 | 0.887 |  |
| ca-central-1 | 0.226 | 16 |
| ca-west-1 | 0.215 |  |
| eu-central-1 | 0.515 |  |
| eu-central-2 | 0.530 |  |
| eu-north-1 | 0.561 |  |
| eu-south-1 | 0.547 |  |
| eu-south-2 | 0.543 |  |
| eu-west-1 | 0.438 |  |
| eu-west-2 | 0.467 |  |
| eu-west-3 | 0.491 |  |
| il-central-1 | 0.676 |  |
| me-central-1 | 0.891 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.625 |  |
| us-east-1 | 0.177 | 4640 |
| us-east-2 | 0.156 | 1594 |
| us-gov-east-1 | 0.165 | 1692 |
| us-gov-west-1 | 0.195 | 195 |
| us-west-1 | 0.136 | 3564 |
| us-west-2 | 0.186 | 158 |

