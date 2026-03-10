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
Updated: 2026-03-10T10:32:33.379220+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.958 |  |
| ap-east-1 | 0.747 |  |
| ap-east-2 | 0.688 |  |
| ap-northeast-1 | 0.564 |  |
| ap-northeast-2 | 0.667 |  |
| ap-northeast-3 | 0.589 |  |
| ap-south-1 | 0.952 |  |
| ap-south-2 | 0.992 |  |
| ap-southeast-1 | 0.814 |  |
| ap-southeast-2 | 0.728 |  |
| ap-southeast-3 | 0.868 |  |
| ap-southeast-4 | 0.774 |  |
| ap-southeast-5 | 0.831 |  |
| ap-southeast-6 | 0.820 |  |
| ap-southeast-7 | 0.915 |  |
| ca-central-1 | 0.159 | 16 |
| ca-west-1 | 0.204 |  |
| eu-central-1 | 0.477 |  |
| eu-central-2 | 0.494 |  |
| eu-north-1 | 0.527 |  |
| eu-south-1 | 0.502 |  |
| eu-south-2 | 0.506 |  |
| eu-west-1 | 0.406 |  |
| eu-west-2 | 0.435 |  |
| eu-west-3 | 0.460 |  |
| il-central-1 | 0.642 |  |
| me-central-1 | 0.847 |  |
| me-south-1 | 0.807 |  |
| mx-central-1 | 0.206 |  |
| sa-east-1 | 0.571 |  |
| us-east-1 | 0.118 | 4252 |
| us-east-2 | 0.087 | 1415 |
| us-gov-east-1 | 0.084 | 1552 |
| us-gov-west-1 | 0.215 | 177 |
| us-west-1 | 0.231 | 3205 |
| us-west-2 | 0.215 | 144 |

