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
Updated: 2026-02-21T18:24:30.597187+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.006 |  |
| ap-east-1 | 0.691 |  |
| ap-east-2 | 0.633 |  |
| ap-northeast-1 | 0.525 |  |
| ap-northeast-2 | 0.633 |  |
| ap-northeast-3 | 0.550 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.779 |  |
| ap-southeast-2 | 0.669 |  |
| ap-southeast-3 | 0.835 |  |
| ap-southeast-4 | 0.711 |  |
| ap-southeast-5 | 0.790 |  |
| ap-southeast-6 | 0.746 |  |
| ap-southeast-7 | 0.876 |  |
| ca-central-1 | 0.227 | 16 |
| ca-west-1 | 0.210 |  |
| eu-central-1 | 0.519 |  |
| eu-central-2 | 0.530 |  |
| eu-north-1 | 0.558 |  |
| eu-south-1 | 0.546 |  |
| eu-south-2 | 0.542 |  |
| eu-west-1 | 0.442 |  |
| eu-west-2 | 0.478 |  |
| eu-west-3 | 0.495 |  |
| il-central-1 | 0.701 |  |
| me-central-1 | 0.905 |  |
| me-south-1 | 0.858 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.627 |  |
| us-east-1 | 0.177 | 4159 |
| us-east-2 | 0.165 | 1363 |
| us-gov-east-1 | 0.174 | 1498 |
| us-gov-west-1 | 0.185 | 160 |
| us-west-1 | 0.141 | 3093 |
| us-west-2 | 0.188 | 129 |

