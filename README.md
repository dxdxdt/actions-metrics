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
Updated: 2026-03-13T09:32:33.412993+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.032 |  |
| ap-east-1 | 0.682 |  |
| ap-east-2 | 0.623 |  |
| ap-northeast-1 | 0.500 |  |
| ap-northeast-2 | 0.607 |  |
| ap-northeast-3 | 0.528 |  |
| ap-south-1 | 0.911 |  |
| ap-south-2 | 0.910 |  |
| ap-southeast-1 | 0.753 |  |
| ap-southeast-2 | 0.645 |  |
| ap-southeast-3 | 0.810 |  |
| ap-southeast-4 | 0.693 |  |
| ap-southeast-5 | 0.774 |  |
| ap-southeast-6 | 0.697 |  |
| ap-southeast-7 | 0.854 |  |
| ca-central-1 | 0.220 | 16 |
| ca-west-1 | 0.193 |  |
| eu-central-1 | 0.536 |  |
| eu-central-2 | 0.567 |  |
| eu-north-1 | 0.588 |  |
| eu-south-1 | 0.561 |  |
| eu-south-2 | 0.577 |  |
| eu-west-1 | 0.462 |  |
| eu-west-2 | 0.494 |  |
| eu-west-3 | 0.522 |  |
| il-central-1 | 0.746 |  |
| me-central-1 | 0.928 |  |
| me-south-1 | 0.875 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.637 |  |
| us-east-1 | 0.193 | 4274 |
| us-east-2 | 0.170 | 1422 |
| us-gov-east-1 | 0.172 | 1567 |
| us-gov-west-1 | 0.161 | 180 |
| us-west-1 | 0.137 | 3218 |
| us-west-2 | 0.161 | 146 |

