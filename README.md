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
Updated: 2026-08-08T04:07:20.136328+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.901 |  |
| ap-east-1 | 0.764 |  |
| ap-east-2 | 0.723 |  |
| ap-northeast-1 | 0.594 |  |
| ap-northeast-2 | 0.711 |  |
| ap-northeast-3 | 0.610 |  |
| ap-south-1 | 0.829 |  |
| ap-south-2 | 0.884 |  |
| ap-southeast-1 | 0.859 |  |
| ap-southeast-2 | 0.752 |  |
| ap-southeast-3 | 0.911 |  |
| ap-southeast-4 | 0.793 |  |
| ap-southeast-5 | 0.878 |  |
| ap-southeast-6 | 0.820 |  |
| ap-southeast-7 | 0.953 |  |
| ca-central-1 | 0.149 | 18 |
| ca-west-1 | 0.268 |  |
| eu-central-1 | 0.413 |  |
| eu-central-2 | 0.443 |  |
| eu-north-1 | 0.458 |  |
| eu-south-1 | 0.450 |  |
| eu-south-2 | 0.445 |  |
| eu-west-1 | 0.337 |  |
| eu-west-2 | 0.369 |  |
| eu-west-3 | 0.398 |  |
| il-central-1 | 0.581 |  |
| me-central-1 | 0.795 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.526 |  |
| us-east-1 | 0.092 | 4955 |
| us-east-2 | 0.112 | 1675 |
| us-gov-east-1 | 0.119 | 1809 |
| us-gov-west-1 | 0.273 | 212 |
| us-west-1 | 0.230 | 3896 |
| us-west-2 | 0.268 | 173 |

