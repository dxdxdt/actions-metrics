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
Updated: 2026-03-16T06:16:00.305058+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.948 |  |
| ap-east-1 | 0.744 |  |
| ap-east-2 | 0.689 |  |
| ap-northeast-1 | 0.567 |  |
| ap-northeast-2 | 0.681 |  |
| ap-northeast-3 | 0.591 |  |
| ap-south-1 | 0.928 |  |
| ap-south-2 | 0.982 |  |
| ap-southeast-1 | 0.827 |  |
| ap-southeast-2 | 0.728 |  |
| ap-southeast-3 | 0.879 |  |
| ap-southeast-4 | 0.769 |  |
| ap-southeast-5 | 0.848 |  |
| ap-southeast-6 | 0.804 |  |
| ap-southeast-7 | 0.932 |  |
| ca-central-1 | 0.134 | 16 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.455 |  |
| eu-central-2 | 0.481 |  |
| eu-north-1 | 0.518 |  |
| eu-south-1 | 0.484 |  |
| eu-south-2 | 0.497 |  |
| eu-west-1 | 0.390 |  |
| eu-west-2 | 0.413 |  |
| eu-west-3 | 0.436 |  |
| il-central-1 | 0.636 |  |
| me-central-1 | 0.820 |  |
| me-south-1 | 0.788 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.558 |  |
| us-east-1 | 0.098 | 4287 |
| us-east-2 | 0.100 | 1428 |
| us-gov-east-1 | 0.112 | 1577 |
| us-gov-west-1 | 0.230 | 185 |
| us-west-1 | 0.219 | 3240 |
| us-west-2 | 0.231 | 148 |

