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
Updated: 2026-07-18T18:52:04.003406+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.920 |  |
| ap-east-1 | 0.770 |  |
| ap-east-2 | 0.711 |  |
| ap-northeast-1 | 0.592 |  |
| ap-northeast-2 | 0.693 |  |
| ap-northeast-3 | 0.617 |  |
| ap-south-1 | 0.857 |  |
| ap-south-2 | 0.898 |  |
| ap-southeast-1 | 0.848 |  |
| ap-southeast-2 | 0.723 |  |
| ap-southeast-3 | 0.903 |  |
| ap-southeast-4 | 0.773 |  |
| ap-southeast-5 | 0.869 |  |
| ap-southeast-6 | 0.768 |  |
| ap-southeast-7 | 0.951 |  |
| ca-central-1 | 0.166 | 16 |
| ca-west-1 | 0.270 |  |
| eu-central-1 | 0.443 |  |
| eu-central-2 | 0.465 |  |
| eu-north-1 | 0.485 |  |
| eu-south-1 | 0.460 |  |
| eu-south-2 | 0.472 |  |
| eu-west-1 | 0.364 |  |
| eu-west-2 | 0.402 |  |
| eu-west-3 | 0.414 |  |
| il-central-1 | 0.601 |  |
| me-central-1 | 0.843 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.540 |  |
| us-east-1 | 0.104 | 4881 |
| us-east-2 | 0.130 | 1657 |
| us-gov-east-1 | 0.128 | 1767 |
| us-gov-west-1 | 0.260 | 203 |
| us-west-1 | 0.198 | 3799 |
| us-west-2 | 0.260 | 167 |

