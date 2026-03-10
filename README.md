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
Updated: 2026-03-10T13:57:33.984039+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.919 |  |
| ap-east-1 | 0.784 |  |
| ap-east-2 | 0.721 |  |
| ap-northeast-1 | 0.601 |  |
| ap-northeast-2 | 0.705 |  |
| ap-northeast-3 | 0.626 |  |
| ap-south-1 | 0.916 |  |
| ap-south-2 | 0.963 |  |
| ap-southeast-1 | 0.856 |  |
| ap-southeast-2 | 0.774 |  |
| ap-southeast-3 | 0.909 |  |
| ap-southeast-4 | 0.838 |  |
| ap-southeast-5 | 0.870 |  |
| ap-southeast-6 | 0.887 |  |
| ap-southeast-7 | 0.949 |  |
| ca-central-1 | 0.112 | 16 |
| ca-west-1 | 0.235 |  |
| eu-central-1 | 0.438 |  |
| eu-central-2 | 0.459 |  |
| eu-north-1 | 0.501 |  |
| eu-south-1 | 0.465 |  |
| eu-south-2 | 0.474 |  |
| eu-west-1 | 0.366 |  |
| eu-west-2 | 0.397 |  |
| eu-west-3 | 0.416 |  |
| il-central-1 | 0.599 |  |
| me-central-1 | 0.796 |  |
| me-south-1 | 0.782 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.547 |  |
| us-east-1 | 0.085 | 4253 |
| us-east-2 | 0.074 | 1416 |
| us-gov-east-1 | 0.074 | 1553 |
| us-gov-west-1 | 0.263 | 177 |
| us-west-1 | 0.259 | 3205 |
| us-west-2 | 0.255 | 144 |

