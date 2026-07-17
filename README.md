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
Updated: 2026-07-17T20:59:08.923293+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.968 |  |
| ap-east-1 | 0.690 |  |
| ap-east-2 | 0.630 |  |
| ap-northeast-1 | 0.511 |  |
| ap-northeast-2 | 0.608 |  |
| ap-northeast-3 | 0.535 |  |
| ap-south-1 | 0.912 |  |
| ap-south-2 | 0.916 |  |
| ap-southeast-1 | 0.774 |  |
| ap-southeast-2 | 0.667 |  |
| ap-southeast-3 | 0.829 |  |
| ap-southeast-4 | 0.716 |  |
| ap-southeast-5 | 0.795 |  |
| ap-southeast-6 | 0.707 |  |
| ap-southeast-7 | 0.872 |  |
| ca-central-1 | 0.221 | 16 |
| ca-west-1 | 0.224 |  |
| eu-central-1 | 0.502 |  |
| eu-central-2 | 0.518 |  |
| eu-north-1 | 0.538 |  |
| eu-south-1 | 0.520 |  |
| eu-south-2 | 0.523 |  |
| eu-west-1 | 0.425 |  |
| eu-west-2 | 0.474 |  |
| eu-west-3 | 0.476 |  |
| il-central-1 | 0.664 |  |
| me-central-1 | 0.884 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.619 |  |
| us-east-1 | 0.175 | 4877 |
| us-east-2 | 0.193 | 1656 |
| us-gov-east-1 | 0.157 | 1764 |
| us-gov-west-1 | 0.200 | 203 |
| us-west-1 | 0.145 | 3793 |
| us-west-2 | 0.204 | 166 |

