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
Updated: 2026-05-22T20:29:16.269193+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.872 |  |
| ap-east-1 | 0.819 |  |
| ap-east-2 | 0.766 |  |
| ap-northeast-1 | 0.647 |  |
| ap-northeast-2 | 0.754 |  |
| ap-northeast-3 | 0.670 |  |
| ap-south-1 | 0.815 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.887 |  |
| ap-southeast-2 | 0.798 |  |
| ap-southeast-3 | 0.937 |  |
| ap-southeast-4 | 0.858 |  |
| ap-southeast-5 | 0.909 |  |
| ap-southeast-6 | 0.843 |  |
| ap-southeast-7 | 1.012 |  |
| ca-central-1 | 0.100 | 16 |
| ca-west-1 | 0.270 |  |
| eu-central-1 | 0.388 |  |
| eu-central-2 | 0.404 |  |
| eu-north-1 | 0.432 |  |
| eu-south-1 | 0.413 |  |
| eu-south-2 | 0.418 |  |
| eu-west-1 | 0.306 |  |
| eu-west-2 | 0.343 |  |
| eu-west-3 | 0.366 |  |
| il-central-1 | 0.544 |  |
| me-central-1 | 0.774 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.493 |  |
| us-east-1 | 0.050 | 4676 |
| us-east-2 | 0.083 | 1607 |
| us-gov-east-1 | 0.084 | 1700 |
| us-gov-west-1 | 0.331 | 195 |
| us-west-1 | 0.275 | 3587 |
| us-west-2 | 0.327 | 158 |

