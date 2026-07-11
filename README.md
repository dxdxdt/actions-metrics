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
Updated: 2026-07-11T15:46:44.866202+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.928 |  |
| ap-east-1 | 0.760 |  |
| ap-east-2 | 0.701 |  |
| ap-northeast-1 | 0.586 |  |
| ap-northeast-2 | 0.685 |  |
| ap-northeast-3 | 0.610 |  |
| ap-south-1 | 0.875 |  |
| ap-south-2 | 0.943 |  |
| ap-southeast-1 | 0.836 |  |
| ap-southeast-2 | 0.740 |  |
| ap-southeast-3 | 0.889 |  |
| ap-southeast-4 | 0.786 |  |
| ap-southeast-5 | 0.857 |  |
| ap-southeast-6 | 0.770 |  |
| ap-southeast-7 | 0.940 |  |
| ca-central-1 | 0.126 | 16 |
| ca-west-1 | 0.245 |  |
| eu-central-1 | 0.434 |  |
| eu-central-2 | 0.469 |  |
| eu-north-1 | 0.482 |  |
| eu-south-1 | 0.461 |  |
| eu-south-2 | 0.473 |  |
| eu-west-1 | 0.349 |  |
| eu-west-2 | 0.381 |  |
| eu-west-3 | 0.421 |  |
| il-central-1 | 0.584 |  |
| me-central-1 | 0.812 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.209 |  |
| sa-east-1 | 0.558 |  |
| us-east-1 | 0.089 | 4849 |
| us-east-2 | 0.095 | 1656 |
| us-gov-east-1 | 0.085 | 1738 |
| us-gov-west-1 | 0.258 | 202 |
| us-west-1 | 0.205 | 3765 |
| us-west-2 | 0.260 | 165 |

