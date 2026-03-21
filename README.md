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
Updated: 2026-03-21T03:59:07.766211+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.046 |  |
| ap-east-1 | 0.646 |  |
| ap-east-2 | 0.587 |  |
| ap-northeast-1 | 0.468 |  |
| ap-northeast-2 | 0.580 |  |
| ap-northeast-3 | 0.493 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.871 |  |
| ap-southeast-1 | 0.725 |  |
| ap-southeast-2 | 0.611 |  |
| ap-southeast-3 | 0.781 |  |
| ap-southeast-4 | 0.649 |  |
| ap-southeast-5 | 0.748 |  |
| ap-southeast-6 | 0.648 |  |
| ap-southeast-7 | 0.826 |  |
| ca-central-1 | 0.272 | 16 |
| ca-west-1 | 0.197 |  |
| eu-central-1 | 0.569 |  |
| eu-central-2 | 0.591 |  |
| eu-north-1 | 0.608 |  |
| eu-south-1 | 0.584 |  |
| eu-south-2 | 0.582 |  |
| eu-west-1 | 0.475 |  |
| eu-west-2 | 0.521 |  |
| eu-west-3 | 0.541 |  |
| il-central-1 | 0.734 |  |
| me-central-1 | 0.940 |  |
| me-south-1 | 0.887 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.657 |  |
| us-east-1 | 0.228 | 4318 |
| us-east-2 | 0.212 | 1443 |
| us-gov-east-1 | 0.212 | 1591 |
| us-gov-west-1 | 0.141 | 189 |
| us-west-1 | 0.087 | 3271 |
| us-west-2 | 0.142 | 148 |

