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
Updated: 2026-03-08T22:16:44.441559+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.885 |  |
| ap-east-1 | 0.782 |  |
| ap-east-2 | 0.721 |  |
| ap-northeast-1 | 0.600 |  |
| ap-northeast-2 | 0.717 |  |
| ap-northeast-3 | 0.625 |  |
| ap-south-1 | 0.843 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.864 |  |
| ap-southeast-2 | 0.760 |  |
| ap-southeast-3 | 0.926 |  |
| ap-southeast-4 | 0.806 |  |
| ap-southeast-5 | 0.885 |  |
| ap-southeast-6 | 0.800 |  |
| ap-southeast-7 | 0.967 |  |
| ca-central-1 | 0.127 | 16 |
| ca-west-1 | 0.279 |  |
| eu-central-1 | 0.392 |  |
| eu-central-2 | 0.420 |  |
| eu-north-1 | 0.449 |  |
| eu-south-1 | 0.433 |  |
| eu-south-2 | 0.426 |  |
| eu-west-1 | 0.328 |  |
| eu-west-2 | 0.360 |  |
| eu-west-3 | 0.374 |  |
| il-central-1 | 0.590 |  |
| me-central-1 | 0.782 |  |
| me-south-1 | 0.740 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.499 |  |
| us-east-1 | 0.073 | 4245 |
| us-east-2 | 0.101 | 1409 |
| us-gov-east-1 | 0.112 | 1546 |
| us-gov-west-1 | 0.292 | 175 |
| us-west-1 | 0.231 | 3196 |
| us-west-2 | 0.294 | 144 |

