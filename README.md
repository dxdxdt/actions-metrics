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
Updated: 2026-03-26T20:29:47.171162+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.906 |  |
| ap-east-1 | 0.769 |  |
| ap-east-2 | 0.708 |  |
| ap-northeast-1 | 0.596 |  |
| ap-northeast-2 | 0.694 |  |
| ap-northeast-3 | 0.617 |  |
| ap-south-1 | 0.862 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.847 |  |
| ap-southeast-2 | 0.754 |  |
| ap-southeast-3 | 0.897 |  |
| ap-southeast-4 | 0.809 |  |
| ap-southeast-5 | 0.867 |  |
| ap-southeast-6 | 0.827 |  |
| ap-southeast-7 | 0.955 |  |
| ca-central-1 | 0.116 | 16 |
| ca-west-1 | 0.251 |  |
| eu-central-1 | 0.418 |  |
| eu-central-2 | 0.437 |  |
| eu-north-1 | 0.483 |  |
| eu-south-1 | 0.445 |  |
| eu-south-2 | 0.492 |  |
| eu-west-1 | 0.335 |  |
| eu-west-2 | 0.377 |  |
| eu-west-3 | 0.398 |  |
| il-central-1 | 0.585 |  |
| me-central-1 | 0.786 |  |
| me-south-1 | 0.748 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.536 |  |
| us-east-1 | 0.082 | 4365 |
| us-east-2 | 0.087 | 1457 |
| us-gov-east-1 | 0.086 | 1606 |
| us-gov-west-1 | 0.266 | 190 |
| us-west-1 | 0.217 | 3303 |
| us-west-2 | 0.264 | 151 |

