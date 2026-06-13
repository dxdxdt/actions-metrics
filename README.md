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
Updated: 2026-06-13T02:38:55.696272+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.991 |  |
| ap-east-1 | 0.699 |  |
| ap-east-2 | 0.637 |  |
| ap-northeast-1 | 0.519 |  |
| ap-northeast-2 | 0.627 |  |
| ap-northeast-3 | 0.543 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.775 |  |
| ap-southeast-2 | 0.659 |  |
| ap-southeast-3 | 0.825 |  |
| ap-southeast-4 | 0.699 |  |
| ap-southeast-5 | 0.794 |  |
| ap-southeast-6 | 0.705 |  |
| ap-southeast-7 | 0.876 |  |
| ca-central-1 | 0.232 | 16 |
| ca-west-1 | 0.204 |  |
| eu-central-1 | 0.513 |  |
| eu-central-2 | 0.550 |  |
| eu-north-1 | 0.556 |  |
| eu-south-1 | 0.548 |  |
| eu-south-2 | 0.543 |  |
| eu-west-1 | 0.435 |  |
| eu-west-2 | 0.475 |  |
| eu-west-3 | 0.492 |  |
| il-central-1 | 0.671 |  |
| me-central-1 | 0.879 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.625 |  |
| us-east-1 | 0.184 | 4748 |
| us-east-2 | 0.168 | 1632 |
| us-gov-east-1 | 0.177 | 1712 |
| us-gov-west-1 | 0.181 | 198 |
| us-west-1 | 0.136 | 3660 |
| us-west-2 | 0.181 | 163 |

