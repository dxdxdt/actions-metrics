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
Updated: 2026-05-01T08:55:47.479100+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.001 |  |
| ap-east-1 | 0.703 |  |
| ap-east-2 | 0.642 |  |
| ap-northeast-1 | 0.524 |  |
| ap-northeast-2 | 0.639 |  |
| ap-northeast-3 | 0.547 |  |
| ap-south-1 | 0.849 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.780 |  |
| ap-southeast-2 | 0.674 |  |
| ap-southeast-3 | 0.828 |  |
| ap-southeast-4 | 0.710 |  |
| ap-southeast-5 | 0.800 |  |
| ap-southeast-6 | 0.716 |  |
| ap-southeast-7 | 0.881 |  |
| ca-central-1 | 0.216 | 16 |
| ca-west-1 | 0.215 |  |
| eu-central-1 | 0.530 |  |
| eu-central-2 | 0.539 |  |
| eu-north-1 | 0.554 |  |
| eu-south-1 | 0.535 |  |
| eu-south-2 | 0.558 |  |
| eu-west-1 | 0.420 |  |
| eu-west-2 | 0.455 |  |
| eu-west-3 | 0.500 |  |
| il-central-1 | 0.673 |  |
| me-central-1 | 0.879 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.618 |  |
| us-east-1 | 0.174 | 4578 |
| us-east-2 | 0.155 | 1552 |
| us-gov-east-1 | 0.164 | 1669 |
| us-gov-west-1 | 0.200 | 194 |
| us-west-1 | 0.140 | 3509 |
| us-west-2 | 0.187 | 157 |

